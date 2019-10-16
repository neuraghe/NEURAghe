#ifndef __LIBNEUMEM_H__
#define __LIBNEUMEM_H__

#include "heap_4.h"

extern heap_desc_t neul2heap;
extern heap_desc_t neuDDRheap;

static inline void *neu_l2malloc(unsigned int size) {
	return __malloc( &neul2heap, size, 0 );
}

static inline void neu_l2free(void *ptr) {
    __free(&neul2heap, ptr);
	return;
}

static inline void *neu_DDRmalloc(unsigned int size) {
    return __malloc( &neuDDRheap, size, 0 );
}

static inline void neu_DDRfree(void *ptr) {
    __free(&neuDDRheap, ptr);
    return;
}

static inline void neu_l2init(void *heapPtr, unsigned int heapSize) {
    __init(&neul2heap, (unsigned char *) heapPtr, heapSize);
    return;
}

static inline void neu_DDRinit(void *heapPtr, unsigned int heapSize) {
    __init(&neuDDRheap, (unsigned char *) heapPtr, heapSize);
    return;
}

#endif