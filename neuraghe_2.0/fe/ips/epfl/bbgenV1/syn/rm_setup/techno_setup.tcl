#BASENAME LIBRARY
set TECHLIB "ST_CMOS028"

set SERVER_NAME [exec hostname]

switch $SERVER_NAME {
    winnfield { set LIB_PATH "/home/techlibs/LIBS_May_26_2015"                    }
    micrel205 { set LIB_PATH "/home/aux_cad2/cmos028_fdsoi/PULP3/LIBS"            }
    vega      { set LIB_PATH "/home/techlibs/LIBS_May_26_2015"                    }
    default   { puts "PLEASE SPECIFY THE MAIN LIBRARY FOLDER!!!!" ; exit 0        }
}


set USE_PB0    "TRUE"
set USE_PB4    "FALSE"
set USE_PB10   "FALSE"
set USE_PB16   "FALSE"


# setup the Setup...Defaults menusource -echo -verbose /home/techlibs/SAED/common_setup.tcl
set designer "MIcrelLab - Unibo"
set company "ST_Microelectronics"
set snps [exec dirname  [exec dirname [exec which dc_shell]]]
set search_path  [lappend search_path "${snps}/libraries/syn" ]
set search_path  [lappend search_path "${snps}" ]

set SYNOPSYS_TECHNOKIT       "$LIB_PATH/SynopsysTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB/2.2.4@20131108.0"
set CLK_LR_ADDON_DIR         "$LIB_PATH/C28SOI_SC_8_CLK_LR_ADDONDP/3.1-00"
set CLK_LR_DIR               "$LIB_PATH/C28SOI_SC_8_CLK_LR/3.1-00"
set CORE_LR_ADDON_DIR        "$LIB_PATH/C28SOI_SC_8_CORE_LR_ADDONDP/3.1-00"
set CORE_LR_DIR              "$LIB_PATH/C28SOI_SC_8_CORE_LR/3.2-00"
set COREPBP10_LR_ADDON_DIR   "$LIB_PATH/C28SOI_SC_8_COREPBP10_LR_ADDONDP/3.1-00"
set COREPBP10_LR_DIR         "$LIB_PATH/C28SOI_SC_8_COREPBP10_LR/3.2-00"
set COREPBP16_LR_ADDON_DIR   "$LIB_PATH/C28SOI_SC_8_COREPBP16_LR_ADDONDP/3.0-00"
set COREPBP16_LR_DIR         "$LIB_PATH/C28SOI_SC_8_COREPBP16_LR/3.1-00"
set COREPBP4_LR_ADDON_DIR    "$LIB_PATH/C28SOI_SC_8_COREPBP4_LR_ADDONDP/3.1-00"
set COREPBP4_LR_DIR          "$LIB_PATH/C28SOI_SC_8_COREPBP4_LR/3.2-00"
set SHIFTLV_LR_LR_DIR        "$LIB_PATH/C28SOI_SC_8_SHIFTLV_LR/1.1@20121026.0"
set PR_LR_DIR_ADDON          "$LIB_PATH/C28SOI_SC_8_PR_LR_ADDONDP/3.2-00"
set PR_LR_DIR                "$LIB_PATH/C28SOI_SC_8_PR_LR/3.2-00"
set MOD_LIB_DIR              "$LIB_PATH/mod_libs"

set TESTMUX1V8_LR_DIR        "$LIB_PATH/C28SOI_IO_SF_TESTMUX1V8_LR_EG_6U1X2U2X2T8XLB/2.0@20130215.1"
set IO_BASIC_DIR             "$LIB_PATH/C28SOI_IO_SF_BASIC_EG_6U1X2U2X2T8XLB/2.1@20130215.2"
set MEM_ROM_LOLEAK_DIR       "$LIB_PATH/C28SOI_MEM_ROM_LOLEAK--PULP_ROM__116838/1.1-00@20141017.12"
set MEM_SRAM_SPHD_LOVOLT_DIR "$LIB_PATH/C28SOI_MEM_SRAM_SPHD_LOVOLT--SPHD_LOVOLT_PULP__134839/1.0-00@20150519.14"







#Cells Technology_Kit
#Cells Technology_Kit
set search_path  [ join " $CLK_LR_ADDON_DIR/libs
                          $CLK_LR_DIR/libs
                          $CORE_LR_ADDON_DIR/libs
                          $CORE_LR_DIR/libs
                          $COREPBP10_LR_ADDON_DIR/libs
                          $COREPBP10_LR_DIR/libs
                          $COREPBP16_LR_ADDON_DIR/libs
                          $COREPBP16_LR_DIR/libs
                          $COREPBP4_LR_ADDON_DIR/libs
                          $COREPBP4_LR_DIR/libs
                          $SHIFTLV_LR_LR_DIR/libs
                          $MOD_LIB_DIR
                          $PR_LR_DIR_ADDON/libs
                          $PR_LR_DIR/libs
                          $MEM_SRAM_SPHD_LOVOLT_DIR/libs
                       "]


set TARGET_LIBRARY_FILES    [ join " C28SOI_SC_8_CLK_LR_ss28_0.60V_125C_mod.db
                                     C28SOI_SC_8_CLK_LR_ss28_0.80V_125C_mod.db
                                     C28SOI_SC_8_CLK_LR_ss28_0.90V_125C.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.60V_0.60V_125C_mod.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.60V_0.80V_125C_mod.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.80V_0.60V_125C_mod.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.80V_0.80V_125C_mod.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.90V_0.90V_125C.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.90V_0.80V_125C.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.80V_0.90V_125C.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.90V_0.60V_125C.db
                                     C28SOI_SC_8_SHIFTLV_LR_ss28_0.60V_0.90V_125C.db
                            "]

if { $USE_PB0 == "TRUE" }  { set TARGET_LIBRARY_FILES   [ join "$TARGET_LIBRARY_FILES  C28SOI_SC_8_CORE_LR_ss28_0.60V_125C_mod.db      C28SOI_SC_8_CORE_LR_ss28_0.80V_125C_mod.db      C28SOI_SC_8_CORE_LR_ss28_0.90V_125C.db  "]     }
if { $USE_PB10 == "TRUE" } { set TARGET_LIBRARY_FILES   [ join "$TARGET_LIBRARY_FILES  C28SOI_SC_8_COREPBP10_LR_ss28_0.60V_125C_mod.db C28SOI_SC_8_COREPBP10_LR_ss28_0.80V_125C_mod.db C28SOI_SC_8_COREPBP10_LR_ss28_0.90V_125C.db "] }
if { $USE_PB16 == "TRUE" } { set TARGET_LIBRARY_FILES   [ join "$TARGET_LIBRARY_FILES  C28SOI_SC_8_COREPBP16_LR_ss28_0.60V_125C_mod.db C28SOI_SC_8_COREPBP16_LR_ss28_0.80V_125C_mod.db C28SOI_SC_8_COREPBP16_LR_ss28_0.90V_125C.db "] }
if { $USE_PB4 == "TRUE" }  { set TARGET_LIBRARY_FILES   [ join "$TARGET_LIBRARY_FILES  C28SOI_SC_8_COREPBP4_LR_ss28_0.60V_125C_mod.db  C28SOI_SC_8_COREPBP4_LR_ss28_0.80V_125C_mod.db  C28SOI_SC_8_COREPBP4_LR_ss28_0.90V_125C.db  "] }


set ADDITIONAL_LINK_LIB_FILES [ join " SPHD_LOVOLT_PULP_ss28_0.60V_125C_RCMAX_mod.db
                                       SPHD_LOVOLT_PULP_ss28_0.80V_125C_RCMAX_mod.db
                                       SPHD_LOVOLT_PULP_ss28_0.90V_125C_RCMAX_mod.db
                                       C28SOI_SC_8_PR_LR_ss28_0.60V_125C_mod.db
                                       C28SOI_SC_8_PR_LR_ss28_0.80V_125C_mod.db
                                       C28SOI_SC_8_PR_LR_ss28_0.90V_125C.db
                               "]

set SYMB_LIB               [ join "  C28SOI_SC_8_CLK_LR.sdb
                                     C28SOI_SC_8_CORE_LR.sdb
                                     C28SOI_SC_8_COREPBP10_LR.sdb
                                     C28SOI_SC_8_COREPBP16_LR.sdb
                                     C28SOI_SC_8_COREPBP4_LR.sdb
                                     C28SOI_SC_8_SHIFTLV_LR.sdb
                                     C28SOI_SC_8_PR_LR.sdb
                            "]




set MW_REFERENCE_LIB_DIRS [ join "  $CLK_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_CLK_LR
                                    $SHIFTLV_LR_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_SHIFTLV_LR
                                    $PR_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_PR_LR
                                    $MEM_SRAM_SPHD_LOVOLT_DIR/SYNOPSYS/PR/SPHD_LOVOLT_PULP
                                    $SYNOPSYS_TECHNOKIT/COMMON/UnitTile/unitTile_8T   "]

if { $USE_PB0 == "TRUE" }  {   set MW_REFERENCE_LIB_DIRS   [ join "$MW_REFERENCE_LIB_DIRS  $CORE_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_CORE_LR"]  }
if { $USE_PB4 == "TRUE" }  {   set MW_REFERENCE_LIB_DIRS   [ join "$MW_REFERENCE_LIB_DIRS  $COREPBP4_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_COREPBP4_LR"]  }
if { $USE_PB10 == "TRUE" } {   set MW_REFERENCE_LIB_DIRS   [ join "$MW_REFERENCE_LIB_DIRS  $COREPBP10_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_COREPBP10_LR"]  }
if { $USE_PB16 == "TRUE" } {   set MW_REFERENCE_LIB_DIRS   [ join "$MW_REFERENCE_LIB_DIRS  $COREPBP16_LR_DIR/SYNOPSYS/PR/C28SOI_SC_8_COREPBP16_LR"]  }


set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the MW ref libs

set TECH_FILE                     "$SYNOPSYS_TECHNOKIT/COMMON/tech.tf"; #Milkyway technology file

set MAP_FILE                      "$SYNOPSYS_TECHNOKIT/TLUPLUS/mapfile"  ;#  Mapping file for TLUplus

set TLUPLUS_MAX_FILE              "$SYNOPSYS_TECHNOKIT/TLUPLUS/FuncRCmax/tluplus"  ;#  MAX TLUplus file

set TLUPLUS_MIN_FILE              "$SYNOPSYS_TECHNOKIT/TLUPLUS/FuncRCmin/tluplus" ;#  MIN TLUplus file

set TLUPLUS_TYP_FILE              "$SYNOPSYS_TECHNOKIT/TLUPLUS/nominal/tluplus" ;#  TYP TLUplus File

set MW_POWER_NET                  "vdd" ;
set MW_POWER_PORT                 "vdd" ;
set MW_GROUND_NET                 "gnd" ;
set MW_GROUND_PORT                "gnd" ;

set MIN_ROUTING_LAYER             ""     ;# Min routing layerclock_gating/
set MAX_ROUTING_LAYER             "B2"   ;# Max routing layer is M7


# Site Specific Variables
set SYNTH_LIB "dw_foundation.sldb   standard.sldb"


#FIXME ADD HERE THE dont use cells  INFO
set    LIBRARY_DONT_USE_FILE  "" ;# Tcl file with library modifications for dont_use

source $LIB_PATH/tech/dontUseCells
source $LIB_PATH/tech/delayCells
source $LIB_PATH/tech/lowDriveCells

echo " Sourcing names rules \n"
#source -echo -verbose /home/techlibs/cmos028/SetupTechno/utils/synopsys_unicad_dc.tcl
#source -echo -verbose /home/techlibs/cmos028/SetupTechno/utils/messages.tcl
