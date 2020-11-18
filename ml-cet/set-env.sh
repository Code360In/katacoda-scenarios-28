#!/bin/bash
# Download the Anaconda3 Install script
wget -q https://repo.continuum.io/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -f -b -p /opt/conda && \
    /opt/conda/bin/conda install --yes && \
    rm /tmp/miniconda.sh

export PATH=/opt/conda/bin:$PATHclear
