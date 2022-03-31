#!/usr/bin/env bash

### Concatenating MinION multiple fastq.gz files into one file and gzip

### specify directory variables
INPUT="MinION_run/fastq_pass"
OUTPUT="MinION_run/combined_fastq"



### MinION_run/fastq_pass folder content
#barcode01
#  - faq20101_barcode01_0_example.fastq.gz
#  - faq20101_barcode01_1_example.fastq.gz
#  - faq20101_barcode01_2_example.fastq.gz
#barcode02
#  - faq20101_barcode02_0_example.fastq.gz
#  - faq20101_barcode02_1_example.fastq.gz
#  - faq20101_barcode02_2_example.fastq.gz
#barcode03
#  - faq20101_barcode03_0_example.fastq.gz
#  - faq20101_barcode03_1_example.fastq.gz
#  - faq20101_barcode03_2_example.fastq.gz
#barcode04
#  - faq20101_barcode04_0_example.fastq.gz
#  - faq20101_barcode04_1_example.fastq.gz
#  - faq20101_barcode04_2_example.fastq.gz

##########################################

### Remove srun if you are running this in your local computer

cd $OUTPUT
for f in $INPUT/* ; 
do 
    foldername=`basename "$f"` ;
    echo $foldername ;
    srun cat $INPUT/$foldername/*.fastq.gz >> $OUTPUT/$foldername.fastq.gz ;
done


for f in $OUTPUT/*.fastq.gz ; 
do 
    filename=`basename "$f"` ;
    echo $filename ;
    srun gzip -d $f ;
done
