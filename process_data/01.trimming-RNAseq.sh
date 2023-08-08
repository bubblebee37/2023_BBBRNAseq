NUM_THREADS=4
DIR_CONDA=$HOME/anaconda3
#Use the appropriate adapter fasta file used in RNA-seq
FA_ADAPTER=$(find $DIR_CONDA | grep -m1 MGI-PE.fa)

echo "Adapter: "$FA_ADAPTER
cp $FA_ADAPTER .

for FQ1 in $(ls ./*_1.fastq.gz)
do
        FQ2=${FQ1/_1/_2}
        OUT=${FQ1/_1.fastq.gz}"_trim"
        echo $FQ1 $FQ2 $OUT
        trimmomatic PE -validatePairs -threads $NUM_THREADS -summary $OUT".summary" $FQ1 $FQ2 -baseout $OUT \
   ILLUMINACLIP:MGI-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50
done
