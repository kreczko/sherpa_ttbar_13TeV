#!/usr/bin/env bash

git config --global user.name 'kreczko'
git config --global user.github kreczko
git config --global user.email 'lkreczko@googlemail.com'

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd ${OUTPUT_DIR}
scram project CMSSW_9_3_1
cd CMSSW_9_3_1/src
eval `scramv1 runtime -sh`
export TOPDIR=$PWD
git cms-addpkg GeneratorInterface/SherpaInterface
mkdir -p workdir/test
mkdir -p workdir/python
cd workdir/test
cp $TOPDIR/GeneratorInterface/SherpaInterface/data/*SherpaLibs.sh .
cp ${RUN_DAT} .
cp ${MAKE_LIBS_SCRIPT} .
time ./MakeSherpaLibs.sh -p ttbar_13TeV -o LBCR -v -m mpirun -M "-n ${NUMBER_OF_CORES}" | tee sherpa_ttbar_13TeV.log
