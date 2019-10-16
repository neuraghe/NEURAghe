#!/bin/tcsh -f
#
#

setenv CMOS28FDSOI_DIR   /dkits/st/cmos28_fdsoi/2.5d 

setenv PDKITROOT     $CMOS28FDSOI_DIR/PDK_STM_cmos28FDSOI_AMS_6U1x_2U2x_2T8x_LB/2.5.d-08

#####################################################
##  Modify the line below with the path to your installation
##  of MMSIM from Cadence
#####################################################

#setenv CDS_MMSIM_DIR /cad/cdsmmsim13_11_049
setenv CDS_MMSIM_DIR /softs/cadence/mmsim/13.11.355
set path=($path $CDS_MMSIM_DIR/tools/bin $CDS_MMSIM_DIR/bin)

#####################################################
##  Modify the line below with the path to your installation
##  of ADMS / Eldo from Mentor
#####################################################
#setenv MGC_AMS_HOME /cad/ams2012_2a
setenv MGC_AMS_HOME /softs/mentor/mgc_ams/13.2d
set path=($path $MGC_AMS_HOME/bin)

#####################################################
##  Check and modify the line below 
#####################################################

#setenv CDS_INST_DIR $CMOS28FDSOI_DIR/UNIOPUS/uniopus_oa/cad_amsams2012_2a_mmsim
setenv CDS_INST_DIR $CMOS28FDSOI_DIR/UNIOPUS/uniopus_oa/ic_ams13.2d_mmsim

setenv  CDS_AUTO_64BIT  ALL 

#################################################
##  Modify the line below with the path to your installation
##  of PVE
#################################################

#setenv PVE_HOME /cad/cdspvs13_11_016
setenv PVE_HOME /softs/cadence/pve/14.11
set path=($path $PVE_HOME/tools/bin $PVE_HOME/bin)
setenv QRC_HOME $PVE_HOME

#######################################################
# Modify the LM_LICENSE_FILE with your installation ###
######  (Cadence license server) ######################
#######################################################

#setenv LM_LICENSE_FILE 5280@cimekey1:5287@cimeldap
setenv LM_LICENSE_FILE 5280@ielsrv01.epfl.ch


##########################################################
######## Environment for Calibre ######################### 
# 1) Modify the path to Calibre installation #############
# 2) Modify the LM_LICENSE_FILE with your installation ###
##########################################################

#setenv MGC_HOME /cad/calibre2013_4_15_12/ixl_cal_2013.4_15.12
setenv MGC_HOME /softs/mentor/calibre/2012.2_17
set path=($path $MGC_HOME/bin )

setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:1718@cimekey1:1717@v212

#################################
# If you are running on RedHat 6
# #################################
#setenv CALIBRE_2013_4_ALLOW_IXL_ON_RHEL6 101010
#setenv USE_CALIBRE_VCO ixl


#####################################################
##  Modify the line below with the path to your installation
##  of Hspice from Synopsys
#####################################################

#setenv HSP_HOME /cad/hspicevH2013_03/hspice
setenv HSP_HOME /softs/synopsys/hspice/2013.12/hspice
source $HSP_HOME/bin/cshrc.meta
set path=($path $HSP_HOME/bin)

#################################################
##  Modify the line below with the path to your installation
##  of StarRCXT from Synopsys
#################################################

#setenv RCXT_HOME_DIR /cad/starrcxt_vH2012_12_sp3/suse64_starrc
setenv RCXT_HOME_DIR /softs/synopsys/rcxt/2010.12
setenv AVANTI_STAR_HOME_DIR $RCXT_HOME_DIR
set path=($path $AVANTI_STAR_HOME_DIR/bin)

#setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:1721@cimekey1
setenv LM_LICENSE_FILE ${LM_LICENSE_FILE}:27000@ielsrv01.epfl.ch

################################################################ 

#######################################################
#######################################################
###  Setting variables for Calibre DRC  ###############
#######################################################
setenv MGC_CALIBRE_DRC_RUNSET_FILE      $PDKITROOT/DATA/DRC/CALIBRE/calibreGuirunsetdrc
setenv MGC_CALIBRE_CUSTOMIZATION_FILE   $PDKITROOT/DATA/DRC/CALIBRE/calibreGuiswitchdef
setenv U2DK_CALIBRE_DRC_DECK            $PDKITROOT/DATA/DRC/CALIBRE/calibredrc_cgi
setenv U2DK_CALIBRE_TVF_PACK            $PDKITROOT/DATA/DRC/CALIBRE
setenv U2DK_CALIBRE_TVF_PLUG_PATH       $PDKITROOT/DATA/DRC/CALIBRE


#######################################################
#######################################################
###  Setting variables for Calibre ANTENNA rules  #####
#######################################################
setenv MGC_CALIBRE_ANTENNA_RUNSET_FILE      $PDKITROOT/DATA/ANTENNA/CALIBRE/calibreGuirunsetAntennadrc
setenv MGC_CALIBRE_ANTENNA_CUSTOMIZATION_FILE   $PDKITROOT/DATA/ANTENNA/CALIBRE/calibreIswitchdefAntennadrc
setenv U2DK_CALIBRE_ANTENNA_DRC_DECK            $PDKITROOT/DATA/ANTENNA/CALIBRE/calibreAntennadrc_cgi


#######################################################
#######################################################
###  Setting variables for Calibre LVS  ###############
#######################################################
setenv MGC_CALIBRE_LVS_RUNSET_FILE      $PDKITROOT/DATA/LVS/CALIBRE/calibreGuirunsetlvs

#######################################################



###################################################
######## DON'T MODIFY THE LINES BELOW #############
###################################################

setenv UNICAD_KERNEL_ROOT $CMOS28FDSOI_DIR/UnicadKernel@4.3@20130114.0
set path=($path $UNICAD_KERNEL_ROOT $UNICAD_KERNEL_ROOT/bin)

setenv UK_PATH $UNICAD_KERNEL_ROOT;

setenv UCDPRJDIR $cwd;

source $UK_PATH/lib/csh/uk-header.csh;


setenv PRODUCT_ROOT $CDS_INST_DIR;
source $CDS_INST_DIR/.uk/uniopus_oa.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/ArtistKit@5.8.2@20121016.0;
source $PRODUCT_ROOT/ArtistKit.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $PDKITROOT;
source $PRODUCT_ROOT/PDK_STM_cmos28FDSOI_AMS_6U1x_2U2x_2T8x_LB.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/CadenceTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB_LowPower@1.0.1@20121114.0;
source $PRODUCT_ROOT/CadenceTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB_LowPower.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/FrontEndKit/4.5-00/;
source $PRODUCT_ROOT/FrontEndKit.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/IccKit@2.7@20121128.1;
source $PRODUCT_ROOT/IccKit.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/SignOffKit@6.1beta4;
source $PRODUCT_ROOT/SignOffKit.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/SignOffTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB@2.2@20121023.0;
source $PRODUCT_ROOT/SignOffTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/SiteDefKit_cmos28@1.4@20120720.0;
source $PRODUCT_ROOT/SiteDefKit_cmos28.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/SocEncounterKit@5.0@20121026.0;
source $PRODUCT_ROOT/SocEncounterKit.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/SynopsysTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB@2.1.2@20121128.2;
source $PRODUCT_ROOT/SynopsysTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/PLSCore@2.6;
source $PRODUCT_ROOT/PLSCore.csh;
unsetenv PRODUCT_ROOT;

setenv PRODUCT_ROOT $CMOS28FDSOI_DIR/Unidoc_2.7.c;
source $PRODUCT_ROOT/Unidoc.csh;
unsetenv PRODUCT_ROOT;

setenv UK_LOAD_PRODS "ArtistKit PDK_STM_cmos28FDSOI_AMS_6U1x_2U2x_2T8x_LB CadenceTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB_LowPower FrontEndKit IccKit SignOffKit PLSCore SignOffTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB SiteDefKit_cmos28 SocEncounterKit SynopsysTechnoKit_cmos028FDSOI_6U1x_2U2x_2T8x_LB UnicadKernel Unidoc uniopus_oa";


source $UK_PATH/lib/csh/uk-tailer.csh;

#######################################################


