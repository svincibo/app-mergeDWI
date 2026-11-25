<h1 align="center">mergeDWI</h1>

<p align="center">
  Concatenates two or more DWI series (with bvals/bvecs) into a single DWI with MRtrix3 3.0_RC3 mrcat.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.275"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.275-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Concatenates two or more DWI series (with bvals/bvecs) into a single DWI with MRtrix3 3.0_RC3 mrcat.**

Converts each input DWI to MRtrix format with its gradient table, concatenates them along the volume axis with mrcat and exports one NIfTI with merged bvals and bvecs. Use it when shells or runs were acquired in separate scans, ideally before preprocessing. It does no DWI-to-DWI alignment and no intensity normalization, so the inputs must share the same grid.

| | |
|---|---|
| **Inputs** | `neuro/dwi` |
| **Outputs** | `neuro/dwi` |
| **Container** | `brainlife/mrtrix3:3.0_RC3` |
| **Resources** | 1 CPUs |
| **Run it** | [doi.org/10.25663/brainlife.app.275](https://doi.org/10.25663/brainlife.app.275) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `dwi` | `neuro/dwi` | yes | Two or more DWI datasets (multi) with bvals and bvecs. All series must have the same voxel grid; no alignment or intensity normalization is applied. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/dwi` | Merged DWI (dwi.nii.gz) with concatenated bvals and bvecs and a JSON header export. |

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.275](https://doi.org/10.25663/brainlife.app.275), choose `neuro/dwi` from your project and press **Execute**. The results are saved to your project as `neuro/dwi`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mrtrix3:3.0_RC3`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "dwis": "/path/to/dwi/dwis",
       "bvecs": "/path/to/dwi/bvecs",
       "bvals": "/path/to/dwi/bvals"
   }
   ```

3. Run `./main`.

## app-mergeDWI

This app will merge multiple DWI files into one DWI file using mrcat. The input data are dwi images (two or more) and the output is one dwi image. More information on mrcat can be found here: https://mrtrix.readthedocs.io/en/latest/reference/commands/mrcat.html

An example application of this app is the scenario where two shells were collected, but each shell was collected with it's own scan. In this example, it is desireable to concatenate -- merge -- the two shells before analyzing.

It is recommended that the merge is performed before preprocessing rather than after preprocessing to avoid the possibility of misalignment between the anatomical and the first and second diffusion images.

NOTE: This app does not currently do any dwi-to-dwi alignment. 
NOTE: mrcat does not do intensity normalization as would dwicat. This app will be updated to use dwicat when mrtrix3 releases dwicat.

## --- mrcat software citations

Please cite this paper in reference to mrcat, a part of mrtrix3 software:

Tournier, J.-D.; Smith, R. E.; Raffelt, D.; Tabbara, R.; Dhollander, T.; Pietsch, M.; Christiaens, D.; Jeurissen, B.; Yeh, C.-H. & Connelly, A. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage, 2019, 202, 116137

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- mergeDWI. brainlife.io App. [doi:10.25663/brainlife.app.275](https://doi.org/10.25663/brainlife.app.275)
- Tournier J-D, et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage (2019).
- Tournier et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. *NeuroImage* 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Sophia Vinci-Booher

**Contributor**

- Soichi Hayashi

**Project director**

- Franco Pestilli

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>
