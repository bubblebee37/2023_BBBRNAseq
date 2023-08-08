#!/bin/bash

INDEX_genome=$HOME/PATH_TO_REFERENCE_FASTAFILE
INDEX_GTF=$HOME/PATH_TO_REFERENCE_GTFFILE
STAR=$HOME/PATH_TO_STAR/star

for FQ1 in $(ls ./*_1P)
do
        FQ2=${FQ1/_1P/_2P}
        OUT=${FQ1/_1P}"_star"
        echo $FQ1 $FQ2 $OUT
        $STAR --runThreadN 12 --genomeDir $INDEX_genome --sjdbGTFfile $INDEX_GTF --readFilesIn $FQ1 $FQ2 --twopassMode Basic --readFilesCommand zcat --outFileNamePrefix $OUT --quantMode GeneCounts
done
