/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_HONEY_GPIO_H__
#define __ARCHI_HONEY_GPIO_H__

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
#define GPIO_REG_PADCFG5              ( GPIO_BASE_ADDR + 0x24 )
#define GPIO_REG_PADCFG6              ( GPIO_BASE_ADDR + 0x38 )
#define GPIO_REG_PADCFG7              ( GPIO_BASE_ADDR + 0x3C )

#define SOC_CTRL_PADFUN0              ( APB_SOC_CTRL_ADDR + 0x00 )
#define SOC_CTRL_PADFUN1              ( APB_SOC_CTRL_ADDR + 0x04 )

#define GPIO_INT_RISE        0
#define GPIO_INT_FALL        1

#define GPIO_INT_ENABLE      0
#define GPIO_INT_DISABLE     1

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
#define PIN_I2C_SDA          14
#define PIN_I2C_SCL          15
#define PIN_AUDIO_I2S_WS     16
#define PIN_AUDIO_I2S_SCK    17
#define PIN_AUDIO_I2S_SDI0   18
#define PIN_AUDIO_I2S_SDI1   19
#define PIN_CAM_I2S_SCK      20
#define PIN_CAM_I2S_WS       21
#define PIN_CAM_I2S_SDI0     22
#define PIN_CAM_I2S_SDI1     23
#define PIN_POWER_DOWN       24

#define PIN_SSPI_SIO0_GP0         0
#define PIN_SSPI_SIO1_GP1         1
#define PIN_SSPI_SIO2_GP2         2
#define PIN_SSPI_SIO3_GP3         3
#define PIN_SSPI_CSN_GP4          4
#define PIN_MSPI_SIO0_GP5         5
#define PIN_MSPI_SIO1_GP6         6
#define PIN_MSPI_SIO2_GP7         7
#define PIN_MSPI_SIO3_GP8         8
#define PIN_MSPI_CSN0_GP9         9
#define PIN_MSPI_SCK_GP10         10
#define PIN_UART_TX_GP11          11
#define PIN_UART_RX_GP12          12
#define PIN_I2C_SDA_GP13          13
#define PIN_I2C_SCL_GP14          14
#define PIN_AUDIO_I2S_WS_GP15     15
#define PIN_AUDIO_I2S_SCK_GP16    16
#define PIN_AUDIO_I2S_SDI0_GP17   17
#define PIN_AUDIO_I2S_SDI1_GP18   18
#define PIN_CAM_I2S_SCK_GP19      19
#define PIN_CAM_I2S_WS_GP20       20
#define PIN_CAM_I2S_SDI0_GP21     21
#define PIN_CAM_I2S_SDI1_GP22     22
#define PIN_POWER_DOWN_GP23       23

#define FUNC_SPI  0
#define FUNC_NOM  0
#define FUNC_GPIO 1

#define DIR_IN  0
#define DIR_OUT 1

#endif // _GPIO_H_
