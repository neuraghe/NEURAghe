/* Copyright 2014 DEI - Universita' di Bologna
   author       DEI - Universita' di Bologna
                Alessandro Capotondi - alessandro.capotondi@unibo.it
   info         Simple Malloc based on FREERTOS Heap_4.c mode */

#ifndef __HEAP_4_H__
#define __HEAP_4_H__

#include <stdlib.h>
#include <stdio.h>

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

} heap_desc_t;

/*
 * --------------------------------------------------------------
 * Configuration
 * --------------------------------------------------------------
 */

/* Assumes 8bit bytes! */
#define heapBITS_PER_BYTE                       ( ( unsigned int ) 8 )

#define portBYTE_ALIGNMENT                      ( 256)
#define portBYTE_ALIGNMENT_MASK                 ( ( unsigned long int ) 0x00000000FF )
#define portPOINTER_SIZE_TYPE                   ( int * )

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
#define xBlockAllocatedBit(heap)                      (heap->xBlockAllocatedBit)

#define vTaskSuspendAll(heap) {;}
#define xTaskResumeAll(heap)  {;}

#define configASSERT(x) \
{\
    if( ! (x)) {\
      printf("[heap_4] Error: assert failed at file %s line %d\n",__FILE__, __LINE__); \
        exit(1);\
    }\
}

void __init(heap_desc_t *heap, unsigned char *heap_ptr, unsigned int heap_size );
void *__malloc(heap_desc_t *heap, unsigned int xWantedSize, unsigned int thread_safe);
void __free(heap_desc_t *heap, void *pv );

#endif
