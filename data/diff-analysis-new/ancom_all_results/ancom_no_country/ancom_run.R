#!/usr/bin/env Rscript
tryCatch(expr = {devtools::source_url("https://raw.githubusercontent.com/sidhujyatha/ANCOM/master/ANCOM_updated_code_06_06_2020.R", sha1 = "c38079a8387079d5218605142578c8d7767925d5")}, error = function(e){})
library(tidyverse)

ancom_wrap_phyloseq <- function(phylo_obj, rarefy = NULL, ...){
    require(phyloseq)
    if(! is.null(rarefy)){
        phylo_obj = rarefy_even_depth(phylo_obj, rarefy, 
                                      replace = F, 
                                      trimOTUs = T,
                                      rngseed = 20)
    }
    ft <- phylo_obj %>% otu_table() %>% as.matrix() %>% as.data.frame() %>%t() # feature table is in a format that a column of taxa with additional columns of counts from each samples
    tax_tbl <- tax_table(phylo_obj) %>% as.matrix() %>% 
        as.data.frame() %>% rownames_to_column(var = "Taxa_id") %>% 
        mutate(tax_ind = paste0("Taxa", seq(n())))
    colnames(ft) <- tax_tbl$tax_ind[match(colnames(ft), tax_tbl$Taxa_id)]
    
    ft <- ft %>% as.data.frame %>% rownames_to_column(var = "Sample.ID")
    mf <- sample_data(phylo_obj) %>% as.matrix() %>% as.data.frame() %>%
        rownames_to_column(var = "Sample.ID")
    
    ancom_mod <- ANCOM.main(OTUdat = ft, Vardat = mf, ...)
    ancom_mod$W.taxa <- ancom_mod$W.taxa %>% merge(., tax_tbl, by.x = 1, by.y = "tax_ind", all.x = T)
    return(ancom_mod)
}

args = commandArgs(trailingOnly=TRUE)
# test if there is at least one argument: if not, return an error
if (length(args)==0) {
    stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==2) {
    # default output file
    args[3] = 8
}
np.2 = as.numeric(args[3])

load(args[1])
ll = args[2]
print(args)
ancom_rsl = parallel::mclapply(all_phylo[[ll]], function(x){ancom_wrap_phyloseq(x, rarefy = 5000, adjusted = T, main.var = "birth_mode_ms", adj.formula = "country", repeated = F, repeat.var = NULL, longitudinal = F, random.formula = NULL, multcorr = 2, sig = 0.05, prev.cut = 0.9)}, mc.cores = np.2)
saveRDS(ancom_rsl, file = paste0("ancom_rsl_", ll, ".rds"))
