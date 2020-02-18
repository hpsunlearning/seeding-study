#!/usr/bin/env bash

: '
This is the master script for producing reproducible runs of the analysis.
This script reproduces all of the figures from stored results. It
also includes some evaluations of results but does not include
the preprocessing from raw data. All of the resulting figures
and tables are output in the "results" directory.
'
# increase timeout
timout_limit=1800

# CTF ordination/distance plotting and stat. analysis
jupyter nbconvert --execute 1.1.1-ctf-ordination-plotting-stats.ipynb\
                  --ExecutePreprocessor.timeout=$timout_limit
# Convex hull on UniFrac
jupyter nbconvert --execute 5.0.0-convex-hulls.ipynb\
                  --ExecutePreprocessor.timeout=$timout_limit
# Alpha-Diversity
jupyter nbconvert --execute 3.0.0-alpha-diversity.ipynb\
                  --ExecutePreprocessor.timeout=$timout_limit
# Songbird (model optimization)
jupyter nbconvert --execute 2.1.0-songbird-models.ipynb\
                  --ExecutePreprocessor.timeout=$timout_limit
# Songbird (plotting)
jupyter nbconvert --execute 2.2.0-differentials-plotting.ipynb\
                  --ExecutePreprocessor.timeout=$timout_limit
# MAZ
jupyter nbconvert --execute 4.0.0-MAZ-scores.ipynb\
                  --ExecutePreprocessor.timeout=$timout_limit
