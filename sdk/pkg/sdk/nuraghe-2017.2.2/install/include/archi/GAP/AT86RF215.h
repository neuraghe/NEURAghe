#ifndef __AT86RF215_define
  #define __AT86RF215_define
#endif

#define DISABLE 0
#define ENABLE 1

/*
 * @AT86RF215 registers address
*/

#define AT86RF215_RF09_IRQS             0x0000
#define AT86RF215_RF24_IRQS             0x0001
#define AT86RF215_BBC0_IRQS             0x0002
#define AT86RF215_BBC1_IRQS             0x0003
#define AT86RF215_RF_RST                0x0005 //Chip Reset
#define AT86RF215_RF_CFG                0x0006
#define AT86RF215_RF_CLKO               0x0007
#define AT86RF215_RF_BMDVC              0x0008
#define AT86RF215_RF_XOC                0x0009
#define AT86RF215_RF_IQIFC0             0x000A //Transceiver I/Q Data Interface Configuration Register 0
#define AT86RF215_RF_IQIFC1             0x000B //Transceiver I/Q Data Interface Configuration Register 1
#define AT86RF215_RF_IQIFC2             0x000C
#define AT86RF215_RF_PN                 0x000D
#define AT86RF215_RF_VN                 0x000E
#define AT86RF215_RF09_IRQM             0x0100 //Radio IRQ Mask
#define AT86RF215_RF09_AUXS             0x0101
#define AT86RF215_RF09_STATE            0x0102
#define AT86RF215_RF09_CMD              0x0103
#define AT86RF215_RF09_CS               0x0104
#define AT86RF215_RF09_CCF0L            0x0105
#define AT86RF215_RF09_CCF0H            0x0106
#define AT86RF215_RF09_CNL              0x0107
#define AT86RF215_RF09_CNM              0x0108
#define AT86RF215_RF09_RXBWC            0x0109 //Receiver Filter Bandwidth Control
#define AT86RF215_RF09_RXDFE            0x010A //Receiver Digital Frontend
#define AT86RF215_RF09_AGCC             0x010B //Receiver AGC Control 0
#define AT86RF215_RF09_AGCS             0x010C //Receiver AGCG
#define AT86RF215_RF09_RSSI             0x010D
#define AT86RF215_RF09_EDC              0x010E
#define AT86RF215_RF09_EDD              0x010F
#define AT86RF215_RF09_EDV              0x0110
#define AT86RF215_RF09_RNDV             0x0111
#define AT86RF215_RF09_TXCUTC           0x0112 //Transmitter Filter Cutoff Control and PA Ramp Time
#define AT86RF215_RF09_TXDFE            0x0113 //RFn_TXDFE – Transmitter TX Digital Frontend
#define AT86RF215_RF09_PAC              0x0114
#define AT86RF215_RF09_PADFE            0x0116
#define AT86RF215_RF09_PLL              0x0121
#define AT86RF215_RF09_PLLCF            0x0122
#define AT86RF215_RF09_TXCI             0x0125
#define AT86RF215_RF09_TXCQ             0x0126
#define AT86RF215_RF09_TXDACQ           0x0128
#define AT86RF215_RF24_IRQM             0x0200
#define AT86RF215_RF24_AUXS             0x0201
#define AT86RF215_RF24_STATE            0x0202
#define AT86RF215_RF24_CMD              0x0203
#define AT86RF215_RF24_CS               0x0204
#define AT86RF215_RF24_CCF0L            0x0205
#define AT86RF215_RF24_CCF0H            0x0206
#define AT86RF215_RF24_CNL              0x0207
#define AT86RF215_RF24_CNM              0x0208
#define AT86RF215_RF24_RXBWC            0x0209
#define AT86RF215_RF24_RXDFE            0x020A
#define AT86RF215_RF24_AGCC             0x020B
#define AT86RF215_RF24_AGCS             0x020C
#define AT86RF215_RF24_RSSI             0x020D
#define AT86RF215_RF24_EDC              0x020E
#define AT86RF215_RF24_EDD              0x020F
#define AT86RF215_RF24_EDV              0x0210
#define AT86RF215_RF24_RNDV             0x0211
#define AT86RF215_RF24_TXCUTC           0x0212
#define AT86RF215_RF24_TXDFE            0x0213
#define AT86RF215_RF24_PAC              0x0214
#define AT86RF215_RF24_PADFE            0x0216
#define AT86RF215_RF24_PLL              0x0221
#define AT86RF215_RF24_PLLCF            0x0222
#define AT86RF215_RF24_TXCI             0x0225
#define AT86RF215_RF24_TXCQ             0x0226
#define AT86RF215_RF24_TXDACI           0x0227
#define AT86RF215_RF24_TXDACQ           0x0228
/* unused registers as no BBC
#define AT86RF215_BBC0_IRQM             0x0300
#define AT86RF215_BBC0_PC               0x0301
#define AT86RF215_BBC0_PS               0x0302
#define AT86RF215_BBC0_RXFLL            0x0304
#define AT86RF215_BBC0_RXFLH            0x0305
#define AT86RF215_BBC0_TXFLL            0x0306
#define AT86RF215_BBC0_TXFLH            0x0307
#define AT86RF215_BBC0_FBLL             0x0308
#define AT86RF215_BBC0_FBLH             0x0309
#define AT86RF215_BBC0_FBLIL            0x030A
#define AT86RF215_BBC0_FBLIH            0x030B
#define AT86RF215_BBC0_OFDMPHRTX        0x030C
#define AT86RF215_BBC0_OFDMPHRRX        0x030D
#define AT86RF215_BBC0_OFDMC            0x030E
#define AT86RF215_BBC0_OFDMSW           0x030F
#define AT86RF215_BBC0_OQPSKC0          0x0310
#define AT86RF215_BBC0_OQPSKC1          0x0311
#define AT86RF215_BBC0_OQPSKC2          0x0312
#define AT86RF215_BBC0_OQPSKC3          0x0313
#define AT86RF215_BBC0_OQPSKPHRTX       0x0314
#define AT86RF215_BBC0_OQPSKPHRRX       0x0315
#define AT86RF215_BBC0_AFC0             0x0320
#define AT86RF215_BBC0_AFC1             0x0321
#define AT86RF215_BBC0_AFFTM            0x0322
#define AT86RF215_BBC0_AFFVM            0x0323
#define AT86RF215_BBC0_AFS              0x0324
#define AT86RF215_BBC0_MACEA0           0x0325
#define AT86RF215_BBC0_MACEA1           0x0326
#define AT86RF215_BBC0_MACEA2           0x0327
#define AT86RF215_BBC0_MACEA3           0x0328
#define AT86RF215_BBC0_MACEA4           0x0329
#define AT86RF215_BBC0_MACEA5           0x032A
#define AT86RF215_BBC0_MACEA6           0x032B
#define AT86RF215_BBC0_MACEA7           0x032C
#define AT86RF215_BBC0_MACPID0F0        0x032D
#define AT86RF215_BBC0_MACPID1F0        0x032E
#define AT86RF215_BBC0_MACSHA0F0        0x032F
#define AT86RF215_BBC0_MACSHA1F0        0x0330
#define AT86RF215_BBC0_MACPID0F1        0x0331
#define AT86RF215_BBC0_MACPID1F1        0x0332
#define AT86RF215_BBC0_MACSHA0F1        0x0333
#define AT86RF215_BBC0_MACSHA1F1        0x0334
#define AT86RF215_BBC0_MACPID0F2        0x0335
#define AT86RF215_BBC0_MACPID1F2        0x0336
#define AT86RF215_BBC0_MACSHA0F2        0x0337
#define AT86RF215_BBC0_MACSHA1F2        0x0338
#define AT86RF215_BBC0_MACPID0F3        0x0339
#define AT86RF215_BBC0_MACPID1F3        0x033A
#define AT86RF215_BBC0_MACSHA0F3        0x033B
#define AT86RF215_BBC0_MACSHA1F3        0x033C
#define AT86RF215_BBC0_AMCS             0x0340
#define AT86RF215_BBC0_AMEDT            0x0341
#define AT86RF215_BBC0_AMAACKPD         0x0342
#define AT86RF215_BBC0_AMAACKTL         0x0343
#define AT86RF215_BBC0_AMAACKTH         0x0344
#define AT86RF215_BBC0_FSKC0            0x0360
#define AT86RF215_BBC0_FSKC1            0x0361
#define AT86RF215_BBC0_FSKC2            0x0362
#define AT86RF215_BBC0_FSKC3            0x0363
#define AT86RF215_BBC0_FSKC4            0x0364
#define AT86RF215_BBC0_FSKPLL           0x0365
#define AT86RF215_BBC0_FSKSFD0L         0x0366
#define AT86RF215_BBC0_FSKSFD0H         0x0367
#define AT86RF215_BBC0_FSKSFD1L         0x0368
#define AT86RF215_BBC0_FSKSFD1H         0x0369
#define AT86RF215_BBC0_FSKPHRTX         0x036A
#define AT86RF215_BBC0_FSKPHRRX         0x036B
#define AT86RF215_BBC0_FSKRPC           0x036C
#define AT86RF215_BBC0_FSKRPCONT        0x036D
#define AT86RF215_BBC0_FSKRPCOFFT       0x036E
#define AT86RF215_BBC0_FSKRRXFLL        0x0370
#define AT86RF215_BBC0_FSKRRXFLH        0x0371
#define AT86RF215_BBC0_FSKDM            0x0372
#define AT86RF215_BBC0_FSKPE0           0x0373
#define AT86RF215_BBC0_FSKPE1           0x0374
#define AT86RF215_BBC0_FSKPE2           0x0375
#define AT86RF215_BBC0_PMUC             0x0380
#define AT86RF215_BBC0_PMUVAL           0x0381
#define AT86RF215_BBC0_PMUQF            0x0382
#define AT86RF215_BBC0_PMUI             0x0383
#define AT86RF215_BBC0_PMUQ             0x0384
#define AT86RF215_BBC0_CNTC             0x0390
#define AT86RF215_BBC0_CNT0             0x0391
#define AT86RF215_BBC0_CNT1             0x0392
#define AT86RF215_BBC0_CNT2             0x0393
#define AT86RF215_BBC0_CNT3             0x0394
#define AT86RF215_BBC1_IRQM             0x0400
#define AT86RF215_BBC1_PC               0x0401
#define AT86RF215_BBC1_PS               0x0402
#define AT86RF215_BBC1_RXFLL            0x0404
#define AT86RF215_BBC1_RXFLH            0x0405
#define AT86RF215_BBC1_TXFLL            0x0406
#define AT86RF215_BBC1_TXFLH            0x0407
#define AT86RF215_BBC1_FBLL             0x0408
#define AT86RF215_BBC1_FBLH             0x0409
#define AT86RF215_BBC1_FBLIL            0x040A
#define AT86RF215_BBC1_FBLIH            0x040B
#define AT86RF215_BBC1_OFDMPHRTX        0x040C
#define AT86RF215_BBC1_OFDMPHRRX        0x040D
#define AT86RF215_BBC1_OFDMC            0x040E
#define AT86RF215_BBC1_OFDMSW           0x040F
#define AT86RF215_BBC1_OQPSKC0          0x0410
#define AT86RF215_BBC1_OQPSKC1          0x0411
#define AT86RF215_BBC1_OQPSKC2          0x0412
#define AT86RF215_BBC1_OQPSKC3          0x0413
#define AT86RF215_BBC1_OQPSKPHRTX       0x0414
#define AT86RF215_BBC1_OQPSKPHRRX       0x0415
#define AT86RF215_BBC1_AFC0             0x0420
#define AT86RF215_BBC1_AFC1             0x0421
#define AT86RF215_BBC1_AFFTM            0x0422
#define AT86RF215_BBC1_AFFVM            0x0423
#define AT86RF215_BBC1_AFS              0x0424
#define AT86RF215_BBC1_MACEA0           0x0425
#define AT86RF215_BBC1_MACEA1           0x0426
#define AT86RF215_BBC1_MACEA2           0x0427
#define AT86RF215_BBC1_MACEA3           0x0428
#define AT86RF215_BBC1_MACEA4           0x0429
#define AT86RF215_BBC1_MACEA5           0x042A
#define AT86RF215_BBC1_MACEA6           0x042B
#define AT86RF215_BBC1_MACEA7           0x042C
#define AT86RF215_BBC1_MACPID0F0        0x042D
#define AT86RF215_BBC1_MACPID1F0        0x042E
#define AT86RF215_BBC1_MACSHA0F0        0x042F
#define AT86RF215_BBC1_MACSHA1F0        0x0430
#define AT86RF215_BBC1_MACPID0F1        0x0431
#define AT86RF215_BBC1_MACPID1F1        0x0432
#define AT86RF215_BBC1_MACSHA0F1        0x0433
#define AT86RF215_BBC1_MACSHA1F1        0x0434
#define AT86RF215_BBC1_MACPID0F2        0x0435
#define AT86RF215_BBC1_MACPID1F2        0x0436
#define AT86RF215_BBC1_MACSHA0F2        0x0437
#define AT86RF215_BBC1_MACSHA1F2        0x0438
#define AT86RF215_BBC1_MACPID0F3        0x0439
#define AT86RF215_BBC1_MACPID1F3        0x043A
#define AT86RF215_BBC1_MACSHA0F3        0x043B
#define AT86RF215_BBC1_MACSHA1F3        0x043C
#define AT86RF215_BBC1_AMCS             0x0440
#define AT86RF215_BBC1_AMEDT            0x0441
#define AT86RF215_BBC1_AMAACKPD         0x0442
#define AT86RF215_BBC1_AMAACKTL         0x0443
#define AT86RF215_BBC1_AMAACKTH         0x0444
#define AT86RF215_BBC1_FSKC0            0x0460
#define AT86RF215_BBC1_FSKC1            0x0461
#define AT86RF215_BBC1_FSKC2            0x0462
#define AT86RF215_BBC1_FSKC3            0x0463
#define AT86RF215_BBC1_FSKC4            0x0464
#define AT86RF215_BBC1_FSKPLL           0x0465
#define AT86RF215_BBC1_FSKSFD0L         0x0466
#define AT86RF215_BBC1_FSKSFD0H         0x0467
#define AT86RF215_BBC1_FSKSFD1L         0x0468
#define AT86RF215_BBC1_FSKSFD1H         0x0469
#define AT86RF215_BBC1_FSKPHRTX         0x046A
#define AT86RF215_BBC1_FSKPHRRX         0x046B
#define AT86RF215_BBC1_FSKRPC           0x046C
#define AT86RF215_BBC1_FSKRPCONT        0x046D
#define AT86RF215_BBC1_FSKRPCOFFT       0x046E
#define AT86RF215_BBC1_FSKRRXFLL        0x0470
#define AT86RF215_BBC1_FSKRRXFLH        0x0471
#define AT86RF215_BBC1_FSKDM            0x0472
#define AT86RF215_BBC1_FSKPE0           0x0473
#define AT86RF215_BBC1_FSKPE1           0x0474
#define AT86RF215_BBC1_FSKPE2           0x0475
#define AT86RF215_BBC1_PMUC             0x0480
#define AT86RF215_BBC1_PMUVAL           0x0481
#define AT86RF215_BBC1_PMUQF            0x0482
#define AT86RF215_BBC1_PMUI             0x0483
#define AT86RF215_BBC1_PMUQ             0x0484
#define AT86RF215_BBC1_CNTC             0x0490
#define AT86RF215_BBC1_CNT0             0x0491
#define AT86RF215_BBC1_CNT1             0x0492
#define AT86RF215_BBC1_CNT2             0x0493
#define AT86RF215_BBC1_CNT3             0x0494
#define AT86RF215_BBC0_FBRXS            0x2000
#define AT86RF215_BBC0_FBRXE            0x27FE
#define AT86RF215_BBC0_FBTXS            0x2800
#define AT86RF215_BBC0_FBTXE            0x2FFE
#define AT86RF215_BBC1_FBRXS            0x3000
#define AT86RF215_BBC1_FBRXE            0x37FE
#define AT86RF215_BBC1_FBTXS            0x3800
#define AT86RF215_BBC1_FBTXE            0x3FFE
*/

//RF215 STate Machine STate
#define RF_NOP_ST 0x0 //NO OPERATION
#define RF_SLEEP_ST 0x1 //SLEEP
#define RF_TRXOFF_ST 0x2 //TRXOFF (Transceiver off, SPI active)
#define RF_TXPREP_ST 0x3 //TXPREP (Transmit preparation)
#define RF_TX_ST 0x4 //TX (Transmit)
#define RF_RX_ST 0x5 //RX (Receive)
#define RF_RESET_ST 0x7 //RESET (transceiver reset, the transceiver state will automatically end up in state TRXOFF)

//##
//# Chip Reset Command
//# Writing the value 0x7 to the sub-register CMD triggers the reset procedure of the entire device; the values 0x0 to 0x6 have no effect
//##
//#define AT86RF215_RF_RST  0x0005
#define AT86RF215_RF_RST_MASK  0x7

#define AT86RF215_RF_CFG  0x0006
#define AT86RF215_RF_CLKO  0x0007
#define AT86RF215_RF_BMDVC  0x0008
#define AT86RF215_RF_XOC  0x0009

//RFn_IRQS – Radio IRQ Status
#define IRQS_IT_OCCUR 1 //Indicate an IT occured and corresponding IT bit in IRQS is set to 1
#define IRQS_IQIFSF 5 //Bit 5 I/Q IF Synchronization Failure Interrupt
//This bit is set to 1 if the I/Q data interface synchronization fails.
#define IRQS_TRXERR 4 //Transceiver Error Interrupt
//This bit is set to 1 if a transceiver error is detected, i.e. a PLL lock error occurs.
#define IRQS_BATLOW 3 //Battery Low Interrupt
//This bit is set to 1 if the battery monitor detects a voltage at EVDD that is below the threshold voltage.
#define IRQS_EDC 2 //Energy Detection Completion Interrupt
//This bit is set to 1 if a single or continuous energy measurement is completed. It is not set if the automatic energy measurement mode is used.
#define IRQS_TRXRDY 1 //Transceiver Ready Interrupt
//This bit is set to 1 if the command TXPREP is written to the register RFn_CMD and transceiver reaches the state TXPREP. While being in the state TXPREP and changing the RF frequency, the IRQ TRXRDY is issued once the frequency settling is completed.
#define IRQS_WAKEUP 0 //Wake-up / Reset Interrupt
//This bit is set to 1 if the wake-up procedure from state SLEEP/DEEP_SLEEP or power-up procedure is completed. It also indicates the completion of the RESET procedure.

#define AT86RF215_RF_IQIFC0_DEFAULT_VALUE 0x14
//# [7] : EXTLB  The bit enables the external loopback functionality. If the bit is set to 1, the received data of the I/Q IF pin TXDn/p is fedback via the pins RXDxxn/p.
#define EXTLB_MASK  0x80
#define EXTLB_OFFSET  7
#define EXTLB_LOOPBACK_ENABLE  ((0x1 << EXTLB_OFFSET) & EXTLB_MASK)
#define EXTLB_LOOPBACK_DISABLE ((0x0 << EXTLB_OFFSET) & EXTLB_MASK)
#define LOOPBACK_ENABLE 1
#define LOOPBACK_DISABLE 0
//# [6] : SF (RO)  The bit indicates whether the data stream of the I/Q data interface is synchronized correctly.
#define SF_MASK  0x40
#define SF_OFFSET  6
#define SF_SYNC_FAILURE  0x0
#define SF_NO_SYNC_FAILURE  0x1
//# [5:4] : DRV  The sub-register configures the I/Q data interface driver output current.
#define DRV_MASK  0x30
#define DRV_OFFSET  4
#define DRV_1mA  ((0x0 << DRV_OFFSET) & DRV_MASK)
#define DRV_2mA  ((0x1 << DRV_OFFSET) & DRV_MASK) //default value
#define DRV_3mA  ((0x2 << DRV_OFFSET) & DRV_MASK)
#define DRV_4mA  ((0x3 << DRV_OFFSET) & DRV_MASK)
//# [3:2] : CMV  The sub-register configures the common mode voltage of the I/Q data interface signals.
#define CMV_MASK  0xC
#define CMV_OFFSET  2
#define CMV_150mV  ((0x0 << CMV_OFFSET) & CMV_MASK)
#define CMV_200mV  ((0x1 << CMV_OFFSET) & CMV_MASK) //default value
#define CMV_250mV  ((0x2 << CMV_OFFSET) & CMV_MASK)
#define CMV_300mV  ((0x3 << CMV_OFFSET) & CMV_MASK)
//# [1] : CMV1V2  The common mode voltage of 1.2V compliant to the IEEE Std 1596 is set. Sub-register CMV has no effect.
#define CMV1V2_MASK  0x2
#define CMV1V2_OFFSET  1
#define CMV1V2_150mV  ((0x0 << CMV1V2_OFFSET) & CMV1V2_MASK) //default value
#define CMV1V2_200mV  ((0x1 << CMV1V2_OFFSET) & CMV1V2_MASK)
//# [0] : PAVC, supply voltage of the internal power amplifier (2.4 V)
//# The bit enables the ability to start and finish transmitting by a control bit within the I/Q data stream (I_DATA[0]).
//# If this bit is set to 1, the transmit start and finish cannot be controlled by SPI commands.
#define EMBEDDED_CTRL_DISABLE  0x0      // Embedded control is not enabled. Default value
#define EMBEDDED_CTRL_ENABLE   0x1      // Embedded control is enabled.
// [7] : EXTLB, enables the loopback functionality (disabled)
// [6] : SF, indicates whether the data stream of the I/Q data interface is synchronized correctlty, READ only
// [5:4] : DRV, configures the I/Q data interface driver output current (2 mA)
// [3:2] : CMV, common mode voltage of the I/Q data interface signals (has no effect if [1] is set)
// [1] : CMV1V2, common mode voltage of the I/Q data interface signals is set to 1.2 V
// [0] : EEC, embedded control (disabled)


//# The register configures the skew behavior, the chip mode of the I/Q data interface and contains the status of the I/Q
//# data interface receiver.
//##
//#define AT86RF215_RF_IQIFC1  0x000B
//# This bit indicates that the LVDS receiver is in failsafe mode. The failsafe mode is entered if the LVDS receiver is not
//# driven by an LVDS driver.
#define IQIFC1_FAILSF_MASK  0x80
#define IQIFC1_FAILSF_OFFSET  8
//# dThis sub-register configures the working mode of the chip and define which parts (RF, baseband, I/Q IF) are in
//# doperation. Note, the AT86RF215IQ supports chip mode one (CHPM1) only. Also note, the AT86RF215M generally
//# ddoes not support operation of BBC1 and RF24.
#define IQIFC1_CHPM_MASK  0x70
#define IQIFC1_CHPM_OFFSET  4
#define RF_MODE_BBRF  ((0x0 << IQIFC1_CHPM_OFFSET) & IQIFC1_CHPM_MASK) // RF enabled, baseband (BBC0, BBC1) enabled, I/Q IF disabled
#define RF_MODE_RF  ((0x1 << IQIFC1_CHPM_OFFSET) & IQIFC1_CHPM_MASK) // RF enabled, baseband (BBC0, BBC1) disabled, I/Q IF enabled
#define RF_MODE_BBRF09  ((0x4 << IQIFC1_CHPM_OFFSET) & IQIFC1_CHPM_MASK) // RF enabled, baseband (BBC0) disabled and (BBC1) enabled, I/Q IF for sub-GHz Transceiver enabled
#define RF_MODE_BBRF24  ((0x5 << IQIFC1_CHPM_OFFSET) & IQIFC1_CHPM_MASK) // RF enabled, baseband (BBC1) disabled and (BBC0) enabled, I/Q IF for 2.4GHz Transceiver enabled
//# dThis sub-register configures the alignment of the I/Q data interface RXDxxn/p signal edges relative to the RXCLKn/p
//# dclock edges. The register values define the time from the RXCLKn/p clock edge to the next RXDxxn/p signal edge. The
//# dreset value of 2 (3.906ns) corresponds to a half bit period with the data center aligned in reference to the clock.
#define IQIFC1_SKEWDRV_MASK  0x3
#define IQIFC1_SKEWDRV_OFFSET  0
#define SKEWDRV_1_906NS  (0x0 << IQIFC1_SKEWDRV_OFFSET) // 1.906ns
#define SKEWDRV_2_906NS  (0x1 << IQIFC1_SKEWDRV_OFFSET) // 2.906ns
#define SKEWDRV_3_906NS  (0x2 << IQIFC1_SKEWDRV_OFFSET) // 3.906ns
#define SKEWDRV_4_906NS  (0x3 << IQIFC1_SKEWDRV_OFFSET) // 4.906ns

//##
//# The register RFn_IRQM contains the radio IRQ mask. A bit set to 1 enables the corresponding IRQ to cause an IRQ pin
//# event. A bit set to 0 disables the corresponding IRQ to cause an IRQ pin event.
//##
//#define AT86RF215_RF09_IRQM  0x0100
//# If this bit is set to 1, the interrupt WAKEUP is enabled. This bit is automatically set to 1 in the states POWER_ON,
//# DEEP_SLEEP, SLEEP and RESET.
#define IRQM_WAKEUP_MASK  0x1
#define IRQM_TRXRDY_MASK  0x2
#define IRQM_EDC_MASK  0x4
#define IRQM_BATLOW_MASK  0x8
#define IRQM_TRXERR_MASK  0x10
#define IRQM_IQIFSF_MASK  0x20
#define IRQM_ALL_MASK  IRQM_IQIFSF_MASK | IRQM_TRXERR_MASK | IRQM_BATLOW_MASK | IRQM_EDC_MASK | IRQM_TRXRDY_MASK | IRQM_WAKEUP_MASK

//AUXS.PAVC: Power Amplifier Voltage Control
#define PAVC_2V   0 //set PAVC to 2V
#define PAVC_2_2V 1 //set PAVC to 2.2V
#define PAVC_2_4V 2 //set PAVC to 2.4V //=PAVC reset value = AT86RF215_RF09_AUXS reset value
#define PAVC_MASK 3

#define TXPWR_m19db 0
#define TXPWR_m18db 1
#define TXPWR_m17db 2
#define TXPWR_m16db 3
#define TXPWR_m15db 4
#define TXPWR_m14db 5
#define TXPWR_m13db 6
#define TXPWR_m12db 7
#define TXPWR_m11db 8
#define TXPWR_m10db 9
#define TXPWR_m9db 10
#define TXPWR_m8db 11
#define TXPWR_m7db 12
#define TXPWR_m6db 13
#define TXPWR_m5db 14
#define TXPWR_m4db 15
#define TXPWR_m3db 16
#define TXPWR_m2db 17
#define TXPWR_m1db 18
#define TXPWR_0db  19
#define TXPWR_1db  20
#define TXPWR_2db  22
#define TXPWR_3db  23
#define TXPWR_4db  24
#define TXPWR_5db  25
#define TXPWR_6db  26
#define TXPWR_7db  27
#define TXPWR_8db  28
#define TXPWR_9db  29
#define TXPWR_10db 30
#define TXPWR_11db 31
#define PACUR_22mA 0 //Power amplifier current reduction by about 22mA (3dB reduction of max. small signal gain)
#define PACUR_18mA 1 //Power amplifier current reduction by about 18mA (2dB reduction of max. small signal gain)
#define PACUR_11mA 2 //Power amplifier current reduction by about 11mA (1dB reduction of max. small signal gain)
#define PACUR_STD  3 //No power amplifier current reduction (max. transmit small signal gain)
#define PACUR_MASK 0x60
#define PACUR_offset 5
#define TXPWR_MASK 0x1f

//Bit 7:0 – CS.CS: Channel Spacing with 25kHz Resolution
#define CS_MASK 0xff
#define CS_OFFSET 0

//CCF0L – Channel Center Frequency F0 Low Byte
#define CCF0L_MASK 0xff
#define CCF0L_OFFSET 0

//CCF0H – Channel Center Frequency F0 High Byte
#define CCF0H_MASK 0xff
#define CCF0H_OFFSET 0

//CNL – Channel Number Low Byte
#define CNL_MASK 0xff
#define CNL_OFFSET 0

//CNL – Channel Number High Byte
#define CNH_MASK 1
#define CNH_OFFSET 0

//RFn_CNM – Channel Mode and Channel Number High Bit
#define CM_OFFSET 6
#define CM_MASK 0xc
#define CM_step_25kHz (0<<CM_OFFSET) //IEEE compliant channel scheme; f=(CCF0+CN*CS)*25kHz+f offset ; (f offset = 0Hz for sub-1GHz transceiver; f offset = 1.5GHz for 2.4GHz transceiver)
#define CM_389_5_TO_510MHz_STEP_99Hz182  (1<<CM_OFFSET) //Fine resolution (389.5-510.0)MHz with 99.182Hz channel stepping
#define CM_779_TO_1020MHz_STEP_198Hz364  (2<<CM_OFFSET) //Fine resolution (779-1020)MHz with 198.364Hz channel stepping
#define CM_2400_TO_2483Hz5_STEP_396Hz728 (3<<CM_OFFSET) //Fine resolution (2400-2483.5)MHz with 396.728Hz channel stepping

//RFn_TXCUTC AT86RF215_RF09_TXCUTC – Transmitter Filter Cutoff Control and PA Ramp Time
//# [7:6] : PARAMP, ramp up/down time of the PA (4 us)
#define TXCUTC_PARAMP_OFFSET  6
#define TXCUTC_PARAMP_MASK  6
#define RF_PARAMP4U 	(0x0<<TXCUTC_PARAMP_OFFSET)//t pa_ramp = 4μs
#define RF_PARAMP8U 	(0x1<<TXCUTC_PARAMP_OFFSET)//t pa_ramp = 8μs
#define RF_PARAMP16U 	(0x2<<TXCUTC_PARAMP_OFFSET)//t pa_ramp = 16μs
#define RF_PARAMP32U 	(0x3<<TXCUTC_PARAMP_OFFSET)//t pa_ramp = 32μs
//# [3:0] : LPFCUT, transmitter LP filter cut-off frequency (500 kHz)
#define FLC_OFFSET 0
#define FLC_MASK 0x0F
#define RF_FLC80KHZ 	(0x0<<FLC_OFFSET)//f LPFCUT = 80kHz
#define RF_FLC100KHZ 	(0x1<<FLC_OFFSET)//f LPFCUT = 100kHz
#define RF_FLC125KHZ 	(0x2<<FLC_OFFSET)//f LPFCUT = 125kHz
#define RF_FLC160KHZ 	(0x3<<FLC_OFFSET)//f LPFCUT = 160kHz
#define RF_FLC200KHZ 	(0x4<<FLC_OFFSET)//f LPFCUT = 200kHz
#define RF_FLC250KHZ 	(0x5<<FLC_OFFSET)//f LPFCUT = 250kHz
#define RF_FLC315KHZ 	(0x6<<FLC_OFFSET)//f LPFCUT = 315kHz
#define RF_FLC400KHZ 	(0x7<<FLC_OFFSET)//f LPFCUT = 400kHz
#define RF_FLC500KHZ 	(0x8<<FLC_OFFSET)//f LPFCUT = 500kHz
#define RF_FLC625KHZ 	(0x9<<FLC_OFFSET)//f LPFCUT = 625kHz
#define RF_FLC800KHZ 	(0xA<<FLC_OFFSET)//f LPFCUT = 800kHz
#define RF_FLC1000KHZ	(0xB<<FLC_OFFSET)//f LPFCUT = 1000kHz

//RFn_TXDFE – Transmitter TX Digital Frontend
//[7:5] RCUT: TX filter relative to the cut-off frequency
#define RCUT_OFFSET 5
#define RCUT_MASK 0xef
#define RCUT_0_25  (0x0<<RCUT_OFFSET) //frequency CUT=0.25*fs/2
#define RCUT_0_375 (0x1<<RCUT_OFFSET) //frequency CUT=0.375*fs/2
#define RCUT_0_5   (0x2<<RCUT_OFFSET) //frequency CUT=0.5*fs/2
#define RCUT_0_75  (0x3<<RCUT_OFFSET) //frequency CUT=0.75*fs/2
#define RCUT_1     (0x4<<RCUT_OFFSET) //frequency CUT=1.00*fs/2
//bit 4 DM: Direct Modulation bit
#define DM_OFFSET 4
#define DM_MASK 0x10
#define DIRECT_MODULATION_DISABLE 0
//[3:0] SR: TX Sample Rate
#define SR_OFFSET  0
#define SR_MASK  0x07
#define SR_4MHz           (0x1<<SR_OFFSET) //fs=4000kHz default value
#define SR_MkHz           (0x2<<SR_OFFSET) //fs=2000kHz
#define SR_1_33MHz        (0x3<<SR_OFFSET) //fs=(4000/3)kHz
#define SR_1MHz           (0x4<<SR_OFFSET) //fs=1000kHz
#define SR_800kHz         (0x5<<SR_OFFSET) //fs=800kHz
#define SR_1MHz_666_66kHz (0x6<<SR_OFFSET) //fs=(2000/3)kHz
#define SR_500kHz         (0x8<<SR_OFFSET) //fs=500kHz
#define SR_400KHz         (0xA<<SR_OFFSET) //fs=400kHz

//# Radio IRQ Status
//# The register RFn_IRQS contains the radio IRQ status. A bit set to 1 indicates that the corresponding IRQ has occurred.
//# The register is cleared by a read access.
//##
//# This bit is set to 1 if the wake-up procedure from state SLEEP/DEEP_SLEEP or power-up procedure is completed. It
//# also indicates the completion of the RESET procedure.
#define IRQS_WAKEUP_MASK  0x1
//# This bit is set to 1 if the command TXPREP is written to the register RFn_CMD and transceiver reaches the state
//# TXPREP. While being in the state TXPREP and changing the RF frequency, the IRQ TRXRDY is issued once the
//# frequency settling is completed. Note: It is not set if the baseband switches automatically to the state TXPREP due to
//# an IRQ TXFE or RXFE.
#define IRQS_TRXRDY_MASK  0x2
//# This bit is set to 1 if a single or continuous energy measurement is completed. It is not set if the automatic energy
//# measurement mode is used.
#define IRQS_EDC_MASK  0x4
//# This bit is set to 1 if the battery monitor detects a voltage at EVDD that is below the threshold voltage.
#define IRQS_BATLOW_MASK  0x8
//# This bit is set to 1 if a transceiver error is detected, i.e. a PLL lock error occurs.
#define IRQS_TRXERR_MASK  0x10
//# This bit is set to 1 if the I/Q data interface synchronization fails
#define IRQS_IQIFSF_MASK  0x20

#define AT86RF215_RF24_IRQS  0x0001
#define AT86RF215_BBC0_IRQS  0x0002
#define AT86RF215_BBC1_IRQS  0x0003

#define AT86RF215_RF09_DEFAULT_VAL_RXBWC 0x0B

#define AT86RF215_RF09_DEFAULT_VAL_RXDFE_SR 0x1
#define AT86RF215_RF09_RXDFE_CUT_1xFsdiv2 0x4
#define AT86RF215_RF09_RXDFE_CUT_OFFSET 5

#define AT86RF215_RF09_AGCC_DEFAULT_BIT0 1
#define AT86RF215_RF09_AGCC_DEFAULT_BIT7 1
#define AT86RF215_RF09_AGCC_DEFAULT_BIT7_OFFSET 7
//if AGC_EN=0 a write access to GCW manually sets the receiver gain
//23 is the maximum integer receiver gain; each step changes the gain by a step of 3dB
#define AGCC_EN_MASK 1
#define FREEZE_AGC  0x1
#define RELEASE_AGC  0x0
#define FRZC_MASK  0x2
#define AT86RF215_RF09_AGCS  0x010C  //The register controls the AGC and the receiver gain
#define AT86RF215_RF09_AGCS_DEFAULT_VALUE 0x67				// default: 0x77
#define AGCS_GCW_MASK 0X1F
#define AT86RF215_RF09_RSSI  0x010D
#define AT86RF215_RF09_EDC  0x010E
#define AT86RF215_RF09_EDD  0x010F
#define AT86RF215_RF09_EDV  0x0110
#define AT86RF215_RF09_RNDV  0x0111
