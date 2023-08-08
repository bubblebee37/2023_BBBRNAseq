# BBB penetration-related mechanism analysis
Version: 2023-08-08

Author: Kyungha Kim (bubblebee@unist.ac.kr)

## Introduction
This repository provides the analysis process of RNA-seq data from the blood-brain barrier (BBB) endothelial cells. The cells were isolated from the transwell and the microfluidic chip. Each experiment has three biological replicates and the total sample number is six.

## Step 1. Pre-process & align the RNA-seq data to the reference.
> To start the RNA-seq data processing, install the trimmomatic and the STAR aligner.
> You can download the STAR source code from Github (https://github.com/alexdobin/STAR/releases).

1. Trim the RNA-seq data (i.e. sample.fastq.gz) by running the bash file '/process_data/01.trimming-RNAseq.sh'.
   * Paired-end reads are suitable for further analysis. Example file names are 'sample_1.fastq.gz' (pair 1) and 'sample_2.fastq.gz' (pair 2).
2. Align the trimmed transcriptome data to the reference by running the bash file '/process_data/02.run-star.sh'.
   * The reference genome sequence (fasta file) and annotations (GTF file) are required to run the STAR.
   * The path to STAR aligner should be annotated to the bash file.
3. After running the star, collect the ReadsPerGene.out.tab files of samples and choose one of columns 3 or 4 according to the strandedness of the data. The selected read count column will be used for further analysis.
> i.e. ReadsPerGene.out.tab file format :<br/>
> N_unmapped&emsp;8138028&emsp;8138028&emsp;8138028<br/>
> N_multimapping&emsp;1365826&emsp;1365826&emsp;1365826<br/>
> N_noFeature&emsp;1373581&emsp;28197086&emsp;1488887<br/>
> N_ambiguous&emsp;2071514&emsp;15975&emsp;897773<br/>
> ENSMUSG00000102628&emsp;2&emsp;2&emsp;0

## Step 2. Process the count data for further analysis.
> Before merging the ReadsPerGene.out.tab files, remove the top four index lines.<br/>
> Add the index with the columns on top of the gene ID and counts as below.<br/>
> gene_ID&emsp;unstranded&emsp;sense&emsp;antisense

* By running the '/process_data/Processing_readcounts.ipynb' file,<br/>you can remove the outlier gene IDs and get the table composed of the CPM values of genes.<br/>
* Further analysis related to gene ontology (GO) term analysis and gene set enrichment analysis (GSEA) can be implemented using the CPM table.
