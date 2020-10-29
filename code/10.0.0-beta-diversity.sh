qiime diversity beta --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-results/Baby-Feces-aitchison/ &>BabyFecesAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-results/Baby-Forearm-aitchison/ &>BabyForearmAitchison.log &

qiime diversity beta --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --p-metric 'aitchison' --p-n-jobs 8 --output-dir ../data/beta-results/Baby-Mouth-aitchison/ &>BabyMouthAitchison.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Feces-unifrac/ &>BabyFecesUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Forearm-unifrac/ &>BabyForearmUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --i-phylogeny tree.qza --p-metric unweighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Mouth-unifrac/ &>BabyMouthUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Feces/rarefy-table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Feces-wunifrac/ &>BabyFecesWUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Forearm/rarefy-table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Forearm-wunifrac/ &>BabyForearmWUnifrac.log &

qiime diversity beta-phylogenetic --i-table ../data/split-data/Baby-Mouth/rarefy-table.qza --i-phylogeny tree.qza --p-metric weighted_unifrac --p-n-jobs 4 --output-dir ../data/beta-results/Baby-Mouth-wunifrac/ &>BabyMouthWUnifrac.log &