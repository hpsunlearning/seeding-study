# Notebooks for Restoration of the microbiome trajectory by vaginal seeding of C-section born infants

The script `run.sh` will re-generate all of the figures and tables from the
analysis. Certain sections of code, such as those using heavy compute
are skipped in `run.sh`. However, the code for those analyses are still included
here.

#### Data table generation and preprocessing

* Building tables, taxonomy, trees from qiita preps. This step will collate all of the Qiita tables into one final table.
    * 0.0.1-qiita-preprocessing.ipynb

* Splitting data by mom/baby and body-site. This step splits the tables by if the subject is a mom or baby and by body-site.
    * 0.0.2-data-clean-and-split.ipynb

* Final cleaning of metadata to ensure no mislabeled samples.
    * 0.0.3-AdditionalMiscProcessing.ipynb

#### Analysis (split by method)

* Compositional Tensor Factorization (CTF). This step performs the CTF dimensionality reduction.
    * 1.1.0-infant-ctf-analysis.ipynb
    * 1.1.2-ctf-ordination-plotting-stats.ipynb

* Songbird. This step will produce stats on the quality of the Songbird models and plot the songbird differentials.
    * 2.1.5-songbird-analysis-TP-model-with-training
    * 2.2.1-differential-taxa-analysis-preprocessing.Rmd
    * 2.4.0-differential-taxa-analysis-summary.Rmd

* Alpha Diversity Analysis. This step will perform alpha diversity analysis.
    * 3.0.0-alpha-diversity.ipynb
    * 3.1.0-alpha-diversity-supp-analysis.Rmd

* UniFrac & Convex Hulls. This step performs the convex hull analysis on the ordination from UniFrac distances. 
    * 5.0.2-convex-hulls.ipynb
    * 5.1.1-convex-hulls.Rmd

* FEAST (microbial source tracking). This step will perform microbial source tracking across time with mothers as sources and infants as sinks.
    * 6.1.0-SourceTracking.Rmd

* Misc. Additional notebooks for quality control and generating supplementary data and plots
    * 7.2.0-ContrlChecking.Rmd
    * 8.0.0-GauzeChecking.Rmd
    * 11.0.0-beta-diversity.sh
    * 11.1.0-beta-diversity-analysis.Rmd
    * Other \*.Rdata/\*.Rds that may be needed for the analysis
