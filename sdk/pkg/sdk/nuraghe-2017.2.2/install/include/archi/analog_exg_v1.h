/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_ANALOG_EXG_V1_H__
#define __ARCHI_ANALOG_EXG_V1_H__

/*
 * Analog EXG ARCHI file for VivoSoC IP: EXG_CHANNEL_IP, EXG_SAR_IP, EXG_EIM_IP
 * Use this file for EXG IPs compliant to VivoSoC2
 */



// Base register offset for EXG channels 
#define PLP_ANALOG_CHANNEL_OFFSET         0x10

/*
 * EXG_CHANNEL_IP: EXG Analog Channels Cerebro
 */

#define EXG_CHANNEL_ENABLE                   		0x00
#define EXG_CHANNEL_GAIN                        	0x01
#define EXG_CHANNEL_DEODAC                    		0x02
#define EXG_CHANNEL_PAODAC                    		0x03


/*
 * EXG_SAR_IP: SAR Cerebro
 */

#define EXG_SAR_CWR_0                				0x00
#define EXG_SAR_CWR_1                				0x01
#define EXG_SAR_CWR_2                				0x02
#define EXG_SAR_CWR_3                				0x03
#define EXG_SAR_CWR_4                				0x04
#define EXG_SAR_CWR_5                				0x05
#define EXG_SAR_CWR_6                				0x06
#define EXG_SAR_CWR_7                				0x07
#define EXG_SAR_CWR_8                				0x08
#define EXG_SAR_CWR_9                				0x09
#define EXG_SAR_CWR_10                				0x0A
#define EXG_SAR_CWR_11                				0x0B
#define EXG_SAR_CWR_12                				0x0C
#define EXG_SAR_CWR_13                				0x0D
#define EXG_SAR_CWR_14                				0x0E
#define EXG_SAR_CWR_15                				0x0F
#define EXG_SAR_CWR_16                				0x10
#define EXG_SAR_PCWR                				0x11
#define EXG_SAR_OSR                    				0x12
#define EXG_SAR_MFCR                				0x13
#define EXG_SAR_ASR                    				0x14
#define EXG_SAR_SGS                    				0x15
#define EXG_SAR_DSR                    				0x16
#define EXG_SAR_LCR                    				0x17
#define EXG_SAR_CC_0                				0x18
#define EXG_SAR_CC_1                				0x19
#define EXG_SAR_CC_2                				0x1A
#define EXG_SAR_CC_3                				0x1B
#define EXG_SAR_CC_4                				0x1C
#define EXG_SAR_CC_5                				0x1D
#define EXG_SAR_CC_6                				0x1E
#define EXG_SAR_CC_7                				0x1F
#define EXG_SAR_CC_8                				0x20
#define EXG_SAR_CC_9                				0x21
#define EXG_SAR_CC_10                				0x22
#define EXG_SAR_CC_11                				0x23
#define EXG_SAR_CC_12                				0x24
#define EXG_SAR_CC_13                				0x25
#define EXG_SAR_CC_14                				0x26
#define EXG_SAR_CC_15                				0x27
#define EXG_SAR_CC_16                				0x28
#define EXG_SAR_RC                   				0x29
#define EXG_SAR_CIC_0                    			0x2A
#define EXG_SAR_CIC_1                    			0x2B
#define EXG_SAR_CIC_2                    			0x2C
#define EXG_SAR_CIC_3                    			0x2D
#define EXG_SAR_CIC_4                    			0x2E
#define EXG_SAR_CIC_5                    			0x2F
#define EXG_SAR_CIC_6                    			0x30
#define EXG_SAR_CIC_7                    			0x31
#define EXG_SAR_CIC_8                    			0x32


/*
 * EXG_EIM_IP: Electrode Impedance Measurement
 */

#define EXG_EIM_IP_ENABLE                    		0x00
#define EXG_EIM_CON_HRES                     		0x01
#define EXG_EIM_CON_LERS                     		0x02
#define EXG_EIM_CS_SEL_CH_0                    		0x03
#define EXG_EIM_CS_SEL_CH_1                    		0x04
#define EXG_EIM_CS_SEL_CH_2                    		0x05
#define EXG_EIM_CS_SEL_CH_3                    		0x06
#define EXG_EIM_CS_SEL_CH_4                    		0x07
#define EXG_EIM_CS_SEL_CH_5                    		0x08
#define EXG_EIM_CS_SEL_CH_6                    		0x09
#define EXG_EIM_CS_SEL_CH_7                    		0x0A
#define EXG_EIM_EN_NEG                         		0x0B
#define EXG_EIM_EN_POS                         		0x0C
#define EXG_EIM_CLK_SET                        		0x0D

#endif