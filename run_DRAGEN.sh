#!/bin/bash -l 
#SBATCH --job-name=DRAGEN_test
#SBATCH --account=pawsey0848
#SBATCH --partition=work
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=20G
#SBATCH --nodes=1
#SBATCH --time=10:00:00
#SBATCH --mail-user=gavin.monahan@pawsey.org.au
#SBATCH --mail-type=END
#SBATCH --error=%j.%x.err
#SBATCH --output=%j.%x.out

module load gatk4/4.2.5.0--hdfd78af_0
module load samtools/1.15--h3843a85_0

conda activate gatk
#Contains Picard, Dragmap

#Run the pipeline
java -Dconfig.file=/software/projects/pawsey0848/gatk/slurm.conf -jar /software/projects/pawsey0848/gatk/cromwell-85.jar run /software/projects/pawsey0848/gatk/WholeGenomeGermlineSingleSample.wdl \
   -i /software/projects/pawsey0848/gatk/inputs.json \
   -o /software/projects/pawsey0848/gatk/cromwell.options
