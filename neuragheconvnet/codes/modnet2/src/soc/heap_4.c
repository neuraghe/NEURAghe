/*
 *    FreeRTOS V8.1.2 - Copyright (C) 2014 Real Time Engineers Ltd.
 *    All rights reserved
 * 
 *    VISIT http://www.FreeRTOS.org TO ENSURE YOU ARE USING THE LATEST VERSION.
 * 
 ***************************************************************************
 *                                                                       *
 *    FreeRTOS provides completely free yet professionally developed,    *
 *    robust, strictly quality controlled, supported, and cross          *
 *    platform software that has become a de facto standard.             *
 *                                                                       *
 *    Help yourself get started quickly and support the FreeRTOS         *
 *    project by purchasing a FreeRTOS tutorial book, reference          *
 *    manual, or both from: http://www.FreeRTOS.org/Documentation        *
 *                                                                       *
 *    Thank you!                                                         *
 *                                                                       *
 ***************************************************************************
 * 
 *    This file is part of the FreeRTOS distribution.
 * 
 *    FreeRTOS is free software; you can redistribute it and/or modify it under
 *    the terms of the GNU General Public License (version 2) as published by the
 *    Free Software Foundation >>!AND MODIFIED BY!<< the FreeRTOS exception.
 * 
 *    >>!   NOTE: The modification to the GPL is included to allow you to     !<<
 *    >>!   distribute a combined work that includes FreeRTOS without being   !<<
 *    >>!   obliged to provide the source code for proprietary components     !<<
 *    >>!   outside of the FreeRTOS kernel.                                   !<<
 * 
 *    FreeRTOS is distributed in the hope that it will be useful, but WITHOUT ANY
 *    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 *    FOR A PARTICULAR PURPOSE.  Full license text is available from the following
 *    link: http://www.freertos.org/a00114.html
 * 
 *    1 tab == 4 spaces!
 * 
 ***************************************************************************
 *                                                                       *
 *    Having a problem?  Start by reading the FAQ "My application does   *
 *    not run, what could be wrong?"                                     *
 *                                                                       *
 *    http://www.FreeRTOS.org/FAQHelp.html                               *
 *                                                                       *
 ***************************************************************************
 * 
 *    http://www.FreeRTOS.org - Documentation, books, training, latest versions,
 *    license and Real Time Engineers Ltd. contact details.
 * 
 *    http://www.FreeRTOS.org/plus - A selection of FreeRTOS ecosystem products,
 *    including FreeRTOS+Trace - an indispensable productivity tool, a DOS
 *    compatible FAT file system, and our tiny thread aware UDP/IP stack.
 * 
 *    http://www.OpenRTOS.com - Real Time Engineers ltd license FreeRTOS to High
 *    Integrity Systems to sell under the OpenRTOS brand.  Low cost OpenRTOS
 *    licenses offer ticketed support, indemnification and middleware.
 * 
 *    http://www.SafeRTOS.com - High Integrity Systems also provide a safety
 *    engineered and independently SIL3 certified version for use in safety and
 *    mission critical applications that require provable dependability.
 * 
 *    1 tab == 4 spaces!
 */

/* Contribution 2014 DEI - Universita' di Bologna
 *   author       DEI - Universita' di Bologna
 *               Alessandro Capotondi - alessandro.capotondi@unibo.it
 */

/*
 * A sample implementation of malloc() and free() that combines
 * (coalescences) adjacent memory blocks as they are freed, and in so doing
 * limits memory fragmentation.
 *
 * See heap_1.c, heap_2.c and heap_3.c for alternative implementations, and the
 * memory management pages of http://www.FreeRTOS.org for more information.
 */

#include "heap_4.h"

/*
 * Inserts a block of memory that is being freed into the correct position in
 * the list of free memory blocks.  The block being freed will be merged with
 * the block in front it and/or the block behind it if the memory blocks are
 * adjacent to each other.
 */
static inline void prvInsertBlockIntoFreeList( heap_desc_t *heap, BlockLink_t *pxBlockToInsert );

/*-----------------------------------------------------------*/

void *__malloc(heap_desc_t *heap, unsigned int xWantedSize, unsigned int thread_safe)
{
    BlockLink_t *pxBlock, *pxPreviousBlock, *pxNewBlockLink;
    void *pvReturn = NULL;
    
    if(thread_safe)
        vTaskSuspendAll(heap);
    
    {
        
        /* Check the requested block size is not so large that the top bit is
         *        set.  The top bit of the block size member of the BlockLink_t structure
         *        is used to determine who owns the block - the application or the
         *        kernel, so it must be free. */
        if( ( xWantedSize & xBlockAllocatedBit(heap) ) == 0 )
        {                    
            /* The wanted size is increased so it can contain a BlockLink_t
             *            structure in addition to the requested amount of bytes. */
            if( xWantedSize > 0 )
            {
                xWantedSize += xHeapStructSize;
                
                /* Ensure that blocks are always aligned to the required number
                 *                of bytes. */
                if( ( xWantedSize & portBYTE_ALIGNMENT_MASK ) != 0x00 )
                {
                    /* Byte alignment required. */
                    xWantedSize += ( portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK ) );
                    configASSERT( ( xWantedSize & portBYTE_ALIGNMENT_MASK ) == 0 );
                }
            }
            
            if( ( xWantedSize > 0 ) && ( xWantedSize <= xFreeBytesRemaining(heap) ) )
            {
                /* Traverse the list from the start (lowest address) block until
                 *                one of adequate size is found. */
                pxPreviousBlock = &xStart(heap);
                pxBlock = xStart(heap).pxNextFreeBlock;
                while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
                {
                    pxPreviousBlock = pxBlock;
                    pxBlock = pxBlock->pxNextFreeBlock;
                }
                
                /* If the end marker was reached then a block of adequate size
                 *                was not found. */
                if( pxBlock != pxEnd(heap) )
                {
                    /* Return the memory space pointed to - jumping over the
                     *                    BlockLink_t structure at its start. */
                    pvReturn = ( void * ) ( ( ( unsigned char * ) pxPreviousBlock->pxNextFreeBlock ) + xHeapStructSize );
                    
                    /* This block is being returned for use so must be taken out
                     *                    of the list of free blocks. */
                    pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
                    
                    /* If the block is larger than required it can be split into
                     *                    two. */
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
                    {
                        /* This block is to be split into two.  Create a new
                         *                        block following the number of bytes requested. The void
                         *                        cast is used to prevent byte alignment warnings from the
                         *                        compiler. */
                        pxNewBlockLink = ( void * ) ( ( ( unsigned char * ) pxBlock ) + xWantedSize );
                        configASSERT( ( ( ( unsigned int ) pxNewBlockLink ) & portBYTE_ALIGNMENT_MASK ) == 0 );
                        
                        /* Calculate the sizes of two blocks split from the
                         *                        single block. */
                        pxNewBlockLink->xBlockSize = pxBlock->xBlockSize - xWantedSize;
                        pxBlock->xBlockSize = xWantedSize;
                        
                        /* Insert the new block into the list of free blocks. */
                        prvInsertBlockIntoFreeList(heap,  ( pxNewBlockLink ) );
                    }
                    
                    xFreeBytesRemaining(heap) -= pxBlock->xBlockSize;
                    
                    if( xFreeBytesRemaining(heap) < xMinimumEverFreeBytesRemaining(heap) )
                    {
                        xMinimumEverFreeBytesRemaining(heap) = xFreeBytesRemaining(heap);
                    }
                    
                    /* The block is being returned - it is allocated and owned
                     *                    by the application and has no "next" block. */
                    pxBlock->xBlockSize |= xBlockAllocatedBit(heap);
                    pxBlock->pxNextFreeBlock = NULL;
                }
            }
        }
    }
    
    if(thread_safe)
        xTaskResumeAll(heap);
    
    configASSERT(pvReturn != NULL);
    configASSERT( ( ( ( unsigned int ) pvReturn ) & portBYTE_ALIGNMENT_MASK ) == 0 );
    
    return pvReturn;
}
/*-----------------------------------------------------------*/

void __free(heap_desc_t *heap, void *pv )
{
    unsigned char *puc = ( unsigned char * ) pv;
    BlockLink_t *pxLink;
    
    if( pv != NULL )
    {
        /* The memory being freed will have an BlockLink_t structure immediately
         *        before it. */
        puc -= xHeapStructSize;
        
        /* This casting is to keep the compiler from issuing warnings. */
        pxLink = ( void * ) puc;
        
        /* Check the block is actually allocated. */
        configASSERT( ( pxLink->xBlockSize & xBlockAllocatedBit(heap) ) != 0 );
        configASSERT( pxLink->pxNextFreeBlock == NULL );
        
        if( ( pxLink->xBlockSize & xBlockAllocatedBit(heap) ) != 0 )
        {
            if( pxLink->pxNextFreeBlock == NULL )
            {
                /* The block is being returned to the heap - it is no longer
                 *                allocated. */
                pxLink->xBlockSize &= ~xBlockAllocatedBit(heap);
                
                vTaskSuspendAll(heap);
                {
                    /* Add this block to the list of free blocks. */
                    xFreeBytesRemaining(heap) += pxLink->xBlockSize;
                    prvInsertBlockIntoFreeList(heap,  ( ( BlockLink_t * ) pxLink ) );
                }
                xTaskResumeAll(heap);
            }
        }
    }
}

/*-----------------------------------------------------------*/

void __init(heap_desc_t *heap, unsigned char *heap_ptr, unsigned int heap_size )
{
    BlockLink_t *pxFirstFreeBlock;
    unsigned char *pucAlignedHeap;
    unsigned long int ulAddress;
    unsigned int xTotalHeapSize = heap_size;
    
    /* Init Global Variables */
    pxEnd(heap) = NULL;
    xFreeBytesRemaining(heap) = 0U;
    xMinimumEverFreeBytesRemaining(heap) = 0U;
    xBlockAllocatedBit(heap) = 0U;
    
    
    /* Ensure the heap starts on a correctly aligned boundary. */
    ulAddress = ( unsigned long int ) heap_ptr;

    
    if( ( ulAddress & portBYTE_ALIGNMENT_MASK ) != 0 )
    {
        ulAddress += ( portBYTE_ALIGNMENT - 1 );
        ulAddress &= ~portBYTE_ALIGNMENT_MASK;

        xTotalHeapSize -= ulAddress - ( unsigned long int ) heap_ptr;
    }
    
    pucAlignedHeap = ( unsigned char * ) ulAddress;
    
    /* xStart(heap) is used to hold a pointer to the first item in the list of free
     *    blocks.  The void cast is used to prevent compiler warnings. */
    xStart(heap).pxNextFreeBlock = ( void * ) pucAlignedHeap;
    xStart(heap).xBlockSize = ( unsigned int ) 0;
    
    /* pxEnd(heap) is used to mark the end of the list of free blocks and is inserted
     *    at the end of the heap space. */
    ulAddress = ( ( unsigned long int ) pucAlignedHeap ) + xTotalHeapSize;

    ulAddress -= xHeapStructSize;
    ulAddress &= ~portBYTE_ALIGNMENT_MASK;
    pxEnd(heap) = ( void * ) ulAddress;
    pxEnd(heap)->xBlockSize = 0;
    pxEnd(heap)->pxNextFreeBlock = NULL;
    
    /* To start with there is a single free block that is sized to take up the
     *    entire heap space, minus the space taken by pxEnd(heap). */
    pxFirstFreeBlock = ( void * ) pucAlignedHeap;
    pxFirstFreeBlock->xBlockSize = ulAddress - ( unsigned long int ) pxFirstFreeBlock;
    pxFirstFreeBlock->pxNextFreeBlock = pxEnd(heap);
    
    /* Only one block exists - and it covers the entire usable heap space. */
    xMinimumEverFreeBytesRemaining(heap) = pxFirstFreeBlock->xBlockSize;
    xFreeBytesRemaining(heap) = pxFirstFreeBlock->xBlockSize;
    
    /* Work out the position of the top bit in a unsigned int variable. */
    xBlockAllocatedBit(heap) = ( ( unsigned int ) 1 ) << ( ( sizeof( unsigned int ) * heapBITS_PER_BYTE ) - 1 );
}
/*-----------------------------------------------------------*/

static inline void prvInsertBlockIntoFreeList( heap_desc_t *heap, BlockLink_t *pxBlockToInsert )
{
    BlockLink_t *pxIterator;
    unsigned char *puc;
    
    /* Iterate through the list until a block is found that has a higher address
     *    than the block being inserted. */
    for( pxIterator = &xStart(heap); pxIterator->pxNextFreeBlock < pxBlockToInsert; pxIterator = pxIterator->pxNextFreeBlock )
    {
        /* Nothing to do here, just iterate to the right position. */
    }
    
    /* Do the block being inserted, and the block it is being inserted after
     *    make a contiguous block of memory? */
    puc = ( unsigned char * ) pxIterator;
    if( ( puc + pxIterator->xBlockSize ) == ( unsigned char * ) pxBlockToInsert )
    {
        pxIterator->xBlockSize += pxBlockToInsert->xBlockSize;
        pxBlockToInsert = pxIterator;
    }
    
    /* Do the block being inserted, and the block it is being inserted before
     *    make a contiguous block of memory? */
    puc = ( unsigned char * ) pxBlockToInsert;
    if( ( puc + pxBlockToInsert->xBlockSize ) == ( unsigned char * ) pxIterator->pxNextFreeBlock )
    {
        if( pxIterator->pxNextFreeBlock != pxEnd(heap) )
        {
            /* Form one big block from the two blocks. */
            pxBlockToInsert->xBlockSize += pxIterator->pxNextFreeBlock->xBlockSize;
            pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock->pxNextFreeBlock;
        }
        else
        {
            pxBlockToInsert->pxNextFreeBlock = pxEnd(heap);
        }
    }
    else
    {
        pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock;
    }
    
    /* If the block being inserted plugged a gab, so was merged with the block
     *    before and the block after, then it's pxNextFreeBlock pointer will have
     *    already been set, and should not be set here as that would make it point
     *    to itself. */
    if( pxIterator != pxBlockToInsert )
    {
        pxIterator->pxNextFreeBlock = pxBlockToInsert;
    }
}
