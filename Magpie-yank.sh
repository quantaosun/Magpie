# This is used for calculation of standard binding free energy of a protein target and a bound small molecule.
# This relies on the AToM-OpenMM plugin developed by Gallicchio-Lab (https://github.com/Gallicchio-Lab/AToM-OpenMM)
# References
# J. Chem. Inf. Model. 2022, 62, 2, 309–323 Publication Date:January 6, 2022 https://doi.org/10.1021/acs.jcim.1c01129

#################################################################################

################  TO USE THESE COMMANDS, USE THEM IN COLAB TERMINAL #############
############## MAYBE ALSO GOOD TO USE IN LOCAL LINUX, NOT TESTED YET ############

########################## INSTALL SOFTWARES ####################################
#!/usr/bin/env bash
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
#+git clone https://github.com/Gallicchio-Lab/AToM-OpenMM.git
#cd AToM-OpenMM
#python setup.py install

# Install yank

conda install -c conda-forge -c omnia yank -y

# Install yank-examples

git clone https://github.com/choderalab/yank-examples.git
cd yank-examples/examples/binding/t4-lysozyme/input

# Copy and rename ligand
cp ../../../../../ligand.mol2 .
mv ligand.tripos.mol2 ligand.tripos.mol2.old
mv ligand.mol2 ligand.tripos.mol2

# Copy and rename protein

cp ../../../../../SYS_nw.pdb .
mv receptor.pdbfixer.pdb receptor.pdbfixer.pdb.old 
grep -v LIG SYS_nw.pdb > receptor.pdbfixer.pdb

# Go back to working directory
# Change platform to OpenCL 
sed -i 's/CUDA/OpenCL/' p-xylene-implicit.yaml

# Start simulaiton

yank script --yaml=p-xylene-implicit.yaml

# Analyze the data

yank analyze --store=p-xylene-implicit-output











