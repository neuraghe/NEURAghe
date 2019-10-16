/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_ANALOG_CONTROL_V1_H__
#define __ARCHI_ANALOG_CONTROL_V1_H__

/*
 * Analog control ARCHI file for VivoSoC IPs: CONTROL_BG_BIAS_IP, CONTORL_CLK_DIV_IP, CONTORL_CLK_GEN_IP, CONTORL_PMU_IP
 * Use this file for control IPs compliant to VivoSoC2
 */

/*
 * CONTROL_BG_BIAS_IP: Band-Gap and Biases
 */

// Register defines, register number according to register offset in IP
#define CONTROL_BG_BIAS_EN                      	0x00
#define CONTROL_BG_BIAS_BOOST_EN                 	0x01
#define CONTROL_BG_BIAS_CURRENT_EN                	0x02
#define CONTROL_BG_BIAS_IP6_0V6_EN                	0x03
#define CONTROL_BG_BIAS_IP6_1V2_EN                	0x04
#define CONTROL_BG_BIAS_BIAS_ALL_EN                	0x05
#define CONTROL_BG_BIAS_IBIAS_VREF_EXG	         	0x08
#define CONTROL_BG_BIAS_IBIAS_VCM_EXG	        	0x09
#define CONTROL_BG_BIAS_IBIAS_PMU                  	0x0A
#define CONTROL_BG_BIAS_PGND_VALUE                 	0x0B
#define CONTROL_BG_BIAS_IBIAS_STIM                 	0x0C
#define CONTROL_BG_BIAS_IBIAS_PPG                  	0x0D
#define CONTROL_BG_BIAS_IBIAS_PPG_1V2              	0x0E
#define CONTROL_BG_BIAS_IBIAS_PGND                 	0x0F
#define CONTROL_BG_BIAS_IBIAS_BIOZ                 	0x10
#define CONTROL_BG_BIAS_IBIAS_VCM_BIOZ             	0x11
#define CONTROL_BG_BIAS_IBIAS_VREF_BIOZ            	0x12
#define CONTROL_BG_BIAS_BAR_PGND_EN                	0x15


// Bitfield defines

// These are SW defines, to be compliant with next generation

//CONTROL_BG_BIAS_REG
#define CONTROL_BG_BIAS_EN_OFFSET        			0x00
#define CONTROL_BG_BIAS_EN_NBITS         			0x01

#define CONTROL_BG_BIAS_BOOST_EN_OFFSET  			0x01
#define CONTROL_BG_BIAS_BOOST_EN_NBITS   			0x01

#define CONTROL_BG_BIAS_CURRENT_EN_OFFSET           0x02
#define CONTROL_BG_BIAS_CURRENT_EN_NBITS            0x01

#define CONTROL_BG_BIAS_IP6_0V6_EN_OFFSET           0x03
#define CONTROL_BG_BIAS_IP6_0V6_EN_NBITS            0x01

#define CONTROL_BG_BIAS_IP6_1V2_EN_OFFSET           0x04
#define CONTROL_BG_BIAS_IP6_1V2_EN_NBITS            0x01

#define CONTROL_BG_BIAS_BIAS_ALL_EN_OFFSET          0x05
#define CONTROL_BG_BIAS_BIAS_ALL_EN_NBITS           0x01

#define CONTROL_BG_BIAS_IBIAS_VREF_EXG_OFFSET       0x06
#define CONTROL_BG_BIAS_IBIAS_VREF_EXG_NBITS        0x02

#define CONTROL_BG_BIAS_IBIAS_VCM_EXG_OFFSET        0x08
#define CONTROL_BG_BIAS_IBIAS_VCM_EXG_NBITS        	0x02

#define CONTROL_BG_BIAS_IBIAS_PMU_OFFSET            0x0A
#define CONTROL_BG_BIAS_IBIAS_PMU_NBITS             0x02

#define CONTROL_BG_BIAS_IBIAS_STIM_OFFSET           0x0C
#define CONTROL_BG_BIAS_IBIAS_STIM_NBITS            0x02

#define CONTROL_BG_BIAS_IBIAS_PPG_OFFSET            0x0E
#define CONTROL_BG_BIAS_IBIAS_PPG_NBITS             0x02

#define CONTROL_BG_BIAS_IBIAS_PPG_1V2_OFFSET        0x10
#define CONTROL_BG_BIAS_IBIAS_PPG_1V2_NBITS        	0x02

#define CONTROL_BG_BIAS_IBIAS_PGND_OFFSET           0x12
#define CONTROL_BG_BIAS_IBIAS_PGND_NBITS            0x02

#define CONTROL_BG_BIAS_IBIAS_BIOZ_OFFSET           0x14
#define CONTROL_BG_BIAS_IBIAS_BIOZ_NBITS            0x02

#define CONTROL_BG_BIAS_IBIAS_VCM_BIOZ_OFFSET       0x16
#define CONTROL_BG_BIAS_IBIAS_VCM_BIOZ_NBITS        0x02

#define CONTROL_BG_BIAS_IBIAS_VREF_BIOZ_OFFSET      0x18
#define CONTROL_BG_BIAS_IBIAS_VREF_BIOZ_NBITS       0x02

#define CONTROL_BG_BIAS_BAR_PGND_EN_OFFSET          0x1A
#define CONTROL_BG_BIAS_BAR_PGND_EN_NBITS           0x01

#define CONTROL_BG_BIAS_PGND_VALUE_OFFSET           0x1B
#define CONTROL_BG_BIAS_PGND_VALUE_NBITS            0x03


/*
 * CONTORL_CLK_DIV_IP: Clock Divider
 */

// Register defines, register number according to register offset in IP
#define CONTROL_CLK_DIV_EN_REGS                    	0x00
#define CONTROL_CLK_DIV_FCT_MASTER               	0x01
#define CONTROL_CLK_DIV_FCT_EXG_SAR                	0x02
#define CONTROL_CLK_DIV_EXG_NUM_CH            		0x03
#define CONTROL_CLK_DIV_EXG_CH_WDW            		0x04
#define CONTROL_CLK_DIV_EXG_GAP_WIDTH         		0x05
#define CONTROL_CLK_DIV_EXG_CONV_MODE         		0x06
#define CONTROL_CLK_DIV_EXG_TRIGGER_WIDTH   	  	0x07
#define CONTROL_CLK_DIV_EXG_TRIGGER_DELAY	    	0x08
#define CONTROL_CLK_DIV_EXG_TRACK_DELAY	        	0x09
#define CONTROL_CLK_DIV_FCT_AMP                    	0x0A
#define CONTROL_CLK_DIV_AMP_INV                    	0x0B
#define CONTROL_CLK_DIV_AMP_ENABLE_DELAY        	0x0C
#define CONTROL_CLK_DIV_AMP_CHOP_DELAY            	0x0D
#define CONTROL_CLK_DIV_FCT_BG                     	0x0E
#define CONTROL_CLK_DIV_BG_INV                     	0x0F
#define CONTROL_CLK_DIV_BG_EN_DUTY_CYCLE         	0x10
#define CONTROL_CLK_DIV_BG_DUTY_CYCLE            	0x11
#define CONTROL_CLK_DIV_FCT_EXG_EIM_A               0x12
#define CONTROL_CLK_DIV_FCT_EXG_EIM_D               0x13
#define CONTROL_CLK_DIV_FCT_PPG                    	0x14
#define CONTROL_CLK_DIV_FCT_STIM                	0x15
#define CONTROL_CLK_DIV_FCT_TEMP                	0x16
#define CONTROL_CLK_DIV_FCT_BIOZ_1                	0x17
#define CONTROL_CLK_DIV_FCT_BIOZ_2                 	0x18
#define CONTROL_CLK_DIV_FCT_BIOZ_SAR            	0x19
#define CONTROL_CLK_DIV_BIOZ_NUM_CH                	0x1A
#define CONTROL_CLK_DIV_BIOZ_CH_WDW                	0x1B
#define CONTROL_CLK_DIV_BIOZ_GAP_WIDTH            	0x1C
#define CONTROL_CLK_DIV_BIOZ_CONV_MODE            	0x1D
#define CONTROL_CLK_DIV_BIOZ_TRIGGER_WIDTH         	0x1E
#define CONTROL_CLK_DIV_BIOZ_TRIGGER_DELAY         	0x1F
#define CONTROL_CLK_DIV_BIOZ_TRACK_DELAY        	0x20

// Bitfield defines

// These are SW defines, to be compliant with next generation

// Split up CONTROL_CLK_DIV_EN_REGS to access single bitfield
#define CONTROL_CLK_DIV_EN_MASTER_OFFSET          	0x00
#define CONTROL_CLK_DIV_EN_MASTER_NBITS          	0x01

#define CONTROL_CLK_DIV_EN_EXG_SAR_OFFSET      		0x01
#define CONTROL_CLK_DIV_EN_EXG_SAR_NBITS          	0x01

#define CONTROL_CLK_DIV_EN_EXG_PHASEGEN_OFFSET     	0x02
#define CONTROL_CLK_DIV_EN_EXG_PHASEGEN_NBITS      	0x01

#define CONTROL_CLK_DIV_EN_AMP_DUTY_OFFSET         	0x03
#define CONTROL_CLK_DIV_EN_AMP_DUTY_NBITS         	0x01

#define CONTROL_CLK_DIV_EN_BG_DUTY_OFFSET         	0x04
#define CONTROL_CLK_DIV_EN_BG_DUTY_NBITS           	0x01

#define CONTROL_CLK_DIV_EN_EXG_EIMA_OFFSET        	0x05
#define CONTROL_CLK_DIV_EN_EXG_EIMA_NBITS          	0x01

#define CONTROL_CLK_DIV_EN_EXG_EIMD_OFFSET         	0x06
#define CONTROL_CLK_DIV_EN_EXG_EIMD_NBITS          	0x01

#define CONTROL_CLK_DIV_EN_PPG_OFFSET             	0x07
#define CONTROL_CLK_DIV_EN_PPG_NBITS              	0x01

#define CONTROL_CLK_DIV_EN_STIM_OFFSET            	0x08
#define CONTROL_CLK_DIV_EN_STIM_NBITS              	0x01

#define CONTROL_CLK_DIV_EN_TEMP_OFFSET             	0x09
#define CONTROL_CLK_DIV_EN_TEMP_NBITS             	0x01

#define CONTROL_CLK_DIV_EN_BIOZ_0_OFFSET           	0x0A
#define CONTROL_CLK_DIV_EN_BIOZ_0_NBITS            	0x01

#define CONTROL_CLK_DIV_EN_BIOZ_1_OFFSET          	0x0B
#define CONTROL_CLK_DIV_EN_BIOZ_1_NBITS            	0x01

#define CONTROL_CLK_DIV_EN_BIOZ_SAR_OFFSET       	0x0C
#define CONTROL_CLK_DIV_EN_BIOZ_SAR_NBITS			0x01

#define CONTROL_CLK_DIV_EN_BIOZ_PHASEGEN_OFFSET   	0x0D
#define CONTROL_CLK_DIV_EN_BIOZ_PHASEGEN_NBITS    	0x01                   

// CLK_DIV_MASTER
#define CONTROL_CLK_DIV_FCT_MASTER_OFFSET          	0x00
#define CONTROL_CLK_DIV_FCT_MASTER_NBITS           	0x04

// Put together EXG stuff that is set multiple times -> EXG REG0
#define CONTROL_CLK_DIV_FCT_EXG_SAR_OFFSET          0x00
#define CONTROL_CLK_DIV_FCT_EXG_SAR_NBITS           0x04

#define CONTROL_CLK_DIV_EXG_NUM_CH_OFFSET   	    0x04
#define CONTROL_CLK_DIV_EXG_NUM_CH_NBITS 	    	0x04

#define CONTROL_CLK_DIV_CH_WDW_EXG_OFFSET          	0x10
#define CONTROL_CLK_DIV_CH_WDW_EXG_NBITS       	    0x10

// Put together EXG stuff that is only set once -> EXG REG1
#define CONTROL_CLK_DIV_EXG_TRIGGER_WIDTH_OFFSET    0x00
#define CONTROL_CLK_DIV_EXG_TRIGGER_WIDTH_NBITS     0x06

#define CONTROL_CLK_DIV_EXG_TRIGGER_DELAY_OFFSET    0x06
#define CONTROL_CLK_DIV_EXG_TRIGGER_DELAY_NBITS    	0x06

#define CONTROL_CLK_DIV_EXG_GAP_WIDTH_OFFSET       	0x0C
#define CONTROL_CLK_DIV_EXG_GAP_WIDTH_NBITS         0x04

#define CONTROL_CLK_DIV_EXG_TRACK_DELAY_OFFSET      0x10
#define CONTROL_CLK_DIV_EXG_TRACK_DELAY_NBITS       0x06

#define CONTROL_CLK_DIV_EXG_CONV_MODE_OFFSET  		0x16
#define CONTROL_CLK_DIV_EXG_CONV_MODE_NBITS       	0x02

// Put together chopping stuff that is dependent on clock -> CHOPPING_REG_0
#define CONTROL_CLK_DIV_AMP_CHOP_DELAY_OFFSET      	0x00
#define CONTROL_CLK_DIV_AMP_CHOP_DELAY_NBITS       	0x10

#define CONTROL_CLK_DIV_FCT_AMP_OFFSET             	0x10
#define CONTROL_CLK_DIV_FCT_AMP_NBITS              	0x04

// Put together chopping stuff that is used only once -> CHOPPING_REG_1
#define CONTROL_CLK_DIV_AMP_INV_OFFSET             	0x00
#define CONTROL_CLK_DIV_AMP_INV_NBITS              	0x01

#define CONTROL_CLK_DIV_AMP_ENABLE_DELAY_OFFSET   	0x01
#define CONTROL_CLK_DIV_AMP_ENABLE_DELAY_NBITS     	0x01

// Put together DUTY_BG stuff that is dependent on clock -> DUTY_BG_REG_0
#define CONTROL_CLK_DIV_BG_DUTY_CYCLE_OFFSET        0x00
#define CONTROL_CLK_DIV_BG_DUTY_CYCLE_NBITS         0x0E

#define CONTROL_CLK_DIV_FCT_BG_OFFSET               0x10
#define CONTROL_CLK_DIV_FCT_BG_NBITS                0x04

// Put together DUTY_BG stuff that is used only once -> DUTY_BG_REG_1
#define CONTROL_CLK_DIV_BG_INV_OFFSET               0x00
#define CONTROL_CLK_DIV_BG_INV_NBITS              	0x01

#define CONTROL_CLK_DIV_BG_EN_DUTY_CYCLE_OFFSET   	0x01
#define CONTROL_CLK_DIV_BG_EN_DUTY_CYCLE_NBITS     	0x01

// Put together EIM CLK divider -> CLK_DIV_EIM_REG
#define CONTROL_CLK_DIV_FCT_EXC_EIM_A_OFFSET        0x00
#define CONTROL_CLK_DIV_FCT_EXC_EIM_A_NBITS         0x04

#define CONTROL_CLK_DIV_FCT_EXC_EIM_D_OFFSET        0x04
#define CONTROL_CLK_DIV_FCT_EXC_EIM_D_NBITS        	0x04

// CLK_DIV_PPG_REG
#define CONTROL_CLK_DIV_FCT_PPG_OFFSET              0x00
#define CONTROL_CLK_DIV_FCT_PPG_NBITS               0x04

// CLK_DIV_STIM_REG
#define CONTROL_CLK_DIV_FCT_STIM_OFFSET             0x00
#define CONTROL_CLK_DIV_FCT_STIM_NBITS              0x04

// CLK_DIV_TEMP_REG
#define CONTROL_CLK_DIV_FCT_TEMP_OFFSET             0x00
#define CONTROL_CLK_DIV_FCT_TEMP_NBITS              0x04

// CLK_DIV_BIOZ
#define CONTROL_CLK_DIV_FCT_BIOZ_1_OFFSET           0x00
#define CONTROL_CLK_DIV_FCT_BIOZ_1_NBITS            0x08

#define CONTROL_CLK_DIV_FCT_BIOZ_2_OFFSET           0x08
#define CONTROL_CLK_DIV_FCT_BIOZ_2_NBITS            0x08

// Put together BIOZ stuff that is set multiple times -> BIOZ REG0
#define CONTROL_CLK_DIV_FCT_BIOZ_SAR_OFFSET         0x00
#define CONTROL_CLK_DIV_FCT_BIOZ_SAR_NBITS          0x04

#define CONTROL_CLK_DIV_BIOZ_NUM_CH_OFFSET          0x04
#define CONTROL_CLK_DIV_BIOZ_NUM_CH_NBITS           0x04

#define CONTROL_CLK_DIV_BIOZ_CH_WDW_OFFSET          0x10
#define CONTROL_CLK_DIV_BIOZ_CH_WDW_NBITS           0x10

// Put together BIOZ stuff that is only set once -> BIOZ REG1
#define CONTROL_CLK_DIV_BIOZ_TRIGGER_WIDTH_OFFSET   0x00
#define CONTROL_CLK_DIV_BIOZ_TRIGGER_WIDTH_NBITS    0x06

#define CONTROL_CLK_DIV_BIOZ_TRIGGER_DELAY_OFFSET   0x06
#define CONTROL_CLK_DIV_BIOZ_TRIGGER_DELAY_NBITS    0x06

#define CONTROL_CLK_DIV_BIOZ_GAP_WIDTH_OFFSET       0x0C
#define CONTROL_CLK_DIV_BIOZ_GAP_WIDTH_NBITS        0x04

#define CONTROL_CLK_DIV_BIOZ_TRACK_DELAY_OFFSET     0x10
#define CONTROL_CLK_DIV_BIOZ_TRACK_DELAY_NBITS      0x06

#define CONTROL_CLK_DIV_BIOZ_CONV_MODE_OFFSET       0x16
#define CONTROL_CLK_DIV_BIOZ_CONV_MODE_NBITS        0x02


/*
 * CONTORL_CLK_GEN_IP: Clock Generator
 */

// Register defines, register number according to register offset in IP
#define CONTROL_CLK_GEN_REG_0                    	0x00

// These are SW defines, to be compliant with next generation

// bitfields of CONTROL_CLK_GEN_REG_0
#define CONTROL_CLK_GEN_DCXO_BIAS_OFFSET			0x00
#define CONTROL_CLK_GEN_DCXO_BIAS_NBITS				0x06

#define CONTROL_CLK_GEN_XTAL_BIAS_OFFSET			0x06
#define CONTROL_CLK_GEN_XTAL_BIAS_NBITS				0x02

#define CONTROL_CLK_GEN_FILT_OFFSET					0x08
#define CONTROL_CLK_GEN_FILT_NBITS					0x01


/*
 * CONTORL_PMU_IP: PMU
 */

// Register defines, register number according to register offset in IP
#define CONTROL_PMU_D1V2_EXG                    	0x00        // always on!!
#define CONTROL_PMU_A1V2_EXG                     	0x01
#define CONTROL_PMU_A3V0_EXG                     	0x02
#define CONTROL_PMU_A1V2_BIOZ                     	0x03
#define CONTROL_PMU_A1V2_PPG                     	0x04
#define CONTROL_PMU_A3V0_PPG                     	0x05
#define CONTROL_PMU_A1V2_STIM                     	0x06
#define CONTROL_PMU_A3V0_STIM                     	0x07

// These are SW defines, to be compliant with next generation

// CONTROL_PMU_REG
#define CONTROL_PMU_D1V2_EXG_OFFSET               	0x00       
#define CONTROL_PMU_D1V2_EXG_NBITS                 	0x02       

#define CONTROL_PMU_A1V2_EXG_OFFSET                	0x02
#define CONTROL_PMU_A1V2_EXG_NBITS                 	0x02

#define CONTROL_PMU_A3V0_EXG_OFFSET                 0x04
#define CONTROL_PMU_A3V0_EXG_NBITS                  0x03

#define CONTROL_PMU_A1V2_BIOZ_OFFSET                0x07
#define CONTROL_PMU_A1V2_BIOZ_NBITS                 0x02

#define CONTROL_PMU_A1V2_PPG_OFFSET                 0x09
#define CONTROL_PMU_A1V2_PPG_NBITS                  0x02

#define CONTROL_PMU_A3V0_PPG_OFFSET                 0x0B
#define CONTROL_PMU_A3V0_PPG_NBITS                  0x03

#define CONTROL_PMU_A1V2_STIM_OFFSET                0x0E
#define CONTROL_PMU_A1V2_STIM_NBITS                 0x02

#define CONTROL_PMU_A3V0_STIM_OFFSET                0x11
#define CONTROL_PMU_A3V0_STIM_NBITS                 0x03

#endif