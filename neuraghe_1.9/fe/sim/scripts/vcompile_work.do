#!/bin/tcsh
source scripts/colors.sh

\rm -rf work
vlib work

echo ""
echo "${Green}--> Compiling PULP Platform... ${NC}"

source ./scripts/vcompile_components.do    || exit 1
source ./scripts/vcompile_ulpcluster.do    || exit 1
source ./scripts/vcompile_ulpsoc.do        || exit 1
source ./scripts/vcompile_pulp_chip.do     || exit 1
source ./scripts/vcompile_models.do        || exit 1
source ./scripts/vcompile_tb.do            || exit 1

echo "${Green}--> PULP platform compilation Complete! ${NC}"
echo ""
