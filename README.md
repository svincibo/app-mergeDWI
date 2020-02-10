# app-mergeDWI
This app uses mrtrix3's mrcat to merge two diffusion images together. An example application of this app is the scenario where two shells were collected, but each shell was collected with it's own scan. In this example, it is desireable to concatenate -- merge -- the two shells before analyzing.

It is recommended that the merge is performed before preprocessing rather than after preprocessing to avoid the possibility of misalignment between the anatomical and the first and second diffusion images.

More information on mrcat can be found here: https://mrtrix.readthedocs.io/en/latest/reference/commands/mrcat.html

NOTE: mrcat does not do intensity normalization as would dwicat. This app will be updated to use dwicat when mrtrix3 releases dwicat.

# MRCAT SOFTWARE CITATIONS

Please cite this paper in reference to mrcat, a part of mrtrix3 software:

Tournier, J.-D.; Smith, R. E.; Raffelt, D.; Tabbara, R.; Dhollander, T.; Pietsch, M.; Christiaens, D.; Jeurissen, B.; Yeh, C.-H. & Connelly, A. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. NeuroImage, 2019, 202, 116137
