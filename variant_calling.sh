#set -e  # if/when the script encounters an error, it stops and exits

# Location to download genome from
#genome_url="ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/017/985/GCA_000017985.1_ASM1798v1/GCA_000017985.1_ASM1798v1_genomic.fna.gz"

# Load modules

#module load SAMtools/1.10-GCC-8.3.0
#module load BWA/0.7.18-GCCcore-13.3.0 
module load BCFtools/1.14-GCC-11.2.0

# Download E. coli genome
#mkdir data/genomes mkdir results/sam mkdir results/bam results/vcf results/bcf 
#wget -O data/genomes/ecoli_rel606.fna.gz $genome_url
#gunzip data/genomes/ecoli_rel606.fna.gz

# Index the genome

#bwa index data/genomes/ecoli_rel606.fna

# loop over reads and align reads to the genome and variant calling
for fwd in data/trimmed_fastq/*_1.paired.fastq.gz
do
	
	sample=$(basename $fwd _1.paired.fastq.gz )
	# Run Alignment
#	echo "Aligning $sample"
#	rev=data/trimmed_fastq/${sample}_2.paired.fastq.gz
#	bwa mem data/genomes/ecoli_rel606.fna $fwd $rev > results/sam/$sample.sam

	# Convert to BAM and sort
	# Options = start with SAM, end with BAM
#	samtools view -S -b results/sam/$sample.sam  > results/bam/$sample.bam  
#	samtools sort  -o results/bam/$sample.sorted.bam results/bam/$sample.bam
	
	# Do variant calling O is format, o is file name
#	echo "Calling variants in $sample"
#	bcftools mpileup -O b -o  results/bcf/$sample.bcf -f data/genomes/ecoli_rel606.fna results/bam/$sample.sorted.bam
#	bcftools call --ploidy 1 -m -v -o results/vcf/$sample.vcf results/bcf/$sample.bcf

done
