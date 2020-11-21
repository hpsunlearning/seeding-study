#!/usr/bin/env python3
import os
import click
import shutil
import subprocess
import pandas as pd
import numpy as np
from biom import Table, load_table
import qiime2 as q2
from biom.util import biom_open
from scipy.stats import sem
from qiime2.plugins.feature_table.methods import rarefy

@click.command()
@click.option(
    "--input-biom", show_default=True, required=True)
@click.option(
    "--metadata-file", show_default=True, required=True)
@click.option(
    "--out-dir", show_default=True, required=True)

def songbird_gird_search(input_biom, metadata_file, out_dir):
    """
    Run a simple grid search of songbird perams/formulas
    against a baseline model for the MG seeding project.
    """
    
    """
    mf = pd.read_table(metadata_file, header=0).dropna(1, how='all')

    # add training columns
    ## randomly select 6 training samples per birthmode group
    Training = mf.groupby('birth_mode_ms').apply(lambda x: x.sample(n=6, random_state=42)).sample_name.values
    mf['songbird_train'] = np.where(mf.sample_name.isin(Training), "Train", "Test")
    mf.set_index('sample_name', inplace=True)
    # write
    if os.path.exists(out_dir):
        shutil.rmtree(out_dir)
    os.makedirs(out_dir)
    mf.to_csv(os.path.join(out_dir, 'metadata.tsv'), sep='\t')
    """
    
    # min number of counts/sample
    min_samp = 1000
    # store summary
    summary_interval = 15
    # epochs
    epch = 500
    # baseline songbird and formula
    time_split = 0
    # formulas
    formulas = ['1', 
                'C(birth_mode_ms, Treatment("Vag"))',
                'C(birth_mode_ms, Treatment("Vag")) + country']
    # feat freq.
    ffq = [0.05, 0.10]
    # convert those to samp. #'s
    tbl_ = load_table(input_biom)
    ffq = [int(f_ * tbl_.shape[1])
           for f_ in ffq]
    # learning rates
    lrs = 0.001
    # batch sizes
    bss = [.10, .20]
    bss = [int(f_ * tbl_.shape[1])
           for f_ in bss]
    # differential prior
    dps = [.25, .5]
    # training columns
    #train = 'songbird_train'
    # random train test examples
    n_train = 10
    """
    Run all of the perams above
    """
    # run each peram(s) set
    for formula_ in formulas:
        for feat_ in ffq:
            for bs_ in bss:
                for dp_ in dps:
                    # get output dir
                    out_ = '-'.join(list(map(str, [formula_, feat_, bs_, dp_])))
                    out_ = os.path.join(out_dir, out_)
                    # make the dir (if already made rewrite)
                    if os.path.exists(out_):
                        shutil.rmtree(out_)
                    os.makedirs(out_)
                    # run songbird (save output to out_)
                    p = subprocess.Popen(['songbird', 'multinomial',
                                          '--input-biom', str(input_biom),
                                          '--metadata-file', str(mf),
                                          '--formula', str(formula_),
                                          '--batch-size', str(bs_),
                                          '--epochs', str(epch),
                                          '--differential-prior', str(dp_),
                                          #'--training-column', str(train),
                                          '--num-random-test-examples', str(n_train),
                                          '--learning-rate', str(lrs),
                                          '--min-sample-count', str(min_samp),
                                          '--min-feature-count', str(feat_),
                                          '--summary-interval', str(summary_interval),
                                          '--summary-dir', str(out_),
                                          '--random-seed', str(42)],
                                         stdout=subprocess.PIPE)
                    out, err = p.communicate()
    print('Completed')


if __name__ == '__main__':
    songbird_gird_search()
