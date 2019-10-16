/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_APB_V2_H__
#define __ARCHI_APB_V2_H__
 
//PADs configuration is made of 8bits out of which only the first 6 are used
//bit0    enable pull UP
//bit1    enable pull DOWN
//bit2    enable ST
//bit3    enable SlewRate Limit
//bit4..5 Driving Strength
//bit6..7 not used

#define APB_SOC_INFO_OFFSET       0x00 //contains number of cores [31:16] and clusters [15:0]
#define APB_SOC_INFOEXTD_OFFSET   0x04 //not used at the moment
#define APB_SOC_NOTUSED0_OFFSET   0x08 //not used at the moment
#define APB_SOC_NOTUSED1_OFFSET   0x0C //not used at the moment

#define APB_SOC_PADFUN_OFFSET(g)   (0x10+(g)*4) //sets the mux for pins  g*16+0 (bits [1:0]) to g*16+15 (bits [31:30])
#define APB_SOC_PADFUN_NO(pad)     ((pad) >> 4)
#define APB_SOC_PADFUN_PAD(padfun) ((padfun)*16)
#define APB_SOC_PADFUN_SIZE        2
#define APB_SOC_PADFUN_BIT(pad)    (((pad) & 0xF) << 1)

#define APB_SOC_PADCFG_OFFSET(g)   (0x20+(g)*4) //sets config for pin  g*4+0(bits [7:0]) to pin  g*4+3(bits [31:24])
#define APB_SOC_PADCFG_NO(pad)     ((pad) >> 2)
#define APB_SOC_PADCFG_PAD(padfun) ((padfun)*4)
#define APB_SOC_PADCFG_SIZE        8
#define APB_SOC_PADCFG_BIT(pad)    (((pad) & 0x3) << 3)
 
#define APB_SOC_PWRCMD_OFFSET     0x60 //change power mode(not funtional yet)
#define APB_SOC_PWRCFG_OFFSET     0x64 //configures power modes(not funtional yet)
#define APB_SOC_PWRREG_OFFSET     0x68 //32 bit GP register used by power pngmt routines to see if is hard or cold reboot
#define APB_SOC_NOTUSED2_OFFSET   0x6C //not used at the moment
#define APB_SOC_MMARGIN_OFFSET    0x70 //memory margin pins(not used at the moment)
#define APB_SOC_HS_LS_L2_OFFSET   0x74 //memory margin pins(not used at the moment)
#define APB_SOC_L2_SLEEP_OFFSET   0x78 //memory margin pins(not used at the moment)
#define APB_SOC_NOTUSED3_OFFSET   0x7C //not used at the moment
#define APB_SOC_CLKDIV0_OFFSET    0x80 //soc clock divider(to be removed)
#define APB_SOC_CLKDIV1_OFFSET    0x84 //cluster clock divider(to be removed)
#define APB_SOC_CLKDIV2_OFFSET    0x88 //not used at the moment
#define APB_SOC_CLKDIV3_OFFSET    0x8C //not used at the moment
#define APB_SOC_CLKDIV4_OFFSET    0x90 //not used at the moment
#define APB_SOC_NOTUSED4_OFFSET   0x94 //not used at the moment
#define APB_SOC_NOTUSED5_OFFSET   0x98 //not used at the moment
#define APB_SOC_NOTUSED6_OFFSET   0x9C //not used at the moment
#define APB_SOC_CORESTATUS_OFFSET 0xA0 //32bit GP register to be used during testing to return EOC(bit[31]) and status(bit[30:0])

#define APB_SOC_INFO_CORES_OFFSET    (APB_SOC_INFO_OFFSET + 2)
#define APB_SOC_INFO_CLUSTERS_OFFSET (APB_SOC_INFO_OFFSET)

#define APB_SOC_STATUS_EOC_BIT  31
#define APB_SOC_NB_CORE_BIT     16

#endif
