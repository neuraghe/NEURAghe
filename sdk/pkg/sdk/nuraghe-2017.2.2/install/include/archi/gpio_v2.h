/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __ARCHI_GPIO_V2_H__
#define __ARCHI_GPIO_V2_H__

#define PLP_GPIO_PADDIR    0x0    // Direction		i:0..31, GPIOi => Bit[i] = 1 Output, Bit[i] = 0 Input (Default)
#define PLP_GPIO_PADIN     0x4    // i:0..31, Bit[i] Received bit from GPIOi
#define PLP_GPIO_PADOUT    0x8    // i:0..31, Bit[i] Bit to transmit through GPIOi
#define PLP_GPIO_INTEN     0xC    // i:0..31, Bit[i]=1 Enable Event for GPIOi
#define PLP_GPIO_INTTYPE0  0x10   // Interrupt Condition	i:0..15, Bit[2*i:2*i+1] = 00 Falling edge		on GPIOi
                                  // = 01 Raising edge		on GPIOi
                                  // = 11 Raising then falling edge	on GPIOi
#define PLP_GPIO_INTTYPE1  0x14   // Interrupt Condition	i:0..15, Bit[2*i:2*i+1] = 00 Falling edge		on GPIOi+16
                                  // = 01 Raising edge		on GPIOi+16
                                  // = 11 Raising the falling edge	on GPIOi+16
#define PLP_GPIO_INTSTATUS 0x18   // Interrupt Status	i:0..31, Bit[i]=1 Event received for GPIOi, bit is cleared when readen
#define PLP_GPIO_EXTWAKEUP 0x1C   // External Wake Up	i:0..31, Bit[i]=1 Use GPIOi as a wake up source for the PMU


#define PLP_GPIO_PADDIR_IN  0
#define PLP_GPIO_PADDIR_OUT 1

#define PLP_GPIO_INTTYPE_RISE 1
#define PLP_GPIO_INTTYPE_FALL 2

#define PLP_GPIO_INTTYPE(id)           (PLP_GPIO_INTTYPE0 + (id)*4)
#define PLP_GPIO_INTTYPE_NO(gpio)      ((gpio) >> 4)
#define PLP_GPIO_INTTYPE_GPIO(inttype) ((inttype)*16)
#define PLP_GPIO_INTTYPE_SIZE          2
#define PLP_GPIO_INTTYPE_BIT(pad)      (((pad) & 0xF) << 1)
#define PLP_GPIO_INTTYPE_GET(gpio,value) (((value) >> PLP_GPIO_INTTYPE_BIT(gpio)) & ((1<<PLP_GPIO_INTTYPE_SIZE) - 1))


#endif
