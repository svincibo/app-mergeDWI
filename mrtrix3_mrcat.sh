#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=00:20:00
#PBS -l vmem=30gb

# Load mrtrix3. Version 3 is currently the default for mrtrix.
#module load mrtrix

# Show commands running.
set -x 
set -e

# Parse input file names from config.json. 
dwi=($(jq -r .dwis[] config.json))
bvals=($(jq -r .bvals[] config.json))
bvecs=($(jq -r .bvecs[] config.json))

# Inform user.
echo "Converting input files to mrtrix format..."

# Convert nifti to mif for use with mritrix3.
inputs=[];
for d in ${!dwi[@]}; do

	mrconvert -fslgrad ${bvecs[$d]} ${bvals[$d]} ${dwi[$d]} raw${d}.mif --export_grad_mrtrix raw${d}.b -quiet -force

done

# Inform user.
echo "Merging dwi images..."

# Get the names of all available mif files.
inputs=$(ls raw*.mif)

# Concatenate all dwi inputs using mrcat.
mrcat $inputs dwi_out.mif

# Inform user.
echo "Converting output files to nifti format for storage..."

# Make an output directory.
mkdir -p output

# Convert mif back to nifti for storage.
mrconvert dwi_out.mif output/dwi.nii.gz -export_grad_fsl output/dwi.bvecs output/dwi.bvals -export_grad_mrtrix dwi_out.b -json_export output/dwi.json -quiet -force

# Remove temp files.
rm raw*.b raw*.mif dwi_out.b dwi_out.mif


