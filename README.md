# Normalization of the microbiome first year trajectory by vaginal seeding in C-section born infants

This repository includes all the source code, tests and notebooks to generate the figures used in the (Song et al. 2020). Each analysis step is outlined [here](https://github.com/knightlab-analyses/seeding-study/tree/master/code#notebooks-for-normalization-of-the-microbiome-first-year-trajectory-by-vaginal-seeding-in-c-section-born-infants).

## Notes to the reader

While we do not provide all the data in this repository we provide the BIOM tables, sample information, alpha and beta diversity tables. The raw and quality controlled sequences from which the BIOM table originates can be found in Qiita study 10894, 10249, and 1718 (remember to login).

EBI Accession: `coming soon`.

### Repository Structure

* code

This directory contains the code (as notebooks) for each step in a numerically organized format. More descriptions can be found within the README file for that directory.

* data

This directory contains the input data, along with some output from computationally expensive tools. 

* results

The main and extended figures and tables from the paper which can be reproduced by running the notebooks within the `code` directory.

* tutorials

This directory contains the toy examples used in the `supplemental discussion`.

### Notebooks

#### Setup

There are two options for setup to run the notebooks.

The first option is a QIIME 2019.10 environment amended with any additional plugins. This option is preferable for `OSX` users. The conda yml file is provided in `environment/conda`.

The second option is a Docker file. This option is preferable for `linux` users. The docker files are provided in `environment/docker`.

#### Running

Within the code directory each notebook is described. Many of the notebooks contain compute heavy steps (e.g. running Songbird grid-search on table subsets). To facilitate the reproduction of the results a subset of notebooks can be run from results on compute heavy steps. A summary script located in `code/run.sh`, will run all compute reasonable analysis at once. This script will populate the `results` directory with all of the extended tables and figures used in the paper.
