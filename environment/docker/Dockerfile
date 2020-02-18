ARG DEBIAN_FRONTEND=noninteractive

ADD qiime2-2019.10-py36-linux-conda.yml qiime2-2019.10-py36-linux-conda.yml
RUN conda env create -n qiime2-2019.7 -f qiime2-2019.10-py36-linux-conda.yml
RUN echo "conda activate qiime2-2019.7" > ~/.bashrc
ENV PATH /opt/conda/envs/qiime2-2019.7/bin:$PATH
RUN conda install -c conda-forge songbird
RUN pip install -U --no-cache-dir \
    gemelli==0.0.5
RUN pip install -U --no-cache-dir \
    biopython
RUN pip install -U --no-cache-dir \
    python-ternary
RUN pip install -U --no-cache-dir \
    git+https://github.com/biocore/songbird


COPY postInstall /
RUN /postInstall
