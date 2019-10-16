/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef __ARCHI_SPIM2_H__
#define __ARCHI_SPIM2_H__

#define SPIM2_QPI    1
#define SPIM2_NO_QPI 0

#define SPIM2_CMD_RD    0
#define SPIM2_CMD_WR    1
#define SPIM2_CMD_QRD   2
#define SPIM2_CMD_QWR   3
#define SPIM2_CMD_SWRST 4

#define SPIM2_CSN0 0
#define SPIM2_CSN1 1
#define SPIM2_CSN2 2
#define SPIM2_CSN3 3

#define SPIM2_REG_STATUS                ( 0x00 )
#define SPIM2_REG_CLKDIV                ( 0x04 )
#define SPIM2_REG_SPICMD                ( 0x08 )
#define SPIM2_REG_SPIADR                ( 0x0C )
#define SPIM2_REG_SPILEN                ( 0x10 )
#define SPIM2_REG_SPIDUM                ( 0x14 )
#define SPIM2_REG_SPILEN2               ( 0x18 )

#endif
