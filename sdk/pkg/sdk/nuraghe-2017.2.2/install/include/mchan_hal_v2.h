#include "mchan.h"

#define round32(N) (N + (4-N%4))
#define round64(N) (N + (8-N%8))

extern unsigned memcpy_wait_global[4];
extern unsigned *memcpy_buffer;

// #define DMADEBUG

/* 
 * mchan_memcpy(_async)
 *   dst  : pointer to SUGGESTED destination base
 *   src  : pointer to source base
 *   size : transfer size in bytes
 */
void mchan_memcpy_async(
   void *dst,
   void *src,
   unsigned int size
);

static inline void mchan_memcpy_wait() {
   if(memcpy_wait_global[get_core_id()]) {
      dma_barrier();
      memcpy_wait_global[get_core_id()] = 0;
   }
}

static inline void mchan_memcpy(
   void *dst,
   void *src,
   unsigned int size
) {
   mchan_memcpy_async(dst, src, size);
   mchan_memcpy_wait();
}

static inline void mchan_memcpy_init() {
   memcpy_buffer = (unsigned *) malloc(sizeof(char)*(1024+8));
}

static inline void mchan_memcpy_deinit() {
   free(memcpy_buffer);
}
