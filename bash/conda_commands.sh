#!/bin/env/usr bash

# If conda package is available on Anaconda, you can install it on the cluster
# https://anaconda.org/bioconda/bowtie2

sbatch -c 4 --mem=32G -p PARTITION --job-name conda --out slurm-%j-%x.out --wrap="conda create -y -p /Drives/FOLDER/FOLDER2/conda/bowtie2-2.4.5 bowtie2==2.4.5"


### https://anaconda.org/bioconda/vcftools
sbatch -c 4 --mem=32G -p PARTITION --job-name conda --out slurm-%j-%x.out --wrap="conda create -y -p /Drives/FOLDER/FOLDER2/conda/vcftools-0.1.16 vcftools==0.1.16"


### https://anaconda.org/bioconda/bwa-mem2
sbatch -c 4 --mem=32G -p PARTITION --job-name conda --out slurm-%j-%x.out --wrap="conda create -y -p /Drives/FOLDER/FOLDER2/conda/bwa-mem2-2.2.1 bwa-mem2==2.2.1"
