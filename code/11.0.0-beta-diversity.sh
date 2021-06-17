# Create beta diversity distance matrix for individual baby sites
qiime diversity beta --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-diversity/Baby-Feces-aitchison/ &>BabyFecesAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-diversity/Baby-Forearm-aitchison/ &>BabyForearmAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-diversity/Baby-Mouth-aitchison/ &>BabyMouthAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --p-metric 'braycurtis' --p-n-jobs 8 --output-dir ../data/beta-diversity/Baby-Feces-braycurtis/ &>BabyFecesbraycurtis.log &

qiime diversity beta --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --p-metric 'braycurtis' --p-n-jobs 8 --output-dir ../data/beta-diversity/Baby-Forearm-braycurtis/ &>BabyForearmbraycurtis.log &

qiime diversity beta --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --p-metric 'braycurtis' --p-n-jobs 8 --output-dir ../data/beta-diversity/Baby-Mouth-braycurtis/ &>BabyMouthbraycurtis.log &



qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-diversity/Baby-Feces-unifrac/ &>BabyFecesUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-diversity/Baby-Forearm-unifrac/ &>BabyForearmUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-diversity/Baby-Mouth-unifrac/ &>BabyMouthUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-diversity/Baby-Feces-wunifrac/ &>BabyFecesWUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-diversity/Baby-Forearm-wunifrac/ &>BabyForearmWUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-diversity/Baby-Mouth-wunifrac/ &>BabyMouthWUnifrac.log &

# Create beta diversity distance matrix for all samples, rarefied and original
 qiime feature-table rarefy --i-table ../data/processed-data/table.qza --p-sampling-depth 5000 --o-rarefied-table ../data/processed-data/rarefy-table-5k.qza &>Rarefy_processed_table.log &

qiime diversity beta --i-table ../data/processed-data/rarefy-table-5k.qza --p-metric 'aitchison' --p-n-jobs 24 --output-dir ../data/beta-diversity/rarefied-aitchison/ &>RarefiedAitchison.log &
qiime diversity beta --i-table ../data/processed-data/rarefy-table-5k.qza --p-metric 'braycurtis' --p-n-jobs 8 --output-dir ../data/beta-diversity/rarefied-bray/ &>Rarefiedbray.log &
qiime diversity beta-phylogenetic --i-table ../data/processed-data/rarefy-table-5k.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric unweighted_unifrac --p-n-jobs 12 --output-dir ../data/beta-diversity/rarefied-unifrac/ &>RarefiedUnifrac.log &
qiime diversity beta-phylogenetic --i-table ../data/processed-data/rarefy-table-5k.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric weighted_unifrac --p-n-jobs 12 --output-dir ../data/beta-diversity/rarefied-wunifrac/ &>RarefiedWUnifrac.log &


qiime diversity beta --i-table ../data/processed-data/table.qza --p-metric aitchison --p-n-jobs 8 --output-dir ../data/beta-diversity/original-aitchison/ &>OriginalAitchison.log &
qiime diversity beta --i-table ../data/processed-data/table.qza --p-metric braycurtis --p-n-jobs 8 --output-dir ../data/beta-diversity/original-bray/ &>Originalbray.log &
qiime diversity beta-phylogenetic --i-table ../data/processed-data/table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric unweighted_unifrac --p-n-jobs 8 --output-dir ../data/beta-diversity/original-unifrac/ &>OriginalUnifrac.log &
qiime diversity beta-phylogenetic --i-table ../data/processed-data/table.qza --i-phylogeny ../data/processed-data/tree.qza --p-metric weighted_unifrac --p-n-jobs 8 --output-dir ../data/beta-diversity/original-wunifrac/ &>OriginalWUnifrac.log &
