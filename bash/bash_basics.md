# BASH shebang
`#!/bin/env/usr bash`


# Mounting drives on personal PC using WSL
go to: /mnt/ (Windows 10)
`mkdir -p FOLDER`
Mount drive 
`sudo mount -t drvfs '\\NETWORK_ADDRESS\FOLDER' /mnt/FOLDER`


# Convert .txt to .csv file
`cat input.txt`
```
file1.sh 2001 new
file2.sh 2002 old
file3.sh 2003 old 
file4.sh 2004 new
```
Convert .txt output into .csv for R Studio or other types of data analysis

`sed 's/ \+/,/g' input.txt > output.csv`

`cat output.csv`
```
file1.sh,2001,new
file2.sh,2002,old
file3.sh,2003,old 
file4.sh,2004,new
```

# Install conda package
If conda package is available on Anaconda, you can install it on the cluster
i.e. https://anaconda.org/bioconda/bowtie2
`sbatch -c 4 --mem=32G -p PARTITION --job-name conda --wrap="conda create -y -p /Drives/FOLDER/FOLDER2/conda/bowtie2-2.4.5 bowtie2==2.4.5"`

i.e. https://anaconda.org/bioconda/vcftools
`sbatch -c 4 --mem=32G -p PARTITION --job-name conda --wrap="conda create -y -p /Drives/FOLDER/FOLDER2/conda/vcftools-0.1.16 vcftools==0.1.16"`

i.e. https://anaconda.org/bioconda/bwa-mem2
`sbatch -c 4 --mem=32G -p PARTITION --job-name conda --wrap="conda create -y -p /Drives/FOLDER/FOLDER2/conda/bwa-mem2-2.2.1 bwa-mem2==2.2.1"`


# Combine multiple files
combine multiple fasta files into one file --- useful for nextclade etc.

`cd PATH/TO/FILE` # change directory

```
for file in *.consensus.fasta ; do
    echo ${file}
    cat ${file} >> all_consensus.fasta
done
```
list of files
```
test1.consensus.fasta
test2.consensus.fasta
test3.consensus.fasta
```
`cat all_consensus.fasta`
```
>test1
ACGCACACACACAC
GATCACATACAGAA
>test2
AGATCAACCCATAT
GGATAAAAAGAGAG
>test3
ATTTGGTGTATATA
TTTATTAGAACACC
```

# Count file content
The goal is to find how many of files in this list (~500,000+ files) are unique
1. Tab delimited file, so add 4 spaces in ' ' 
2. If your list is in the first column, use print $1 or $2 for second column and so on. 
3. Specify your list file name (list_fast5_pass.txt)
4. Sort and only print unique file names
5. Instead of printing, count the list. If wc -l is not added, unique file names will be printed in console.

`awk -F '    ' '{print $1}' list_fast5_pass.txt | sort | uniq -c | wc -l`


# File rename
```
cd PATH/TO/FILE # change directory

i=1 # set starting number for the first file

for file in *.consensus.fasta; do  
  f=$((i++))                                # set f variable increasing by 1 from i variable
  mv "${file}" "$(printf "0"${f}-"${file}")"    # rename file with a leading 0 to original file name
done
```

Original file name in folder
```
test1.consensus.fasta
test2.consensus.fasta
test3.consensus.fasta
test4.consensus.fasta
test5.consensus.fasta
```

New file name
```
01-test1.consensus.fasta
02-test2.consensus.fasta
03-test3.consensus.fasta
04-test4.consensus.fasta
05-test5.consensus.fasta
```






