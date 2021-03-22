# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module load gcc
module load slurm 


test -s ~/.alias && . ~/.alias || true

export CC=/cm/local/apps/gcc/7.2.0/bin/gcc
export CXX=/cm/local/apps/gcc/7.2.0/bin/c++

#export CC=/usr/bin/gcc
#export CXX=/usr/bin/c++

export PATH=$PATH:/home/tsun/IDL87/envi55/idl87/bin
export PATH=$PATH:/home/tsun/bin
export PATH=$PATH:/home/tsun/bin/git-2.9.5/bin
export PATH=$PATH:/home/tsun/bin/elastix-bin/bin
export PATH=$PATH:/home/tsun/bin/RTK-1.4.0/RTK-bin/install/bin
export PATH=$PATH:/home/tsun/bin/dcmtk-3.6.4/install/bin
export PATH=$PATH:/home/tsun/bin/plastimatch-1.7.3/install/bin
export PATH=$PATH:/home/tsun/bin/cmake-3.13.2-Linux-x86_64/bin
export PATH=$PATH:/home/tsun/bin/tpcclib-master/build/bin
#export PATH=$PATH:/home/tsun/anaconda3/bin
export PATH=$PATH:/home/tsun/bin/PETPVC-master/bin
export PATH=$PATH:/home/tsun/bin/valgrind-3.15.0/build/bin
export PATH=$PATH:/cm/shared/apps/hdf5/1.10.1/bin
export VALGRIND_LIB=/home/tsun/bin/valgrind-3.15.0/build/lib/valgrind 
#export PATH=$PATH:/home/tsun/bin/valgrind-3.15.0/build/lib/valgrind
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/valgrind-3.15.0/build/lib/valgrind
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/elastix-develop/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/elastix-5.0.0/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/ITK-4.9.1-bin/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/InsightToolkit-4.13.1/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/InsightToolkit-5.0.1/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/RTK-1.4.0/RTK-bin/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/plastimatch-1.7.3/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/dcmtk-3.6.4/install/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/shared/apps/cuda92/toolkit/9.2.88/targets/x86_64-linux/lib/stubs
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/shared/apps/cuda92/toolkit/9.2.88/targets/x86_64-linux/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/fsl/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/tpcclib-master/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/mcmc-master/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/armadillo-9.400.4/install/lib64
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/anaconda3/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/shared/apps/hdf5/1.10.1/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/shared/apps/openblas/0.2.20/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/dlib-19.18/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/libcmaes-master/install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/local/apps/boost/current/lib64/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/pagmo2-2.11.4/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/tbb/tbb2019_20191006oss/lib/intel64/gcc4.8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/tsun/bin/optim-master/install/lib
export DLIB_INCLUDE_PATH=/home/tsun/bin/dlib-19.18/include/dlib
export ARMA_INCLUDE_PATH=/home/tsun/bin/armadillo-9.400.4/install/include
export BOOST_INCLUDE_PATH=/cm/local/apps/boost/current/include
export PAGMO_INCLUDE_PATH=/home/tsun/bin/pagmo2-2.11.4/build/include
export EIGEN3_INCLUDE_PATH=/home/tsun/bin/eigen-eigen-323c052e1731/install/include/eigen3
alias idl=/home/tsun/IDL87/envi55/idl87/bin/idl
alias idlde=/home/tsun/IDL87/envi55/idl87/bin/idlde
alias harris=/home/tsun/IDL87/envi55/idl87/bin/harrislicense
alias mpirun=/cm/shared/apps/openmpi/gcc/64/1.10.7/bin/mpirun
alias mgh='cd /storage0/home/tsun/code/idl/mgh'
alias sedata='cd /storage0/home/sedata'
alias data='cd /storage1/tsun'
alias imagej='/home/tsun/bin/Fiji.app/ImageJ-linux64'
alias cmake='/home/tsun/bin/cmake-3.13.2-Linux-x86_64/bin/cmake'
alias ccmake='/home/tsun/bin/cmake-3.13.2-Linux-x86_64/bin/ccmake'
alias matlab2018='/cm/shared/apps/MATLAB/R2018a/bin/matlab'
alias matlab2013='/cm/shared/apps/MATLAB/R2013a/bin/matlab'
alias matlab2018b='/home/tsun/bin/matlab2018/bin/matlab'

FSLDIR=/home/tsun/bin/fsl/install
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH



