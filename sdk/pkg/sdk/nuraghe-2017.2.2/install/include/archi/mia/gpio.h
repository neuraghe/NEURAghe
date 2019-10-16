/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Revision: Added proper PIN and GP macros for mia (smach).
 *
 */

#ifndef __GPIO_H__
#define __GPIO_H__

#define GPIO_REG_PADDIR               ( GPIO_BASE_ADDR + 0x00 )
#define GPIO_REG_PADIN                ( GPIO_BASE_ADDR + 0x04 )
#define GPIO_REG_PADOUT               ( GPIO_BASE_ADDR + 0x08 )
#define GPIO_REG_INTEN                ( GPIO_BASE_ADDR + 0x0C )
#define GPIO_REG_INTTYPE0             ( GPIO_BASE_ADDR + 0x10 )
#define GPIO_REG_INTTYPE1             ( GPIO_BASE_ADDR + 0x14 )
#define GPIO_REG_INTSTATUS            ( GPIO_BASE_ADDR + 0x18 )

#define GPIO_REG_PADCFG0              ( GPIO_BASE_ADDR + 0x20 )
#define GPIO_REG_PADCFG1              ( GPIO_BASE_ADDR + 0x24 )
#define GPIO_REG_PADCFG2              ( GPIO_BASE_ADDR + 0x28 )
#define GPIO_REG_PADCFG3              ( GPIO_BASE_ADDR + 0x2C )
#define GPIO_REG_PADCFG4              ( GPIO_BASE_ADDR + 0x30 )
#define GPIO_REG_PADCFG5              ( GPIO_BASE_ADDR + 0x34 )
#define GPIO_REG_PADCFG6              ( GPIO_BASE_ADDR + 0x38 )
#define GPIO_REG_PADCFG7              ( GPIO_BASE_ADDR + 0x3C )

#define SOC_CTRL_PADFUN0              ( CLK_DIV_ADDR + 0x00 )
#define SOC_CTRL_PADFUN1              ( CLK_DIV_ADDR + 0x04 )

#define GPIO_INT_RISE        0
#define GPIO_INT_FALL        1

#define GPIO_INT_ENABLE      0
#define GPIO_INT_DISABLE     1

// macros for PIN configuration
#define PIN_SSPI_SIO0        0
#define PIN_SSPI_SIO1        1
#define PIN_SSPI_SIO2        2
#define PIN_SSPI_SIO3        3
#define PIN_SSPI_CSN         4
#define PIN_SSPI_SCK         5
#define PIN_MSPI_SIO0        6
#define PIN_MSPI_SIO1        7
#define PIN_MSPI_SIO2        8
#define PIN_MSPI_SIO3        9
#define PIN_MSPI_CSN0        10
#define PIN_MSPI_SCK         11
#define PIN_UART_TX          12
#define PIN_UART_RX          13
#define PIN_UART_CTS         14
#define PIN_UART_RTS         15
#define PIN_I2C_SDA          16
#define PIN_I2C_SCL          17
#define PIN_AUDIO_I2S_WS     18
#define PIN_AUDIO_I2S_SCK    19
#define PIN_AUDIO_I2S_SDI0   20
#define PIN_AUDIO_I2S_SDI1   21
#define PIN_AUDIO_I2S_SDI2   22
#define PIN_AUDIO_I2S_SDI3   23
#define PIN_AUDIO_I2S_SDI4   24
#define PIN_AUDIO_I2S_SDI5   25
#define PIN_AUDIO_I2S_SDI6   26
#define PIN_AUDIO_I2S_SDI7   27
#define PIN_CAM_I2S_SCK      28
#define PIN_CAM_I2S_WS       29
#define PIN_CAM_I2S_SDI0     30
#define PIN_CAM_I2S_SDI1     31
#define PIN_POWER_DOWN       32

//macros for GPIO configuration
#define PIN_SSPI_SIO0_GP0        0
#define PIN_SSPI_SIO1_GP1        1
#define PIN_SSPI_SIO2_GP2        2
#define PIN_SSPI_SIO3_GP3        3
#define PIN_SSPI_CSN_GP4         4
#define PIN_MSPI_SIO0_GP5        5
#define PIN_MSPI_SIO1_GP6        6
#define PIN_MSPI_SIO2_GP7        7
#define PIN_MSPI_SIO3_GP8        8
#define PIN_MSPI_CSN0_GP9        9
#define PIN_MSPI_SCK_GP10        10
#define PIN_UART_TX_GP11         11
#define PIN_UART_RX_GP12         12
#define PIN_UART_CTS_GP13        13
#define PIN_UART_RTS_GP14        14
#define PIN_I2C_SDA_GP15         15
#define PIN_I2C_SCL_GP16         16
#define PIN_AUDIO_I2S_WS_GP17    17
#define PIN_AUDIO_I2S_SCK_GP18   18
#define PIN_AUDIO_I2S_SDI0_GP19  19
#define PIN_AUDIO_I2S_SDI1_GP20  20
#define PIN_AUDIO_I2S_SDI2_GP21  21
#define PIN_AUDIO_I2S_SDI3_GP22  22
#define PIN_AUDIO_I2S_SDI4_GP23  23
#define PIN_AUDIO_I2S_SDI5_GP24  24
#define PIN_AUDIO_I2S_SDI6_GP25  25
#define PIN_AUDIO_I2S_SDI7_GP26  26
#define PIN_CAM_I2S_SCK_GP27     27
#define PIN_CAM_I2S_WS_GP28      28
#define PIN_CAM_I2S_SDI0_GP29    29
#define PIN_CAM_I2S_SDI1_GP30    30
#define PIN_POWER_DOWN_GP31      31

//these can be also used instead of the GPIO macros above.
#define PIN_GP0	    0
#define PIN_GP1	    1
#define PIN_GP2	    2
#define PIN_GP3	    3
#define PIN_GP4	    4
#define PIN_GP5	    5
#define PIN_GP6	    6
#define PIN_GP7	    7
#define PIN_GP8	    8
#define PIN_GP9	    9
#define PIN_GP10	10
#define PIN_GP11	11
#define PIN_GP12	12
#define PIN_GP13	13
#define PIN_GP14	14
#define PIN_GP15	15
#define PIN_GP16	16
#define PIN_GP17	17
#define PIN_GP18	18
#define PIN_GP19	19
#define PIN_GP20	20
#define PIN_GP21	21
#define PIN_GP22	22
#define PIN_GP23	23
#define PIN_GP24	24
#define PIN_GP25	25
#define PIN_GP26	26
#define PIN_GP27	27
#define PIN_GP28	28
#define PIN_GP29	29
#define PIN_GP30	30
#define PIN_GP31	31


#define FUNC_SPI  0
#define FUNC_NOM  0
#define FUNC_GPIO 1

#define DIR_IN  0
#define DIR_OUT 1

#endif // _GPIO_H_
