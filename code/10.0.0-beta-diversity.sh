qiime diversity beta --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-results/Baby-Feces-aitchison/ &>BabyFecesAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-results/Baby-Forearm-aitchison/ &>BabyForearmAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-results/Baby-Mouth-aitchison/ &>BabyMouthAitchison.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Feces-unifrac/ &>BabyFecesUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Forearm-unifrac/ &>BabyForearmUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Mouth-unifrac/ &>BabyMouthUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Feces-wunifrac/ &>BabyFecesWUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Forearm-wunifrac/ &>BabyForearmWUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Mouth-wunifrac/ &>BabyMouthWUnifrac.log &


 qiime feature-table rarefy --i-table ../data/processed-data/table.qza --p-sampling-depth 5000 --o-rarefied-table ../data/processed-data/rarefy-table-5k.qza &>Rarefy_processed_table.log &

qiime diversity beta --i-table rarefy-table-5k.qza --p-metric 'aitchison' --p-n-jobs 24 --output-dir rarefied-aitchison/ &>RarefiedAitchison.log &
qiime diversity beta --i-table rarefy-table-5k.qza --p-metric 'braycurtis' --p-n-jobs 8 --output-dir rarefied-bray/ &>Rarefiedbray.log &
qiime diversity beta-phylogenetic --i-table rarefy-table-5k.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 12 --output-dir rarefied-unifrac/ &>RarefiedUnifrac.log &
qiime diversity beta-phylogenetic --i-table rarefy-table-5k.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 12 --output-dir rarefied-wunifrac/ &>RarefiedWUnifrac.log &


qiime diversity beta --i-table table.qza --p-metric aitchison --p-n-jobs 8 --output-dir original-aitchison/ &>OriginalAitchison.log &
qiime diversity beta --i-table table.qza --p-metric braycurtis --p-n-jobs 8 --output-dir original-bray/ &>Originalbray.log &
qiime diversity beta-phylogenetic --i-table table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 8 --output-dir original-unifrac/ &>OriginalUnifrac.log &
qiime diversity beta-phylogenetic --i-table table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 8 --output-dir original-wunifrac/ &>OriginalWUnifrac.log &
