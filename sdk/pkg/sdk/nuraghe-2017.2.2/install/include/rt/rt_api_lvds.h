/*
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_LVDS_H__
#define __RT__RT_API_LVDS_H__

#ifdef PLP_UDMA_HAS_LVDS
#include "hal/transceiver.h"

/*
 *	Power Amplifier & antenna switch Param
*/
#define PA_SLEEP                                   0x0
#define PA_RECEIVE_TRANSMIT_BYPASS                 0x2
#define PA_RECEIVE_LNA                             0x6
#define PA_TRANSMIT                                0x3
#define PA_TRANSMIT_BIS							               0x7
#define PA_ANT1_EN                                 0x0
#define PA_ANT2_EN                                 0x1

#define ANTENNA_SWITCH_RX_MODE            		     0x1
#define ANTENNA_SWITCH_TX_MODE					           0x2
#define ANT_SW_0	                          	     0x0
#define ANT_SW_1                          		     0x1

///////////////////////
/*
 * Section dedicated to:
 * LVDS pads
 * SPI command to AT86RF215 chip configuration
 */


///////////////////////
/*
 * Section dedicated to:
 * SPI command to AT86RF215 chip configuration
 */

//low level
/*
 * index is the AT86RF215 register index
 * value is the value to write to in index
 */
unsigned int rf215_readReg(unsigned int index);
void rf215_writeReg(unsigned int index, unsigned char value);

//higher level
/*
 * @AT86RF215 sub GHz configuration to go in state RX
*/
void plp_rf215_enable_rx();

/*
 * @AT86RF215 sub GHz configuration to go in state TX
*/
void plp_rf215_enable_tx();

/*
 * @AT86RF215 sub GHz set TX power
 * @param pacur: Power Amplifier Current Control, by example use PACUR_22mA
 * @param pw the tx power level
*/
void plp_rf215_set_tx_pw(unsigned char pacur, unsigned char pw);

/*
 * @AT86RF215 Configure channel
 * @param cs: channel spacing
 * @param ccf0h: Channel Center Frequency F0 High Byte
 * @param ccf0l: Channel Center Frequency F0 Low Byte ; if CM=0 then frequency=F0/25000
 * @param cnl: Channel Number Low Byte
 * @param cnm: Channel Mode bit[7:6] and Channel Number High Bit in bit0
 * Prerequisites: rf215 state must be TRXOFF
 */
void plp_rf215_channel_cfg(unsigned char cs, unsigned char ccf0h, unsigned char ccf0l, unsigned char cnl, unsigned char cnm);

/*
 * @AT86RF215: Reset the chip rf215
 */
void plp_rf215_reset();

/*
 * @AT86RF215 sub GHz configuration to go in state TRXPREP
 * wait until its done blocking function
 * TODO implement watchdog to prevent possible infinite loop in case of issue ?
 */
void plp_set_rf215_TRXPREP();

/*
 * @AT86RF215 Start radio reception
 * @param rxLvdsSamples: pointer to the rx buffer
 * @param buffer_size: number of int samples to rx in rxLvdsSamples
 * Prerequisites: channel configuration
 */
void plp_rf215_rx(unsigned int * rxLvdsSamples, unsigned int buffer_size);

/*
 * @AT86RF215 Start radio transmit
 * @param txLvdsSamples: pointer to the tx buffer
 * @param buffer_size: number of int samples in txLvdsSamples to tx
 * Prerequisites: channel configuration + tx power configuration
 */
void plp_rf215_tx(unsigned int * txLvdsSamples, unsigned int buffer_size);


///////////////////////
/*
 * Transceiver IP section
 */

/*
 * Enables the clock to the        whole transceiver IP
 * Needed prior to all other configuration of this IP
 */
void rf_start_ip();

/*
 * Disable the clock to the whole transceiver IP
 */
void rf_stop_ip();

/*
 * Configure Transceiver IP in Tx
 */
void rf_cfg_tx();

/*
 * disable Transceiver IP Tx mode
 */
void rf_tx_stop();

/*
 * Configure Transceiver IP in Rx
 */
void rf_cfg_rx();

/*
 * disable Transceiver IP Rx mode
 */
void rf_rx_stop();

/*
 * Configure Transceiver IP in Loopback
 * This means, Tx and Rx are enabled
 */
void rf_cfg_loopback();

/*
 * Transceiver IP, specific configuration for rf215
 * use RF215 clk for RX: RF_CFG_CLKSEL=0
 * bit0 is used to indicate immediate TX (HW shift the data on left by 1 bit), RF_CFG_MODE=1
 * IQ data bit0: on I indicate start of immediate TX (if RF215 is configure for this), RF_CFG_MODE_VAL=1
 * 2 bits of synchronization on the MSB of 16bits for I and Q: RF_CFG_MODE_RX=0
 */
void plp_rf_udma_cfg_set_rf215();

#endif


#endif
