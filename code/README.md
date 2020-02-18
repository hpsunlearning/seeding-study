# Notebooks for Normalization of the microbiome first year trajectory by vaginal seeding in C-section born infants 

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

* Compositional Tensor Factorization (CTF). This step performs the CTF dimensionality reduction used in `Figure 1a`, `Extended Data Figure 2`, `Extended Data Figure 3.pdf`, and `Extended Data Table 3.tsv`.
    * 1.1.0-infant-ctf-analysis.ipynb
    * 1.1.1-ctf-ordination-plotting-stats.ipynb

* UniFrac & Convex Hulls. This step performs the convex hull analysis on the ordination from UniFrac distances. `Figure 1b` & `Extended Data Table 4`. 
    * 5.0.0-convex-hulls.ipynb

* Alpha Diversity Analysis. This step will perform alpha diversity analysis. `Extended Data Figure 1`.
    * 3.0.0-alpha-diversity.ipynb

* Songbird. This step will produce stats on the quality of the Songbird models and plot the songbird differentials. `Figure 1c` & `Extended Data Table 6`.
    * 2.1.0-songbird-models.ipynb
    * 2.2.0-differentials-plotting.ipynb

* maturity index z-scores (MAZ). This step will produce, plot, and test the MAZ scores. `Extended Data Table 5` & `Extended Data Figure 4`.
    * 4.0.0-MAZ-scores.ipynb

* FEAST (microbial source tracking). This step will perform microbial source tracking across time with mothers as sources and infants as sinks. `Extended Data Figure 5`
    * 6.0.0-SourceTracking.Rmd

`Note: Extended Data Tables 1 & 2 are also produced and save in these notebooks.` 