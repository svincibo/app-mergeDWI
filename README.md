
[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.219-blue.svg)](https://doi.org/10.25663/brainlife.app.275)

### Author
- Sophia Vinci-Booher (svincibo@indiana.edu)

### Contributor
- Soichi Hayashi (hayashis@iu.edu)

### Project director
- Franco Pestilli (franpest@indiana.edu)

# app-mergeDWI

Merge multiple DWI files into one DWI file using mrcat. More information on mrcat can be found here: https://mrtrix.readthedocs.io/en/latest/reference/commands/mrcat.html

An example application of this app is the scenario where two shells were collected, but each shell was collected with it's own scan. In this example, it is desireable to concatenate -- merge -- the two shells before analyzing.

It is recommended that the merge is performed before preprocessing rather than after preprocessing to avoid the possibility of misalignment between the anatomical and the first and second diffusion images.

NOTE: This app does not currently do any dwi-to-dwi alignment. 
NOTE: mrcat does not do intensity normalization as would dwicat. This app will be updated to use dwicat when mrtrix3 releases dwicat.

# mrcat software citations

Please cite this paper in reference to mrcat, a part of mrtrix3 software:

Tournier, J.-D.; Smith, R. E.; Raffelt, D.; Tabbara, R.; Dhollander, T.; Pietsch, M.; Christiaens, D.; Jeurissen, B.; Yeh, C.-H. & Connelly, A. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage, 2019, 202, 116137

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NIH-T32-HD007475](https://img.shields.io/badge/NIH_T32-HD007475-blue.svg)](https://www.nichd.nih.gov/grants-contracts/training-careers/extramural/institutional)

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/brainlife.app.275](https://doi.org/10.25663/brainlife.app.275) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
"dwis": ["testdata/dwi1.nii.gz", "testdata/dwi2.nii.gz"],
"bvals": ["testdata/dwi1.bvals", "testdata/dwi2.bvals"],
"bvecs": ["testdata/dwi1.bvecs", "testdata/dwi2.bvecs"]
}
```

3. Launch the App by executing `main`

```bash
./main
```

### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).


## Output

All output files will be generated under the current working directory (pwd). The main outputs of this App are three files called `dwi.nii.gz`, `dwi.bvals`, and `dwi.bvecs`. This file contains following object.

```

dwi: dwi.nii.gz
bvals: dwi.bvals
bvecs: dwi.bvecs

```

### Dependencies

This App requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install the following dependencies.  

  - MRTRIX3: https://www.mrtrix.org/

