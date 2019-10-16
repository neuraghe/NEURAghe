/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef ARCHI_MCHAN_V6_H
#define ARCHI_MCHAN_V6_H

// Register map

#define PLP_DMA_QUEUE_OFFSET   0x0
#define PLP_DMA_STATUS_OFFSET  0x4

// Command bitfield

#define PLP_DMA_SIZE_BIT    0
#define PLP_DMA_SIZE_WIDTH  16
#define PLP_DMA_TYPE_BIT   (PLP_DMA_SIZE_WIDTH)
#define PLP_DMA_INCR_BIT   (PLP_DMA_SIZE_WIDTH + 1)
#define PLP_DMA_2D_BIT     (PLP_DMA_SIZE_WIDTH + 2)
#define PLP_DMA_ELE_BIT    (PLP_DMA_SIZE_WIDTH + 3)
#define PLP_DMA_ILE_BIT    (PLP_DMA_SIZE_WIDTH + 4)
#define PLP_DMA_BLE_BIT    (PLP_DMA_SIZE_WIDTH + 5)

#define PLP_DMA_LOC2EXT 0
#define PLP_DMA_EXT2LOC 1

#define PLP_DMA_1D 0
#define PLP_DMA_2D 1

#define PLP_DMA_NO_TRIG_EVT 0
#define PLP_DMA_TRIG_EVT    1

#define PLP_DMA_NO_TRIG_IRQ 0
#define PLP_DMA_TRIG_IRQ    1

#define PLP_DMA_PRIV        0
#define PLP_DMA_SHARED      1

#define PLP_DMA_FIX         0
#define PLP_DMA_INC         1

// Stride bitfield

#define PLP_DMA_2D_STRIDE_BIT    16
#define PLP_DMA_2D_STRIDE_WIDTH  16

#define PLP_DMA_2D_LEN_BIT       0
#define PLP_DMA_2D_LEN_WIDTH     16

// Macros
#define PLP_DMA_SIZE_GET(x)    (((x) >> PLP_DMA_SIZE_BIT) & ((1<<PLP_DMA_SIZE_WIDTH)-1))
#define PLP_DMA_TYPE_GET(x)    (((x) >> PLP_DMA_TYPE_BIT) & 1)
#define PLP_DMA_INCR_GET(x)    (((x) >> PLP_DMA_INCR_BIT) & 1)
#define PLP_DMA_2D_GET(x)      (((x) >> PLP_DMA_2D_BIT)   & 1)
#define PLP_DMA_ELE_GET(x)     (((x) >> PLP_DMA_ELE_BIT)  & 1)
#define PLP_DMA_ILE_GET(x)     (((x) >> PLP_DMA_ILE_BIT)  & 1)
#define PLP_DMA_BLE_GET(x)     (((x) >> PLP_DMA_BLE_BIT)  & 1)

#define PLP_DMA_2D_STRIDE_GET(x)   (((x) >> PLP_DMA_2D_STRIDE_BIT) & ((1<<PLP_DMA_2D_STRIDE_WIDTH)-1))
#define PLP_DMA_2D_LEN_GET(x) (((x) >> PLP_DMA_2D_LEN_BIT) & ((1<<PLP_DMA_2D_LEN_WIDTH)-1))

#endif
