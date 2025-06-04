#make subdirectories
mkdir data docs results data/raw_fastq
#Copy over data
cp -r /work/binf8960/instructor_data/raw_fastq ./data/
#Make read-only
chmod -w data/raw_fastq/*.fastq* 
