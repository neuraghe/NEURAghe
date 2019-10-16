#!/bin/bash

Red='\033[0;31m'
Black='\033[0;30m'     
Blue='\033[0;34m'    
Green='\033[0;32m'     
Cyan='\033[0;36m'     
Red='\033[0;31m'     
Purple='\033[0;35m'     
Brown='\033[0;33m'     
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'
clear
echo "Welcome to the CNN processing platform from Sardinia"
echo -e "${Blue}          ${Green}        ${Red}         ${Yellow}        ${Green}        ${Red}         ${Blue}        ${Yellow}        ${Red}  ${NC}"
echo -e "${Blue}███╗   ██╗${Green}███████╗${Red}██╗   ██╗${Yellow}██████╗ ${Green} █████╗ ${Red} ██████╗ ${Blue}██╗  ██╗${Yellow}███████╗${Red}  ${NC}"
echo -e "${Blue}████╗  ██║${Green}██╔════╝${Red}██║   ██║${Yellow}██╔══██╗${Green}██╔══██╗${Red}██╔════╝ ${Blue}██║  ██║${Yellow}██╔════╝${Red}  ${NC}"
echo -e "${Blue}██╔██╗ ██║${Green}█████╗  ${Red}██║   ██║${Yellow}██████╔╝${Green}███████║${Red}██║  ███╗${Blue}███████║${Yellow}█████╗  ${Red}  ${NC}"
echo -e "${Blue}██║╚██╗██║${Green}██╔══╝  ${Red}██║   ██║${Yellow}██╔══██╗${Green}██╔══██║${Red}██║   ██║${Blue}██╔══██║${Yellow}██╔══╝  ${Red}  ${NC}"
echo -e "${Blue}██║ ╚████║${Green}███████╗${Red}╚██████╔╝${Yellow}██║  ██║${Green}██║  ██║${Red}╚██████╔╝${Blue}██║  ██║${Yellow}███████╗${Red}  ${NC}"
echo -e "${Blue}╚═╝  ╚═══╝${Green}╚══════╝${Red} ╚═════╝ ${Yellow}╚═╝  ╚═╝${Green}╚═╝  ╚═╝${Red} ╚═════╝ ${Blue}╚═╝  ╚═╝${Yellow}╚══════╝${Red}  ${NC}"    
echo -e "${Blue}          ${Green}        ${Red}         ${Yellow}        ${Green}        ${Red}         ${Blue}        ${Yellow}        ${Red}  ${NC}"
echo "Type neuraghe_help for help."
echo "Enjoy!!"
echo
alias neuraghe_help='cat neuraghe_help.txt'
#alias load_bitstream='source load_bitstream.sh'
alias check_bitstream='if [ $(cat /sys/class/xdevcfg/xdevcfg/device/prog_done) == "1" ]; then echo -e "${Green}[OK] Bitstream loaded!${NC}"; else echo -e "${Yellow}[WARNING] No bitstream loaded!${NC}"; fi'

function load_bitstream(){
  if [ -e $1 ]; then cat $1 > /dev/xdevcfg; echo -e "${Green}[OK] FPGA programmed!${NC}" ; else echo -e "${Red}[ERROR]File not found!${NC}"; fi
  }
