#!/bin/env/usr bash

# If conda package is available on Anaconda, you can install it on the cluster
# https://anaconda.org/bioconda/bowtie2

sbatch -c 4 --mem=32G -p NMLResearch --job-name conda --wrap="conda create -y -p /Drives/L/EEVL/conda/bowtie2-2.4.5 bowtie2==2.4.5"


### https://anaconda.org/bioconda/vcftools
sbatch -c 4 --mem=32G -p NMLResearch --job-name conda --wrap="conda create -y -p /Drives/L/EEVL/conda/vcftools-0.1.16 vcftools==0.1.16"


### https://anaconda.org/bioconda/bwa-mem2
sbatch -c 4 --mem=32G -p NMLResearch --job-name conda --wrap="conda create -y -p /Drives/L/EEVL/conda/bwa-mem2-2.2.1 bwa-mem2==2.2.1"
