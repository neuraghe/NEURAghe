#!/bin/tcsh
 source scripts/colors.sh
 
 
echo "${Green} -> Compiling Simulation Models..."

echo "${Red}"

vlog -quiet ../tb/models/spi_flash/S25fs256s/model/s25fs256s.v         || exit 1
vlog -quiet ../tb/models/24xx1025/24FC1025.v                           || exit 1
vlog -quiet ../tb/models/24xx1025/24AA1025.v                           || exit 1
vlog -quiet ../tb/models/24xx1025/24LC1025.v                           || exit 1
vlog -quiet ../tb/models/23A1024/23A1024.v                             || exit 1
vlog -quiet ../tb/models/mram/mr10q010/mr10q010.v                      || exit 1

vlog -quiet     ../tb/models/i2s/i2c_if.v                              || exit 1
vlog -quiet -sv ../tb/models/i2s/i2s_vip_channel.sv                    || exit 1
vlog -quiet -sv ../tb/models/i2s/i2s_vip.sv                            || exit 1

echo "${Cyan} Simulation model files have been compiled Succesfully${NC}"



