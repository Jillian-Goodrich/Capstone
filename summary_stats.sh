#Summarizing some statistics from the bioinformatics pipeline data and results

echo sample,raw_read_count,trimmed_read_count,alignment_count,variant_site_count > summary_results.csv

for fwd in data/trimmed_fastq/*_1.paired.fastq.gz
do
        sample=$(basename $fwd _1.paired.fastq.gz )
	echo ${sample},raw_read_count_for_${sample},trimmed_read_count_for_${sample},  >> summary_results.csv
done
#Count how many reads are in the raw and trimmed fastq files


#Count how many reads aligned to the E coli genome

#samtools view -F 0x4

#Count the variant sites from each sample
