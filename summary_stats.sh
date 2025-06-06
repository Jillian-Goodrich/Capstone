#Summarizing some statistics from the bioinformatics pipeline data and results

module load SAMtools/1.18-GCC-12.3.0

echo raw_read_count,trimmed_read_count,alignment_count,variant_site_count > summary_results.csv

for fwd in data/trimmed_fastq/*_1.paired.fastq.gz
do
        sample=$(basename $fwd _1.paired.fastq.gz )
#Refer to MultiQC report for how many reads are in the raw and trimmed fastq files
#These can be found in the MultiQC html or in data/raw_fastqc_results/multiqc_data/multiqc_general_stats.txt \
# and data/fastqc_trimmed_results/multiqc_data/multiqc_general_stats.txt
#add these in to their respective places in summary_results.csv

echo Summarizing Stats for $sample

#Count how many reads aligned to the E coli genome
	alignment_count=$(samtools view -F 0x4 results/bam/$sample.bam | wc -l)

#Count the variant sites from each sample
	variant_site_count=$(grep -v '^#' results/vcf/$sample.vcf | wc -l)

	echo ${sample},raw_read_count_for_${sample},trimmed_read_count_for_${sample},$alignment_count,$variant_site_count,  >> summary_results.csv
done
