# DRAGEN-GATK on Setonix HPC

## Motivation
Pipeline for taking uBAMs to processed aligned BAM using the DRAGEN-GATK4 `WholeGenomeGermlineSingleSample` warp from the Broad. 
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
- [ ] Check Group folder/file permissions
 

