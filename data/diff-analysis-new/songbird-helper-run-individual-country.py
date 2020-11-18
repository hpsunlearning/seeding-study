#!/usr/bin/env python3
import os
import click
import shutil
import subprocess
import pandas as pd
import glob
import numpy as np
from biom import Table, load_table
import qiime2 as q2
from biom.util import biom_open
from scipy.stats import sem
from qiime2.plugins.feature_table.methods import rarefy

@click.command()
@click.option(
    "--input-qza", show_default=True, required=True)
@click.option(
    "--metadata-file", show_default=True, required=True)
@click.option(
    "--out-dir", show_default=True, required=True)
@click.option(
    "--country", required=True,
    type=click.Choice(['USA', 'Chile', 'Spain'], case_sensitive=False))

def songbird_gird_search(input_qza, metadata_file, out_dir, country):

    """
    Run a simple grid search of songbird perams/formulas
    against a baseline model for the MG seeding project.
    """
    q2bt = q2.Artifact.load(input_qza)
    bt = q2bt.view(Table)
    mf = pd.read_table(metadata_file, header = 0).dropna(1, how = 'all')

    # filter mf
    mf_wk = mf[mf.country==country]
    mf_wk.set_index('sample_name', inplace=True)
    bt_wk = bt.copy()
    bt_wk = bt_wk.filter(mf_wk.index)
    bt_wk = bt_wk.filter(bt_wk.ids('observation')[bt_wk.sum('observation') > 0],
                             axis='observation')
    mf_wk = mf_wk.reindex(bt_wk.ids())

    # write

    tmp_dir = os.path.join(out_dir, 'tmp')
    # make the dir (if already made rewrite)
    if os.path.exists(tmp_dir):
        shutil.rmtree(tmp_dir)
    os.makedirs(tmp_dir)

    with biom_open(os.path.join(tmp_dir,'table.biom'), 'w') as f:
        bt_wk.to_hdf5(f, "bs_type")
    mf_wk.to_csv(os.path.join(tmp_dir,'metadata.tsv'), sep='\t')

    # min number of counts/sample
    min_samp = 1000
    # store summary
    summary_interval = 15
    # epochs
    epch = 500
    # baseline songbird and formula
    time_split = 0
    # formulas
    formulas = ['1', 'C(birth_mode_ms, Treatment("Vag"))']
    # feat freq.
    ffq = [0.05, 0.10]
    # convert those to samp. #'s
    tbl_ = load_table(os.path.join(tmp_dir,'table.biom'))
    ffq = [int(f_ * tbl_.shape[1])
           for f_ in ffq]
    # learning rates
    lrs = 0.001
    # batch sizes
    bss = [.10, .20, .40]
    bss = [int(f_ * tbl_.shape[1])
           for f_ in bss]
    # differential prior
    dps = [.25, .5]
    """
    Run all of the perams above
    """
    input_biom = os.path.join(tmp_dir,'table.biom')
    mf = os.path.join(tmp_dir,'metadata.tsv')
    # run each peram(s) set
    for formula_ in formulas:
        for feat_ in ffq:
            for bs_ in bss:
                for dp_ in dps:
                    # get output dir
                    out_ = '-'.join(list(map(str, [formula_, feat_, bs_, dp_])))
                    out_ = os.path.join(out_dir, country, out_)
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
                                          '--learning-rate', str(lrs),
                                          '--min-sample-count', str(min_samp),
                                          '--min-feature-count', str(feat_),
                                          '--summary-interval', str(summary_interval),
                                          '--summary-dir', str(out_),
					  '--random-seed', str(42)],
                                         stdout=subprocess.PIPE)
                    out, err = p.communicate()

if __name__ == '__main__':
    songbird_gird_search()
