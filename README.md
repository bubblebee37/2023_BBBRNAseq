# BBB penetration-related mechanism analysis
Version: 2023-08-08

Author: Kyungha Kim (bubblebee@unist.ac.kr)

## Introduction
This repository provides the analysis process of RNA-seq data from the blood-brain barrier (BBB) endothelial cells. The cells were isolated from the transwell, microfluidic chip, and the mouse brain. Each experiment has three biological replicates and the total sample number is nine.

## Step 1. Pre-process & align the RNA-seq data to the reference.
> To start the RNA-seq data processing, install the trimmomatic and the STAR aligner.
> You can download the STAR source code from Github (https://github.com/alexdobin/STAR/releases).

1. Trim the RNA-seq data (i.e. sample.fastq.gz) by running the bash file '/process_data/01.trimming-RNAseq.sh'.
   * Paired-end reads are suitable for further analysis. Example file names are 'sample_1.fastq.gz' (pair 1) and 'sample_2.fastq.gz' (pair 2).
2. Align the trimmed transcriptome data to the reference by running the bash file '/process_data/02.run-star.sh'.
   * The reference genome sequence (fasta file) and annotations (GTF file) are required to run the STAR.
   * The path to STAR aligner should be annotated to the bash file.
