/* 
 * Copyright (C) 2016 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_FULMINE_GPIO_H__
#define __ARCHI_FULMINE_GPIO_H__

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

#define PIN_SSPI_SIO0_GP0     0
#define PIN_SSPI_SIO1_GP1     1
#define PIN_SSPI_SIO2_GP2     2
#define PIN_SSPI_SIO3_GP3     3
#define PIN_SSPI_CSN_GP4      4
#define PIN_SSPI_SCK_GP5      5

#define PIN_MSPI_SIO0_GP6     6
#define PIN_MSPI_SIO1_GP7     7
#define PIN_MSPI_SIO2_GP8     8
#define PIN_MSPI_SIO3_GP9     9
#define PIN_MSPI_CSN0_GP10   10
#define PIN_MSPI_SCK_GP11    11

#define PIN_MSPI1_SIO0_GP12  12
#define PIN_MSPI1_SIO1_GP13  13
#define PIN_MSPI1_SIO2_GP14  14
#define PIN_MSPI1_SIO3_GP15  15
#define PIN_MSPI1_CSN0_GP16  16
#define PIN_MSPI1_SCK_GP17   17

#define PIN_UART_TX_GP18     18
#define PIN_UART_RX_GP19     19

#define PIN_I2C_SDA_GP20     20
#define PIN_I2C_SCL_GP21     21

#define PIN_EOC_GP22         22

#define PIN_GP23             23
#define PIN_GP24             24
#define PIN_GP25             25
#define PIN_GP26             26
#define PIN_GP27             27
#define PIN_GP28             28
#define PIN_GP29             29
#define PIN_GP30             30
#define PIN_GP31             31

#define PIN_SSPI_SIO0   PIN_SSPI_SIO0_GP0  
#define PIN_SSPI_SIO1   PIN_SSPI_SIO1_GP1  
#define PIN_SSPI_SIO2   PIN_SSPI_SIO2_GP2  
#define PIN_SSPI_SIO3   PIN_SSPI_SIO3_GP3  
#define PIN_SSPI_CSN    PIN_SSPI_CSN_GP4   
#define PIN_SSPI_SCK    PIN_SSPI_SCK_GP5   
#define PIN_MSPI_SIO0   PIN_MSPI_SIO0_GP6  
#define PIN_MSPI_SIO1   PIN_MSPI_SIO1_GP7  
#define PIN_MSPI_SIO2   PIN_MSPI_SIO2_GP8  
#define PIN_MSPI_SIO3   PIN_MSPI_SIO3_GP9  
#define PIN_MSPI_CSN0   PIN_MSPI_CSN0_GP10 
#define PIN_MSPI_SCK    PIN_MSPI_SCK_GP11  
#define PIN_MSPI1_SIO0  PIN_MSPI1_SIO0_GP12
#define PIN_MSPI1_SIO1  PIN_MSPI1_SIO1_GP13
#define PIN_MSPI1_SIO2  PIN_MSPI1_SIO2_GP14
#define PIN_MSPI1_SIO3  PIN_MSPI1_SIO3_GP15
#define PIN_MSPI1_CSN0  PIN_MSPI1_CSN0_GP16
#define PIN_MSPI1_SCK   PIN_MSPI1_SCK_GP17 
#define PIN_UART_TX     PIN_UART_TX_GP18   
#define PIN_UART_RX     PIN_UART_RX_GP19   
#define PIN_I2C_SDA     PIN_I2C_SDA_GP20   
#define PIN_I2C_SCL     PIN_I2C_SCL_GP21   
#define PIN_EOC         PIN_EOC_GP22       

// compatibility with bench lib
#define PIN_CAM_I2S_SDI1 PIN_GP23

#define FUNC_SPI  0
#define FUNC_NOM  0
#define FUNC_GPIO 1

#define DIR_IN  0
#define DIR_OUT 1

#endif // _GPIO_H_
