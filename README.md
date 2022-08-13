
![image](https://user-images.githubusercontent.com/75652473/184471805-cfaac80d-a15a-49ac-bfac-746afd76ae9c.png)


## What this does

Standard binding free energy calculation with OpenMM via Protein-ligand Alchemical Transformation Simulation, as described in the references, with Free GPU on Google Colab. Modify the "WALLTIME" string in the *cntl file to extend the simulation time for better performance.

## Credits

*   This notebook relies on the AToM-OpenMM plugin developed by Gallicchio-Lab (https://github.com/Gallicchio-Lab/AToM-OpenMM)

*   This notebook relies on OpenMM as the back-end simulation engine. (https://openmm.org/)

*  The input files for this notebook are processed by the Making-it-rain. (https://github.com/pablo-arantes/Making-it-rain)
* Openbabel and Ambertools.(https://ambermd.org/AmberTools.php; http://openbabel.org/wiki/Main_Page)
*  Analysis relies on UWHAM package in R.(https://github.com/patvarilly/uwham;   
https://www.r-project.org/)

* Conda open source package management system. (https://docs.conda.io/en/latest/)

## References
1.  J. Chem. Inf. Model. 2022, 62, 2, 309–323
Publication Date:January 6, 2022
https://doi.org/10.1021/acs.jcim.1c01129

2.   . Chem. Theory Comput. 2021, 17, 6, 3309–3319
Publication Date:May 13, 2021
https://doi.org/10.1021/acs.jctc.1c00266
3.  Asynchronous Replica Exchange Software for Grid and Heterogeneous Computing https://doi.org/10.1016/j.cpc.2015.06.010 
 
A finished file structure screenshot, delt G value is stored in the *.Rout file.
<img width="486" alt="image" src="https://user-images.githubusercontent.com/75652473/184470279-35a99474-a426-4d1a-8294-e0dc4151f836.png">


