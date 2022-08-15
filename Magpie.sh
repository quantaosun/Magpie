
# This is used for calculation of standard binding free energy of a protein target and a bound small molecule.
# This relies on the AToM-OpenMM plugin developed by Gallicchio-Lab (https://github.com/Gallicchio-Lab/AToM-OpenMM)
# References
# J. Chem. Inf. Model. 2022, 62, 2, 309–323 Publication Date:January 6, 2022 https://doi.org/10.1021/acs.jcim.1c01129

#################################################################################

################  TO USE THESE COMMANDS, USE THEM IN COLAB TERMINAL #############
############## MAYBE ALSO GOOD TO USE IN LOCAL LINUX, NOT TESTED YET ############

########################## INSTALL SOFTWARES ####################################
#!/usr/bin/env bash
echo "Press CTRL+C to proceed. The whole simulation would take many hours to finish."
trap "pkill -f 'sleep 1h'" INT
trap "set +x ; sleep 1h ; set -x" DEBUG
# Install Conda
wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.12.0-Linux-x86_64.sh 
chmod +x Miniconda3-py37_4.12.0-Linux-x86_64.sh 
bash ./Miniconda3-py37_4.12.0-Linux-x86_64.sh -b -f -p /root/miniconda3 

# Starting conda
export PATH=/root/miniconda3/bin:$PATH
conda init
source ~/.bashrc

#@title Install dependencies,OpenMMM, atmmetaforce plugin.
conda install -c anaconda configobj -y 
conda install -c conda-forge openbabel -y
conda install -c conda-forge ambertools -y
conda install -c omnia openmm -y
conda install -c conda-forge openmm-atmmetaforce-plugin -y

# Install AToM from github source code
git clone https://github.com/Gallicchio-Lab/AToM-OpenMM.git
cd AToM-OpenMM
python setup.py install

# Setup input files.
# It is highly recommended to use making-it-rain to generate your ligand.mol2 
# and receptor (SYS_nw.pdb) file, then use grep -v to delete LIG.
########################### PLACE INPUTS ########################################
# Go to workding directory
cd examples/ABFE/fkbp

# Change original directory to old names, 
mv ligands ligands_old
mv receptor receptor_old

# build new folder with same name.

mkdir ligands receptor

# Copy Making-it-rain ligand.mol2 and SYS_nw.pdb to 
# ligands and receptor directory, respectively.
cd ligands
cp ../../../../../ligand.mol2 .
mv ligand.mol2 thi.mol2
cd ..
cd receptor
cp ../../../../../SYS_nw.pdb .

# Get rid of LIG to obtain a protein only file.
# rename the file to fkbp.pdb
grep -v LIG SYS_nw.pdb > fkbp.pdb
rm SYS_nw.pdb
cd ..
########################### SIMULATION ##########################################
# Modify node file,we will use CUDA together with CPU
echo "localhost,0:0,1,CUDA,,/tmp" > scripts/nodefile
echo "localhost-cpu,0:0,2,CPU,,/tmp" >> scripts/nodefile
# Place setup-atm.sh under fkbp folder.
cp scripts/setup-atm.sh .

# Modify setup-settings.sh
echo "Please change displacement vector in setup-setting.sh the setup-atm.sh rely on"
sed -i 's/"22.0" "22.0" "22.0"/"26.449" "0.468" "11.615"/' scripts/setup-settings.sh

echo "Please change the bindng site center residue ID list in the setup-settings.sh"

sed -i 's/26 36 37 42 46 48 54 55 56 82/103 104 105 106/' scripts/setup-settings.sh
# 
bash ./setup-atm.sh

# A new folder "complex" should be built

echo " A new complex folder has been created"
cd complexes/fkbp-thi


# Run minimization, equilibration.
# NPT is included in the minitherm.py

echo "Next is minimization and equilibration"

python fkbp-thi_mintherm.py 
python fkbp-thi_equil.py 

# Modify displacement vector in both mdlambda.py and *cntl file, 
# This is crucial for correct result.
# This can be obtained by Pymol with fkbp_thi_0.pdb loaded for visulization, 
# and the text version of fkbp_thi_0.pdb for coordinate deduction.

# Intermediate lambda simulation
echo "Please double check the displacement vector has been correctly placed in the fkbp-thi_mdlambda.py file"
python fkbp-thi_mdlambda.py

# Modify WALLYIME in cntl file.
# For example, WALLTIME = 720, means 12 hours.

# Replica exchange sampling, this would cost many hours to finish.
echo "Please double check the displacement vector has been correctly placed in the *.cntl file"

echo "Please change the simulation time in the *cntl file, if you wish to run for more than 2 hours"
echo "The next command would take hours"
python ../../../../../abfe_explicit.py fkbp-thi_asyncre.cntl


######################## ANALYSIS ###############################################
echo "Analysis should be run inside the notebook"
# Only use this in colab notebook.

# activate R magic
%load_ext rpy2.ipython

%%R
install.packages("UWHAM") 

# Discard initial samples in analyze.sh

#if [ $# -eq 0 ] 
#then
#   discard_samples_low=20
#   discard_samples_high=$many
#else

bash ./analyze.sh

# DGb = -1.067973 +- 0.600315 range 20 50

####################### JOB CONTROL #############################################

# To keep google colab alive from idle, in notebook cell, run

while True:pass
























