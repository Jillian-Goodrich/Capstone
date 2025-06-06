#Run the QC analyses on the sequencing reads

#Run FastQC on my raw reads
#mkdir data/raw_fastqc_results
#module load FastQC/0.11.9-Java-11
#fastqc -o data/raw_fastqc_results data/raw_fastq/*.fastq*

#Run MultiQC to compile results
#module load MultiQC/1.14-foss-2022a
#multiqc -o data/raw_fastqc_results data/raw_fastqc_results

#Load trimmomatic
#module load Trimmomatic/0.39-Java-13
#mkdir data/trimmed_fastq
#TRIMMOMATIC="java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar"

#Loops through every sample number and trims fwd and rev read
#for fwd in data/raw_fastq/*_1.fastq.gz
#do
#	sample=$(basename $fwd _1.fastq.gz)
#$TRIMMOMATIC PE data/raw_fastq/${sample}_1.fastq.gz data/raw_fastq/${sample}_2.fastq.gz \
#	data/trimmed_fastq/${sample}_1.paired.fastq.gz data/trimmed_fastq/${sample}_1.unpaired.fastq.gz \
#	data/trimmed_fastq/${sample}_2.paired.fastq.gz data/trimmed_fastq/${sample}_2.unpaired.fastq.gz \
#	ILLUMINACLIP:data/raw_fastq/NexteraPE-PE.fa:2:30:10:5:True SLIDINGWINDOW:4:20
#done


#Run the QC analyses on the full length reads
#module load FastQC/0.11.9-Java-11
#mkdir data/fastqc_trimmed_results
#fastqc -o data/fastqc_trimmed_results data/trimmed_fastq/*.fastq*

#Run MultiQC to compile trimmed results
#module load MultiQC/1.14-foss-2022a
#multiqc -o data/fastqc_trimmed_results data/fastqc_trimmed_results

#Move unpaired reads out of the way to prep for alignment
#mkdir data/unpaired_trimmed
#for unpaired in data/trimmed_fastq/*.unpaired*
#do
#echo $unpaired
#mv $unpaired data/unpaired_trimmed
#done
