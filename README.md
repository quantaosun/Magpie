

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/quantaosun/Magpie/blob/main/Magpie.ipynb)
## What this does

Standard binding free energy calculation with OpenMM via Protein-ligand Alchemical Transformation Simulation, as described in the references, with Free GPU on Google Colab (https://colab.research.google.com/). 
## How to use the code
### Magpie.ipynb is here only for general reference, and ANALYSIS purposes.
Execute Magpie.sh instead, 
```
cd /path/to/Amber/inputs
git clone https://github.com/quantaosun/Magpie.git
cp Magpie/Magpie.sh .
bash Magpie.sh
```

Ctril+c to run the following command AFTER the previous one has FINISHED.

Modify the "WALLTIME" string in the *cntl file if you wish to extend the time to more than 2 hours.

Modify the displacement vector and binding site center based on your protein-ligand system, see Magpie.ipynb for more.

After finishing the simulation, you can close the terminal and use Magpie.ipynb to analyze the result.

Once you have figured out your parameters and have modified Magpie.sh accordingly, you can delete the first block of code to run all commands at one time.
<p align="center">
<img width="662" alt="image" src="https://user-images.githubusercontent.com/75652473/184617779-b4483289-d03c-4d1a-846d-8c09a008c71a.png">
</p>

## How to prepare the Amber inputs?

This is out of the scope of this repository, there are two ways you can do

First, you prepare these files with Ambertools by yourself as per https://ambermd.org/tutorials/basic/tutorial7/index.php, which is likely to take forever for people without much MD experience.

Second, and is recommended, use the fantastic https://github.com/pablo-arantes/making-it-rain/tree/main/PROTEIN_LIGAND notebook to generate your ligand.mol2 and SYS_nw.pdb.

## Credits

*   This notebook relies on the AToM-OpenMM plugin developed by Gallicchio-Lab (https://github.com/Gallicchio-Lab/AToM-OpenMM)

*   This notebook relies on OpenMM as the back-end simulation engine. (https://openmm.org/)

*  The input files for this notebook are processed by the Making-it-rain. (https://github.com/pablo-arantes/Making-it-rain)
* Openbabel and Ambertools.(https://ambermd.org/AmberTools.php; http://openbabel.org/wiki/Main_Page)
*  Analysis relies on UWHAM package in R.(https://github.com/patvarilly/uwham;   
https://www.r-project.org/)
* This notebook also provide an alternative ABFE with yank, which also is an OpenMM based method.http://getyank.org/latest/ 

* Conda open source package management system. (https://docs.conda.io/en/latest/)

## References
1.  J. Chem. Inf. Model. 2022, 62, 2, 309–323
Publication Date:January 6, 2022
https://doi.org/10.1021/acs.jcim.1c01129

2.   . Chem. Theory Comput. 2021, 17, 6, 3309–3319
Publication Date:May 13, 2021
https://doi.org/10.1021/acs.jctc.1c00266
3.  Asynchronous Replica Exchange Software for Grid and Heterogeneous Computing https://doi.org/10.1016/j.cpc.2015.06.010 
 
