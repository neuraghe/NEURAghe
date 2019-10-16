/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_DEBUG_H__
#define __HAL_DEBUG_H__

#include <stdint.h>

#define PRINTF_BUF_SIZE 32

// This structure can be used to interact with the host loader
typedef struct {

	// Used by external debug bridge to get exit status when using the board
	uint32_t exitStatus;

	// Printf
  uint32_t useInternalPrintf;
  uint32_t putcharPending;
  uint32_t putcharCurrent;
  uint8_t putcharBuffer[PRINTF_BUF_SIZE];

  // Debug step, used for showing progress to host loader
	uint32_t debugStep;
	uint32_t debugStepPending;

} debugStruct_t;

#define PLP_DEBUG_STRUCT_INIT {0, 1, 0 ,0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, 0}



#define FLASHER_BUFFER_MAX_SIZE                   0x8000

// This structure can be used to interact with the flasher, used to copy binary from host to the embedded flash
typedef struct {

	char buffer[FLASHER_BUFFER_MAX_SIZE];
	int buffer_pulp_status;
	int buffer_ext_status;
	int buffer_size;
	unsigned int buffer_dest;
	int buffer_start;

} flasherStruct_t;

typedef struct {
  uint32_t l2_start;
  uint32_t l2_ptr;
  uint32_t l2_size;
  uint32_t l2_blocks;

  uint32_t tcdm_start;
  uint32_t tcdm_ptr;
  uint32_t tcdm_size;
  uint32_t tcdm_blocks;
} flash_v1_header_t;

typedef struct {
  uint32_t start;
  uint32_t ptr;
  uint32_t size;
  uint32_t blocks;
} flash_v2_mem_area_t;

typedef struct {
  uint32_t nbAreas;
} flash_v2_header_t;

typedef struct {
  flash_v2_header_t header;
  flash_v2_mem_area_t area;
} flash_v2_header_single_t;


#define FLASH_BLOCK_SIZE_LOG2 12
#define FLASH_BLOCK_SIZE      (1<<FLASH_BLOCK_SIZE_LOG2)



#endif