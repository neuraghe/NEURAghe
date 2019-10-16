/* 
 * encryption.h
 * Francesco Conti <f.conti@unibo.it>
 * Robert Schilling <robert.schilling@iaik.tugraz.at>
 *
 * Copyright (C) 2015 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#include "hwcrypt.h"

#define REKEY_MODE    5
#define ROUNDS_REKEY  6
#define ROUNDS_ENC    6
#define ROUNDS_MAC    6
#define RATE_REKEY    0
#define RATE_ENC      7
#define RATE_MAC      7
#define KECCAK_ITERATIONS 1
#define AES_ITERATIONS 1

#if 0
// currently, entirely hard-wired
static void ccn_encrypt_keccak_config() {
    // Configure the accelerator
    REG_KEY0_0 = 0x1972EF86;
    REG_KEY0_1 = 0xD170C582;
    REG_KEY0_2 = 0x339061D4;
    REG_KEY0_3 = 0x46B3746C;

    // Configure initial vectors
    REG_IVREKEY_0 = 0x00000000;
    REG_IVREKEY_1 = 0x00000000;
    REG_IVREKEY_2 = 0x00000000;
    REG_IVREKEY_3 = 0x00000000;
    REG_IVREKEY_4 = 0x00000000;
    REG_IVREKEY_5 = 0x00000000;
    REG_IVREKEY_6 = 0x00000000;
    REG_IVREKEY_7 = 0x00000000;
    REG_IVREKEY_8 = 0x00000000;

    REG_IVENC_0 = 0x00000000;
    REG_IVENC_1 = 0x00000000;
    REG_IVENC_2 = 0x00000000;
    REG_IVENC_3 = 0x00000000;

    REG_IVMAC_0 = 0x00000000;
    REG_IVMAC_1 = 0x00000000;
    REG_IVMAC_2 = 0x00000000;
    REG_IVMAC_3 = 0x00000000;
    REG_IVMAC_4 = 0x00000000;
    REG_IVMAC_5 = 0x00000000;
    REG_IVMAC_6 = 0x00000000;
    REG_IVMAC_7 = 0x00000000;
    REG_IVMAC_8 = 0x00000000;

    // Configure key and nonce
    REG_KEY1_0 = 0x3A1B437D;
    REG_KEY1_1 = 0xC3DAF521;
    REG_KEY1_2 = 0x04D97DA1;
    REG_KEY1_3 = 0x5F3C63BC;

    REG_NONCE_0 = 0x7D5CB213;
    REG_NONCE_1 = 0xAB6AC760;
    REG_NONCE_2 = 0x024DC3A5;
    REG_NONCE_3 = 0x37A5C4F9;

    // Write tag used for decryption
    REG_TAG_0 = 0x8337b640;
    REG_TAG_1 = 0xfbef0dca;
    REG_TAG_2 = 0xa1b05e6b;
    REG_TAG_3 = 0xcbe974d8;
}

static void ccn_encrypt_keccak(
    data_t   *src,
    data_t   *targ,
    uint32_t  len
) {
    // Register pointers
    REG_SOURCE     = ((uint32_t) src);
    REG_TARGET     = ((uint32_t) targ);
    REG_LENGTH     = len;

    // Configure the sponge parameters
    REG_SPONGE_CONTROL = ROUNDS_REKEY << BIT_ROUNDS_REKEY_LOW |
                         ROUNDS_ENC   << BIT_ROUNDS_ENC_LOW   |
                         ROUNDS_MAC   << BIT_ROUNDS_MAC_LOW   |
                         RATE_REKEY   << BIT_RATE_REKEY_LOW   |
                         RATE_ENC     << BIT_RATE_ENC_LOW     |
                         RATE_MAC     << BIT_RATE_MAC_LOW;
    // Nonce Padding
    REG_STATE_0 = 1;

    // Expand the key
    REG_CONTROL = (REKEY_MODE-2) << BIT_REKEY_LOW | MASK_START;
    hwcrypt_wait_finish();

    for(int i=0; i<KECCAK_ITERATIONS; i++) {
        REG_CONTROL = MASK_START | MASK_ENC_SPONGE | MASK_REKEY_RK1 | MASK_AUTH | MASK_AUTH;
        hwcrypt_wait_finish();
    }
}
#endif

#ifdef CCN_ENCRYPT_HWCRYPT
static void ccn_encrypt_aes_xts_hwcrypt_config() {
  // Configure PRNG
  REG_SEED_0 = 0x00000123;
  REG_SEED_1 = 0x00000000;
  REG_SEED_2 = 0x00000000;
  REG_SEED_3 = 0x00000000;
  REG_SEED_4 = 0x00000000;

  // Configure the accelerator
  REG_KEY0_0 = 0x1972EF86;
  REG_KEY0_1 = 0xD170C582;
  REG_KEY0_2 = 0x3390614D;
  REG_KEY0_3 = 0x46B3746C;

  // Additional XTS configuration
  REG_KEY1_0 = 0x52C2DD8D;
  REG_KEY1_1 = 0xC80DE9BE;
  REG_KEY1_2 = 0x5137A92B;
  REG_KEY1_3 = 0x164F0E48;

  // Block number for XTS and Const1 for LR
  REG_CONST1_0 = 0xEED50C7F;
  REG_CONST1_1 = 0x2DAF189F;
  REG_CONST1_2 = 0x2CCE4A89;
  REG_CONST1_3 = 0x46F4DE2A;

  // Additional AES-LR configuration
  REG_CONST0_0 = 0x00000000;
  REG_CONST0_1 = 0x00000000;
  REG_CONST0_2 = 0x00000000;
  REG_CONST0_3 = 0x00000000;

  REG_NONCE_0 = 0x8FF8F1C0;
  REG_NONCE_1 = 0xA8782773;
  REG_NONCE_2 = 0x3535A1A2;
  REG_NONCE_3 = 0xB4CCE0A0;
}

static void ccn_encrypt_aes_xts_hwcrypt(
    data_t   *src,
    data_t   *targ,
    uint32_t  len
) {
    // Register pointers
    REG_SOURCE     = ((uint32_t) src);
    REG_TARGET     = ((uint32_t) targ);
    REG_LENGTH     = len;

    for(int i=0; i<AES_ITERATIONS; i++) {
        REG_CONTROL = MASK_START | MASK_ENC_XTS;
        hwcrypt_wait_finish();
    }

}

#else

#include "aes_sw.h"
PLP_L1_GLOBAL_DATA uint8_t key0[16] = { 0x46,0xB3,0x74,0x6C,0x33,0x90,0x61,0xD4,0xD1,0x70,0xC5,0x82,0x19,0x72,0xEF,0x86 };
PLP_L1_GLOBAL_DATA uint8_t key1[16] = {0x16,0x4f,0x0e,0x48,0x51,0x37,0xa9,0x2b,0xc8,0x0d,0xe9,0xbe,0x52,0xc2,0xdd,0x8d};
PLP_L1_GLOBAL_DATA uint8_t block_nr[16] = { 0x7F, 0x0C, 0xD5, 0xEE, 0x9F, 0x18, 0xAF, 0x2D, 0x89, 0x4A, 0xCE, 0x2C, 0x2A, 0xDE, 0xF4, 0x46 };

static void ccn_encrypt_aes_xts(
    data_t   *src,
    data_t   *targ,
    uint32_t  len
) {
  for(int i = 0; i < len / 16; i++, src += 16, targ += 16) {
    aes128_xts_encrypt(src, targ);
  }
}

#endif