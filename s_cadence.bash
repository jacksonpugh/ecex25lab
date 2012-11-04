#---- Cadence user setup ----------------------------------------------
set base_dir=/pkgs/cadence6/
set uname=/pkgs/gnu/bin/uname


export CDSHOME=/pkgs/cadence6/IC610
export OA_HOME=/pkgs/cadence6/OpenAccess
export IUS=/pkgs/cadence6/IUS61 
export CDS_INST_DIR=$IC
export ICC=/pkgs/cadence6/ICC11241
export HHHOME=$ICC/tools/iccraft/help
export XAPPLRESDIR=$HHHOME/app-defaults
export DSM=/pkgs/cadence6/DSMSE54   
export RC=/pkgs/cadence6/RC71
SOC=/pkgs/cadence6/SOC62
export SOC
export CDS=$base_dir
export CONFRML=/pkgs/cadence6/CONFRML71


export CNI_ROOT=/pkgs/cadence6/local/ciranova_installer_sunos_58_32_4.2.3/install
export CNI_PLAT_ROOT=${CNI_ROOT}/plat_solaris_32

# New Path Entries
# New Path Entries
export CDS_SITE=/pkgs/cadence6/local/

export CDS_LIC_FILE=/pkgs/flexlm/licenses/cadence-2000/license.dat
export CDS_Netlisting_Mode=Analog
export LD_ASSUME_KERNEL=2.4.1
export PYTHONHOME=${CNI_PLAT_ROOT}/3rd
export PYTHONPATH=${CNI_ROOT}/pylib:${CNI_PLAT_ROOT}/pyext:${CNI_PLAT_ROOT}/lib
# The following gets rid of the annoying messages that pycell prints to stdout
export CNI_LOG_DEFAULT=/dev/null


# Path additions
# setopt ALL_EXPORT
export PATH=/u/bilagi/bin:${PATH} 
export PATH=${CDSHOME}/tools/bin:${PATH}
export PATH=${CDSHOME}/tools/dfII/bin:${PATH}
export PATH=${CDSHOME}/tools/concice/bin:${PATH}
export PATH=${CDSHOME}/tools/dracula/bin:${PATH}
export PATH=${OA_HOME}/bin:${PATH}
export PATH=${CNI_PLAT_ROOT}/3rd/bin:${PATH}
export PATH=${CNI_PLAT_ROOT}/3rd/oa/bin/sunos_58_32/opt:${PATH}
export PATH=${CNI_PLAT_ROOT}/bin:${PATH}
export PATH=${CNI_ROOT}/bin:${PATH}
export PATH=${SOC}/bin:${PATH}
export PATH=${CDS_SITE}/bin:${PATH}
export PATH=${IUS}/tools/bin:${PATH}
export PATH=${IUS}/tools/dfII/bin:${PATH}
export PATH=${ICC}/tools/iccraft/bin:${PATH}
export PATH=${RC}/bin:${PATH}
export PATH=${DSM}/tools/dsm/bin:${PATH}

export PATH=${AMBIT}/BuildGates/v05.11/bin:${PATH}

export PATH=${PATH}:/pkgs/cadence6/MMSIM71/tools/spectre/bin/

export LD_LIBRARY_PATH=${CDSHOME}/tools/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${OA_HOME}/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${CNI_PLAT_ROOT}/3rd/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${CNI_PLAT_ROOT}/3rd/oa/lib/sunos_58_32/opt:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${CNI_PLAT_ROOT}/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/ucblib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${IUS}/tools/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${DSM}/tools/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${SOC}/tools/lib:${LD_LIBRARY_PATH}

