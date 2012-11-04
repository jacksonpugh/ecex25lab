#---- Cadence user setup ----------------------------------------------
set base_dir=/pkgs/cadence6/
set uname=/pkgs/gnu/bin/uname

export PDK_DIR=/pkgs/cadence6/local/45nPDK/FreePDK45
export CDSHOME=/pkgs/cadence6/IC610
export OSU_FREEPDK=/pkgs/cadence6/local/45nPDK/FreePDK45/osu_soc

export PYTHONPATH=${PDK_DIR}/ncsu_basekit/techfile/cni:${PYTHONPATH}


export MGC_CALIBRE_DRC_RUNSET_FILE=./runset.calibre.drc
export MGC_CALIBRE_LVS_RUNSET_FILE=./runset.calibre.lvs
export MGC_CALIBRE_PEX_RUNSET_FILE=./runset.calibre.pex
