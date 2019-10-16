#PROVA
#BASENAME LIBRARY
set TECHLIB "ST_CMOS028"
set LIB_PATH "/home/techlibs/LIB_NEW"

# setup the Setup...Defaults menusource -echo -verbose /home/techlibs/SAED/common_setup.tcl
set designer "MIcrelLab - Unibo"
set company "ST_Microelectronics"
set snps  [getenv "SYNOPSYS"]
set search_path  [lappend search_path "${snps}/libraries/syn" ]
set search_path  [lappend search_path "${snps}" ]

#Cells Technology_Kit
set search_path  [lappend search_path "$LIB_PATH/libs"];

set TARGET_LIBRARY_FILES          "  C28SOI_SC_8_CLK_LR_ss28_0.60V_0C.db         \
                                     C28SOI_SC_8_CORE_LR_ss28_0.60V_0C.db        \
                                     C28SOI_SC_8_COREPBP10_LR_ss28_0.60V_0C.db   \
                                     C28SOI_SC_8_COREPBP16_LR_ss28_0.60V_0C.db   \
                                     C28SOI_SC_8_COREPBP4_LR_ss28_0.60V_0C.db    "

set ADDITIONAL_LINK_LIB_FILES     "  SPHD_LOVOLT_PULP_ss28_0.60V_0C_RCMAX_2ey.db \
                                     C28SOI_SC_8_PR_LR_ss28_0.60V_0C.db          "

set SYMB_LIB                      "  C28SOI_SC_8_CLK_LR.sdb         \
                                     C28SOI_SC_8_CORE_LR.sdb        \
                                     C28SOI_SC_8_COREPBP10_LR.sdb   \
                                     C28SOI_SC_8_COREPBP16_LR.sdb   \
                                     C28SOI_SC_8_COREPBP4_LR.sdb    \
                                     C28SOI_SC_8_PR_LR.sdb          "

set MW_REFERENCE_LIB_DIRS        "  $LIB_PATH/mw/C28SOI_SC_8_CLK_LR           \
                                    $LIB_PATH/mw/C28SOI_SC_8_CORE_LR          \
                                    $LIB_PATH/mw/C28SOI_SC_8_COREPBP10_LR     \
                                    $LIB_PATH/mw/C28SOI_SC_8_COREPBP16_LR     \
                                    $LIB_PATH/mw/C28SOI_SC_8_COREPBP4_LR      \
                                    $LIB_PATH/mw/C28SOI_SC_8_PR_LR            \
                                    $LIB_PATH/mw/SPHD_LOVOLT_PULP             \
                                    $LIB_PATH/mw/unitTile_8T                  "

set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the MW ref libs

set TECH_FILE                     "$LIB_PATH/tech/TECH/tech.tf"; #Milkyway technology file

set MAP_FILE                      "$LIB_PATH/tech/TLUPLUS/mapfile"  ;#  Mapping file for TLUplus

set TLUPLUS_MAX_FILE              "$LIB_PATH/tech/TLUPLUS/FuncRCmax/tluplus"  ;#  MAX TLUplus file

set TLUPLUS_MIN_FILE              "$LIB_PATH/tech/TLUPLUS/FuncRCmin/tluplus" ;#  MIN TLUplus file

set TLUPLUS_TYP_FILE              "$LIB_PATH/tech/TLUPLUS/nominal/tluplus" ;#  TYP TLUplus File

set MW_POWER_NET                  "vdd" ;
set MW_POWER_PORT                 "vdd" ;
set MW_GROUND_NET                 "gnd" ;
set MW_GROUND_PORT                "gnd" ;

set MIN_ROUTING_LAYER             ""   ;# Min routing layerclock_gating/
set MAX_ROUTING_LAYER             "B2"   ;# Max routing layer is M7

# Site Specific Variables
set SYNTH_LIB "dw_foundation.sldb dft_jtag.sldb  dft_lbist.sldb  dft_mbist.sldb  standard.sldb"

source $LIB_PATH/tech/dontUseCells
source $LIB_PATH/tech/delayCells
source $LIB_PATH/tech/lowDriveCells

echo " Sourcing names rules \n"
#source -echo -verbose /home/techlibs/cmos028/SetupTechno/utils/synopsys_unicad_dc.tcl
#source -echo -verbose /home/techlibs/cmos028/SetupTechno/utils/messages.tcl
