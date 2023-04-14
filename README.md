# DRAGEN-GATK on Setonix HPC

## Motivation
Pipeline for taking uBAMs to processed aligned BAM using the DRAGEN-GATK4 [`WholeGenomeGermlineSingleSample_v3.1.10`](https://github.com/broadinstitute/warp/releases/tag/WholeGenomeGermlineSingleSample_v3.1.10) warp from the Broad. \
Uses the DRAGEN maked hg38 reference genome (Homo_sapiens_assembly38_masked.fasta)

## Quick-start
1. Edit `run_DRAGEN.sh` to include job name, relevant time limit etc.
2. Edit `inputs.json` to include your uBAMs and change sample name
3. `sbatch run_DRAGEN.sh`

## To-do
- [ ] Incorporate FastqToUbam into pipeline - for example the Kaya GATK pipeline has this
- [ ] Add joint calling?
- [ ] BAM/CRAM out after haplotyping?
- [ ] Remove haplotype calling if not processing to joint calling?
- [ ] Check Group folder/file permissions @Chiara
- [ ] Bump GATK to 4.3.0.0 - WholeGenomeGermlineSingleSample 3.1.10 requires 4.3.0.0, currently using 4.2.5.0 Pawsey module
- [ ] Check if using DRAGEN or BWA-mem
 
## Installation (already done)
Mostly relying on modules where available (see `run_DRAGEN.sh`). Only DRAGEN and Picard had to be installed with conda
- [ ] Is Picard needed in this pipeline?
1. `cd /software/projects/pawsey0848/`
2. `mkdir gatk`
3. `chmod g+rwx gatk/`
4. `cd gatk`
5. `git init`
5. `wget https://github.com/broadinstitute/warp/archive/refs/tags/WholeGenomeGermlineSingleSample_v3.1.10.tar.gz`
6. `tar -xzvf WholeGenomeGermlineSingleSample_v3.1.10.tar.gz`
7. Download masked reference genome (not in scratch references, actually already in sv pipeline references) \
    `conda activate gsutil` \
    `gsutil -m cp gs://gcp-public-data--broad-references/hg38/v0/dragen_reference/Homo_sapiens_assembly38_masked.* .`
9. `conda create -n gatk -c bioconda dragen picard`
10. Make SLURM script, add `module load`s and `conda activate gatk`
11. Edit inputs file
