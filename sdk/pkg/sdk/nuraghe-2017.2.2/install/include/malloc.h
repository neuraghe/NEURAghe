/* Copyright 2014 DEI - Universita' di Bologna
   author       DEI - Universita' di Bologna
                Alessandro Capotondi - alessandro.capotondi@unibo.it
   info         Simple Malloc based on FREERTOS Heap_4.c mode */

#ifndef _MALLOC_H_
#define _MALLOC_H_

#include "pulp.h"
#include "string_lib.h"
#include "utils.h"

#ifndef NULL
#define NULL ((void *) 0x0) /* Standard C */
#endif

/* Define the linked list structure.  This is used to link free blocks in order
 *of their memory address. */
typedef struct A_BLOCK_LINK
{
    struct A_BLOCK_LINK *pxNextFreeBlock;   /*<< The next free block in the list. */
    unsigned int xBlockSize;                      /*<< The size of the free block. */
} BlockLink_t;

typedef struct heap_desc_s
{  
    BlockLink_t xstart;
    BlockLink_t *pxend;
    
    unsigned int xFreeBytesRemaining;
    unsigned int xMinimumEverFreeBytesRemaining;
    unsigned int xBlockAllocatedBit;
    
    unsigned int *lock;
} heap_desc_t;

/*
 * --------------------------------------------------------------
 * Configuration
 * --------------------------------------------------------------
 */

/* Assumes 8bit bytes! */
#define heapBITS_PER_BYTE                       ( ( unsigned int ) 8 )

#define portBYTE_ALIGNMENT                      (4)
#define portBYTE_ALIGNMENT_MASK                 ( ( unsigned int ) 0x0003 )
#define portPOINTER_SIZE_TYPE                   (int *)

/* The size of the structure placed at the beginning of each allocated memory
 *block must by correctly byte aligned. */
#define xHeapStructSize                         ((sizeof(BlockLink_t) + (portBYTE_ALIGNMENT-1)) & ~portBYTE_ALIGNMENT_MASK )

/* Block sizes must not get too small. */
#define heapMINIMUM_BLOCK_SIZE                  ( ( unsigned int ) ( xHeapStructSize * 2 ) )

/*
 * --------------------------------------------------------------
 * Global Variables
 * --------------------------------------------------------------
 */

/* Create a couple of list links to mark the start and end of the list. */
// BlockLink_t xStart, *pxEnd = NULL;
#define xStart(heap)                                  (heap->xstart)
#define pxEnd(heap)                                   (heap->pxend)

/* Keeps track of the number of free bytes remaining, but says nothing about
 *fragmentation. */
// unsigned int xFreeBytesRemaining = 0U;
// unsigned int xMinimumEverFreeBytesRemaining = 0U;
#define xFreeBytesRemaining(heap)                     (heap->xFreeBytesRemaining)
#define xMinimumEverFreeBytesRemaining(heap)          (heap->xMinimumEverFreeBytesRemaining)

/* Gets set to the top bit of an unsigned int type.  When this bit in the xBlockSize
 * member of an BlockLink_t structure is set then the block belongs to the
 * application.  When the bit is free the block is still part of the free heap
 * space. */
// unsigned int xBlockAllocatedBit = 0;
#define xBlockAllocatedBit(heap)                 (heap->xBlockAllocatedBit)

#define vTaskSuspendAll(heap) \
{\
    volatile unsigned int *tas_addr = (volatile unsigned int *)(((unsigned char *)heap->lock) + 0x100000);\
    while (*tas_addr == 0xffffffff);\
}
    
#define xTaskResumeAll(heap) \
{\
    *(volatile unsigned int *)(heap->lock) = 0;\
}

#define configASSERT(x) \
{\
    if( ! (x)) {\
      printf("[Malloc] Error: assert failed at file %s line %d\n",__FILE__, __LINE__); \
        eoc(1);\
        while(1);\
    }\
}

#define traceMALLOC(addr,size) \
{\
    printf("[Malloc] Allocated heap at 0x%x (size %d)\n", addr, size,0,0); \
}

#define traceFREE(addr,size) \
{\
    printf("[FREE] Free of 0x%x (block size %d)\n", addr, size,0,0); \
}

/*
 * --------------------------------------------------------------
 * Malloc API
 * --------------------------------------------------------------
 */
void *sram_malloc(unsigned int size)  __attribute__ ((deprecated));
void sram_free(void *ptr)  __attribute__ ((deprecated));

void *l1malloc(unsigned int size);
void l1free(void *ptr);

void *scml1malloc(unsigned int size);
void scml1free(void *ptr);

void *l2malloc(unsigned int size);
void l2free(void *ptr);

/*Default allocation (l1 sram)*/
void *malloc(size_t __size);
/*Default free (auto-tuned) */
void free(void *ptr);

void mem_init();

#endif
