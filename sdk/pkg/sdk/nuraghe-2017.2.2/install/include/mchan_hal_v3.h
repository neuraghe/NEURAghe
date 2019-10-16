#include "pulp.h"


#ifndef MCHAN_HAL_H
#define MCHAN_HAL_H

#include "archi/pulp.h"

#define DMADEBUG

#if MCHAN_VERSION >= 5
#error MCHAN version above 5 is not supported
#endif

#define round32(N) (N + (4-N%4))
#define round64(N) (N + (8-N%8))

/* 
 * mchan_memcpy[_async]
 *   dst  : pointer to destination base
 *   src  : pointer to source base
 *   size : transfer size in bytes
 */

#ifdef DMADEBUG
unsigned int memcpy_count;
#define DMADEBUG_LIMIT 1
#endif

static void mchan_memcpy_async(void *dst, void *src, unsigned int size) {

  char type = ((unsigned int)dst >= L2_MEM_BASE_ADDR) ? 0 : 1;
   unsigned int i=0, j=0, bytes_int=0, bytes_count=0;
   int mis_src = 0, mis_dst = 0;

   volatile unsigned int dst_int;
   volatile unsigned int src_int;
   volatile unsigned int size_int;
#ifdef DMADEBUG
   unsigned int dst_save_0;
   unsigned int dst_save_1;
   unsigned int tmp_datum_src_0;
   unsigned int tmp_datum_src_1;
#endif

   // check misaligned addresses
   src_int  = (unsigned) src;
   dst_int  = (unsigned) dst;
   size_int = (unsigned) size;

   if(size_int <= 8) {
      for(i=0; i<size_int; i++) {
         *(unsigned char *) (dst_int+i) = *(unsigned char *) (src_int+i);
      }
#ifdef DMADEBUG
      if(memcpy_count < DMADEBUG_LIMIT) {
         #pragma omp master
         {
            volatile int sumdst=0, sumsrc=0;
            for(j=0; j<size_int; j++) {
               sumdst += ((char *)((unsigned) dst_int))[j];
               sumsrc += ((char *)((unsigned) src_int))[j];
            }
            printf("[MCHAN] transfer checksum dst=%d src=%d\n", sumdst, sumsrc);
         }
      }
#endif
      return;
   }

   if((unsigned int)src >= L2_MEM_BASE_ADDR) {
      if(src_int % 8) {
         // set flag
         mis_src = src_int % 8;
         // move bases forward and reduce size
         src_int  = src_int - mis_src + 8;
         dst_int  = dst_int - mis_src + 8;
         size_int = size_int - 8 + mis_src;
         // printf("src_int (%08x) - mis_src (%08x) + 8 = %08x\n", src, mis_src, src_int);
#ifdef DMADEBUG
         // load manually word before src base
         tmp_datum_src_0 = *(unsigned *)(src_int - 8);
         tmp_datum_src_1 = *(unsigned *)(src_int - 4);
         // save dst word at dst end
         dst_save_0 = *((unsigned int *) (dst_int-8));
         dst_save_1 = *((unsigned int *) (dst_int-4));
#endif
      }
   }
   else if((unsigned int)dst >= L2_MEM_BASE_ADDR) {
      if(dst_int % 8) {
         // set flag
         mis_dst = dst_int % 8;
         // move bases forward and reduce size
         src_int  = src_int - mis_dst + 8;
         dst_int  = dst_int - mis_dst + 8;
         size_int = size_int - 8 + mis_dst;
      }
#ifdef DMADEBUG
      if(memcpy_count < DMADEBUG_LIMIT) {
         printf("[MCHAN] mis_dst=%d, src_int=%08x, dst_int=%08x, size_int=%08x\n", mis_dst, src_int, dst_int, size_int);
      }
#endif
   }

   bytes_int = size_int;
   bytes_count = 0;

#ifdef DMADEBUG
   if(memcpy_count < DMADEBUG_LIMIT) { 
      #pragma omp master
      {
         printf("[MCHAN] orig dst=%08x src=%08x size=%d type=%d\n", dst, src, size, type);
         printf("[MCHAN] copy dst=%08x src=%08x size=%d type=%d\n", dst_int, src_int, size_int, type);
      }
   }
#endif
#ifdef DMADEBUG
   if(memcpy_count < DMADEBUG_LIMIT) {
      #pragma omp master
      {
         if(dst >= L2_MEM_BASE_ADDR){
            printf("[MCHAN] orig dst=%08x src=%08x size=%d type=%d\n", dst, src, size, type);
            printf("[MCHAN] copy dst=%08x src=%08x size=%d type=%d\n", dst_int, src_int, size_int, type);
         }
      }
   }
#endif
 
   // greedy MCHAN copy
   i=0;
   while (bytes_int>0) {
      unsigned int bytes_mchan;
      bytes_mchan = (bytes_int < 8)     ? bytes_int :
                    (bytes_int < 16)    ? 8 :
                    (bytes_int < 32)    ? 16 :
                    (bytes_int < 64)    ? 32 :
                    (bytes_int < 128)   ? 64 :
                    (bytes_int < 256)   ? 128 :
                    (bytes_int < 512)   ? 256 :
	            (bytes_int < 1024)  ? 512 : 1024;
      //(bytes_int < 2048)  ? 1024 :
      //            (bytes_int < 4096)  ? 2048 :
      //            (bytes_int < 8192)  ? 4096 :
      //            (bytes_int < 16384) ? 8192 :
      //                                  16384;
      bytes_int -= bytes_mchan;
#ifdef DMADEBUG
      if(memcpy_count < DMADEBUG_LIMIT) {
         #pragma omp master
         {
            printf("[MCHAN] transferring %d bytes.\n", bytes_mchan);
         }
      }
#endif
      i++;
      if(bytes_mchan >= 8) {
        volatile int kk;
         int flag = 0;
         if(type) { // src in L2
            set_tcdm_addr(((unsigned) dst_int) + bytes_count);
            set_ext_addr (((unsigned) src_int) + bytes_count);
            push_cmd(bytes_mchan | (type << 15));
         }
         else { // dst in L2
            set_tcdm_addr(((unsigned) src_int) + bytes_count);
            set_ext_addr (((unsigned) dst_int) + bytes_count);
            push_cmd(bytes_mchan | (type << 15));    
         }
#ifdef DMADEBUG
         if(memcpy_count < DMADEBUG_LIMIT) {
            #pragma omp master
            {
               volatile int sumdst=0, sumsrc=0;
               for(j=0; j<bytes_mchan; j++) {
                  sumdst += ((char *)(((unsigned) dst_int) + bytes_count))[j];
                  sumsrc += ((char *)(((unsigned) src_int) + bytes_count))[j];
               }
               printf("[MCHAN] transfer checksum dst=%d src=%d\n", sumdst, sumsrc);
            }
         }
#endif
      }
      else {
         for(j=0; j<bytes_mchan; j++) {
            ((char *) ((unsigned) dst_int + bytes_count)) [j] = ((char *) ((unsigned) src_int + bytes_count)) [j];
         }
#ifdef DMADEBUG
         if(memcpy_count < DMADEBUG_LIMIT) {
            #pragma omp master
            {
               volatile int sumdst=0, sumsrc=0;
               for(j=0; j<bytes_mchan; j++) {
                  sumdst += ((char *)(((unsigned) dst_int) + bytes_count))[j];
                  sumsrc += ((char *)(((unsigned) src_int) + bytes_count))[j];
               }
               printf("[MCHAN] transfer checksum dst=%d src=%d\n", sumdst, sumsrc);
            }
         }
#endif
      }
      bytes_count += bytes_mchan;
   }

   // misaligned cases - this is probably endianness-dependent
   if(mis_src != 0) {
      for(i=0; i<src_int-((unsigned)src); i++) {
         *(unsigned char *) (((unsigned)dst)+i) = *(unsigned char *) (((unsigned)src)+i);
      }
#ifdef DMADEBUG
      if(memcpy_count < DMADEBUG_LIMIT) {
         printf("[MCHAN] L2 misalignment handling: mis_src=%d, *(dst_int-8)=%08x, *(dst_int-4)=%08x\n", mis_src, *(unsigned *) (dst_int-8), *(unsigned *) (dst_int-4));
         printf("[MCHAN] L2 misalignment handling: dst_save_0=%08x, dst_save_1=%08x, tmp_datum_src_0=%08x, tmp_datum_src_1=%08x\n", dst_save_0, dst_save_1, tmp_datum_src_0, tmp_datum_src_1);
      }
#endif
   }
   memcpy_count++;
}

static inline void mchan_memcpy_wait() {
   dma_barrier();
}

static inline void mchan_memcpy(void *dst, void *src, unsigned int size) {
   mchan_memcpy_async(dst, src, size);
   mchan_memcpy_wait();
}

#endif /* MCHAN_HAL_H */

