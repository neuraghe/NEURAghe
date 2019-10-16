 /**
 * Header: hwcrypt
 *
 * Implements a the hardware abstraction layer for the HWCrypt crypto
 * accelerator.
 *
 * General Information:
 * File         - hwcrypt.h
 * Title        - HWCrypt hardware abstraction layer
 * Project      - Secure PULP
 * Author       - Robert Schilling (rschilling@student.tugraz.at)
 * Company      - Integrated Systems Laboratory - ETH Zurich,
 *                Institute of Applied Information Processing and
                  Communications - TU Graz
 * Copyright    - Copyright 2015 Integrated Systems Laboratory - ETH Zurich,
                  Institute of Applied Information Processing and
                  Communications - TU Graz
 * File Created - 2015-12-11
 * Last Updated - 2015-12-11
 * Standard     - C99
 *
 *
 * Major Revisions:
 * 2015-12-11 (v1.0) - Created (rs)
 */

#ifndef HWCRYPT_H
#define HWCRYPT_H

#include "utils.h"
#include "int.h"

//------------------------------------------------------------------------------
// Base address of the encryption peripheral
//------------------------------------------------------------------------------
#define SECURE_PULP_BASE_ADDR ( 0x10201000 )

//------------------------------------------------------------------------------
// Interrupt configuration of the peripheral in the cluster
//------------------------------------------------------------------------------
#define EVENT_HWCRYPT       17
#define EVTMASK_HWCRYPT     (1 << EVENT_HWCRYPT)

//------------------------------------------------------------------------------
// Register map
//------------------------------------------------------------------------------
#define REG_STATUS          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x000))
#define REG_CONTROL         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x004))
#define REG_SOURCE          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x008))
#define REG_TARGET          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x00C))
#define REG_TAG_TARGET      *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x010))
#define REG_LENGTH          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x014))
#define REG_NONCE_0         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x018))
#define REG_NONCE_1         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x01C))
#define REG_NONCE_2         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x020))
#define REG_NONCE_3         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x024))
#define REG_TAG_0           *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x028))
#define REG_TAG_1           *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x02C))
#define REG_TAG_2           *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x030))
#define REG_TAG_3           *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x034))
#define REG_SPONGE_CONTROL  *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x038))
#define REG_KEY0_0          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x03C))
#define REG_KEY0_1          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x040))
#define REG_KEY0_2          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x044))
#define REG_KEY0_3          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x048))
#define REG_KEY1_0          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x04C))
#define REG_KEY1_1          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x050))
#define REG_KEY1_2          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x054))
#define REG_KEY1_3          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x058))
#define REG_SESSIONKEY_0    *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x05C))
#define REG_SESSIONKEY_1    *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x060))
#define REG_SESSIONKEY_2    *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x064))
#define REG_SESSIONKEY_3    *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x068))
#define REG_SESSIONKEY_4    *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x06C))
#define REG_CONST0_0        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x070))
#define REG_CONST0_1        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x074))
#define REG_CONST0_2        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x078))
#define REG_CONST0_3        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x07C))
#define REG_CONST1_0        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x080))
#define REG_CONST1_1        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x084))
#define REG_CONST1_2        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x088))
#define REG_CONST1_3        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x08C))
#define REG_SEED_0          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x090))
#define REG_SEED_1          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x094))
#define REG_SEED_2          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x098))
#define REG_SEED_3          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x09C))
#define REG_SEED_4          *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0A0))
#define REG_IVREKEY_0       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0A4))
#define REG_IVREKEY_1       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0A8))
#define REG_IVREKEY_2       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0AC))
#define REG_IVREKEY_3       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0B0))
#define REG_IVREKEY_4       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0B4))
#define REG_IVREKEY_5       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0B8))
#define REG_IVREKEY_6       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0BC))
#define REG_IVREKEY_7       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0C0))
#define REG_IVREKEY_8       *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0C4))
#define REG_IVENC_0         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0C8))
#define REG_IVENC_1         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0CC))
#define REG_IVENC_2         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0D0))
#define REG_IVENC_3         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0D4))
#define REG_IVMAC_0         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0D8))
#define REG_IVMAC_1         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0DC))
#define REG_IVMAC_2         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0E0))
#define REG_IVMAC_3         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0E4))
#define REG_IVMAC_4         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0E8))
#define REG_IVMAC_5         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0EC))
#define REG_IVMAC_6         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0F0))
#define REG_IVMAC_7         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0F4))
#define REG_IVMAC_8         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0F8))
#define REG_STATE_0         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x0FC))
#define REG_STATE_1         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x100))
#define REG_STATE_2         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x104))
#define REG_STATE_3         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x108))
#define REG_STATE_4         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x10C))
#define REG_STATE_5         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x110))
#define REG_STATE_6         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x114))
#define REG_STATE_7         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x118))
#define REG_STATE_8         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x11C))
#define REG_STATE_9         *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x120))
#define REG_STATE_10        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x124))
#define REG_STATE_11        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x128))
#define REG_STATE_12        *((volatile uint32_t*) (SECURE_PULP_BASE_ADDR + 0x12C))

//------------------------------------------------------------------------------
// Bit configuration of REG_STATUS
//------------------------------------------------------------------------------

// Bit positions
#define BIT_BUSY                      0
#define BIT_FINISH                    1
#define BIT_QUEUE_FULL                2
#define BIT_ERROR_NO_MODE             3
#define BIT_ERROR_REKEY               4
#define BIT_ERROR_SHUFFLE             5
#define BIT_ERROR_ENC                 6
#define BIT_ERROR_LENGTH_MOD          7
#define BIT_ERROR_LENGTH_ZERO         8
#define BIT_ERROR_REG_OVERLAP         9
#define BIT_ERROR_REG_OUT_OF_BOUND    10
#define BIT_ERROR_TAG_VERIFICATION    11
#define BIT_ERROR_AUTH_CONFIG         12
#define BIT_ERROR_PRIMITIVE_MODE      13
#define BIT_LAST_CMD_ID_LOW           16
#define BIT_LAST_CMD_ID_HIGH          18
#define BIT_CURR_CMD_ID_LOW           20
#define BIT_CURR_CMD_ID_HIGH          22

// Bit masks
#define MASK_BUSY                     (1 << BIT_BUSY)
#define MASK_FINISH                   (1 << BIT_FINISH)
#define MASK_QUEUE_FULL               (1 << BIT_QUEUE_FULL)
#define MASK_ERROR_NO                 (1 << BIT_ERROR_NO_MODE)
#define MASK_ERROR_REKEY              (1 << BIT_ERROR_REKEY)
#define MASK_ERROR_SHUFFLE            (1 << BIT_ERROR_SHUFFLE)
#define MASK_ERROR_ENC                (1 << BIT_ERROR_ENC)
#define MASK_ERROR_LENGTH_MOD         (1 << BIT_ERROR_LENGTH_MOD)
#define MASK_ERROR_LENGTH_ZERO        (1 << BIT_ERROR_LENGTH_ZERO)
#define MASK_ERROR_REG_OVERLAP        (1 << BIT_ERROR_REG_OVERLAP)
#define MASK_ERROR_REG_OUT_OF_BOUNDS  (1 << BIT_ERROR_REG_OUT_OF_BOUND)
#define MASK_ERROR_TAG_VERIFICATION   (1 << BIT_ERROR_TAG_VERIFICATION)
#define MASK_ERROR_PRIMITIVE_MODE     (1 << BIT_ERROR_PRIMITIVE_MODE)

//------------------------------------------------------------------------------
// Bit configuration of REG_CONTROL
//------------------------------------------------------------------------------

// Bit positions
#define BIT_START             0
#define BIT_ENC_DEC           1
#define BIT_AUTH              2
#define BIT_USE_FRESH_SEED    3
#define BIT_REKEY_LOW         4
#define BIT_REKEY_HIGH        6
#define BIT_ENC_MODE_LOW      8
#define BIT_ENC_MODE_HIGH     10
#define BIT_SHUFFLE_MODE_LOW  12
#define BIT_SHUFFLE_MODE_HIGH 13
#define BIT_MASK_LOW          16
#define BIT_MASK_HIGH         23
#define BIT_PRIMITIVE_LOW     24
#define BIT_PRIMITIVE_HIGH    26

// Bit masks
#define MASK_START                      (1 << BIT_START)
#define MASK_ENC_DEC                    (1 << BIT_ENC_DEC)
#define MASK_AUTH                       (1 << BIT_AUTH)
#define MASK_BIT_USE_FRESH_SEED         (1 << BIT_USE_FRESH_SEED)
#define MASK_REKEY_NONE                 (0 << BIT_REKEY_LOW)
#define MASK_REKEY_POLYMUL              (1 << BIT_REKEY_LOW)
#define MASK_REKEY_POLYMUL_POST_PROC    (2 << BIT_REKEY_LOW)
#define MASK_REKEY_EXP_RK1              (3 << BIT_REKEY_LOW)
#define MASK_REKEY_EXP_RK2              (4 << BIT_REKEY_LOW)
#define MASK_REKEY_RK1                  (5 << BIT_REKEY_LOW)
#define MASK_REKEY_RK2                  (6 << BIT_REKEY_LOW)
#define MASK_SHUFFLE_NONE               (0 << BIT_SHUFFLE_MODE_LOW)
#define MASK_SHUFFLE_START              (1 << BIT_SHUFFLE_MODE_LOW)
#define MASK_SHUFFLE_FULL               (2 << BIT_SHUFFLE_MODE_LOW)
#define MASK_ENC_NONE                   (0 << BIT_ENC_MODE_LOW)
#define MASK_ENC_ECB                    (1 << BIT_ENC_MODE_LOW)
#define MASK_ENC_XTS                    (2 << BIT_ENC_MODE_LOW)
#define MASK_ENC_LR                     (3 << BIT_ENC_MODE_LOW)
#define MASK_ENC_SPONGE                 (4 << BIT_ENC_MODE_LOW)
#define MASK_PRIMITIVE_ENC_FULL         (1 << BIT_PRIMITIVE_LOW)
#define MASK_PRIMITIVE_DEC_FULL         (2 << BIT_PRIMITIVE_LOW)
#define MASK_PRIMITIVE_ENC_LAST         (3 << BIT_PRIMITIVE_LOW)
#define MASK_PRIMITIVE_DEC_LAST         (4 << BIT_PRIMITIVE_LOW)
#define MASK_PRIMITIVE_SPONGE           (5 << BIT_PRIMITIVE_LOW)
#define MASK_ORDER(x)                   ((x) << BIT_MASK_LOW)

//------------------------------------------------------------------------------
// Bit configuration of REG_SPONGE_CONTROL
//------------------------------------------------------------------------------

#define BIT_ROUNDS_REKEY_LOW   0
#define BIT_ROUNDS_REKEY_HIGH  3
#define BIT_ROUNDS_ENC_LOW     4
#define BIT_ROUNDS_ENC_HIGH    7
#define BIT_ROUNDS_MAC_LOW     8
#define BIT_ROUNDS_MAC_HIGH    11
#define BIT_RATE_REKEY_LOW     12
#define BIT_RATE_REKEY_HIGH    15
#define BIT_RATE_ENC_LOW       16
#define BIT_RATE_ENC_HIGH      19
#define BIT_RATE_MAC_LOW       20
#define BIT_RATE_MAC_HIGH      23

//------------------------------------------------------------------------------
// Function: hwcrypt_wait_finish
//
// Waits until the the encryption has finished by polling the status register
//
//------------------------------------------------------------------------------
static inline void hwcrypt_wait_finish() {
  while(REG_STATUS & MASK_BUSY);
}

//------------------------------------------------------------------------------
// Function: hwcrypt_enable
//
// Enables the TCDM interfaces of the HWCrypt accelerator.
//
//------------------------------------------------------------------------------
static inline void hwcrypt_enable() {
  // Enable clock for cluster, select TCDM Mux to HWCrypt
  *(volatile int *) (EOC_UNIT_BASE_ADDR + 0x18) |= 0x800;
  *(volatile int *) (EOC_UNIT_BASE_ADDR + 0x18) &= ~0x400;
}

//------------------------------------------------------------------------------
// Function: hwcrypt_irq_config
//
// Configure the interrupt and event unit, such that an irq and event is raised
// if the hwcrypt accelerator finishes.
//
// Parameters:
//
//   handler - IRQ handler called when the irq is raised
//   arg     - Arguments passed to the irq handler
//
//------------------------------------------------------------------------------
void hwcrypt_irq_config(void (* handler)(void *), void *arg);

#endif
