#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=00:20:00
#PBS -l vmem=30gb

# Load mrtrix3. Version 3 is currently the default for mrtrix.
module load mrtrix

# Show commands running.
set -x 
set -e

# Parse input file names from config.json. 
dwi=$(jq -r .dwis config.json.sample)
bvals=$(jq -r .bvals config.json.sample)
bvecs=$(jq -r .bvecs config.json.sample)

# Inform user.
echo "Converting input files to mrtrix format..."

# Convert nifti to mif for use with mritrix3.
mrconvert -fslgrad $bvecs1 $bvals1 $dwi1 raw1.mif --export_grad_mrtrix raw1.b -quiet -force
mrconvert -fslgrad $bvecs2 $bvals2 $dwi2 raw2.mif --export_grad_mrtrix raw2.b -quiet -force

# Inform user.
echo "Merging dwi images..."

# Concatenate dwi1 and dwi2 using mrcat.
mrcat raw1.mif raw2.mif dwi_out.mif

# Inform user.
echo "Converting output files to nifti format for storage..."

# Convert mif back to nifti for storage.
mkdir -p output
mrconvert dwi_out.mif output/dwi.nii.gz -export_grad_fsl output/dwi.bvecs output/dwi.bvals -export_grad_mrtrix dwi_out.b -json_export output/dwi.json -quiet -force

# Remove temp files.
rm raw1.b raw1.mif raw2.b raw2.mif dwi_out.b dwi_out.mif


