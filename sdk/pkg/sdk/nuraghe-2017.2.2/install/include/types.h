/* 
 * types.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2015 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */

#ifndef TYPES_H
#define TYPES_H

#ifdef CCN_X86
  #include <stdint.h>
#endif

extern unsigned int dmaId;

// Available targets:
// CCN_PULP      -> PULP platform with OpenMP support
// CCN_PULP_HWCE -> PULP + Hardware Convolution Engine
// CCN_X86       -> x86 workstation
// CCN_ARM       -> ARM Cortex-A class SoC
// CCN_MCU       -> ARM Cortex-M class microcontroller

#ifdef CCN_X86
   // #define CCN_CACHE
   #define FAKEDMA
   // #define CCN_TILING
   // #define CCN_DOUBLEBUF
#endif

#ifdef CCN_ARM
   #define CCN_CACHE
   #define FAKEDMA
#endif

#ifdef CCN_MCU
   #define CCN_CACHE
   #define CCN_NOALLOC
   #define FAKEDMA
#endif

#ifdef CCN_PULP_HWCE
   #define CCN_HWCE_ACCEL
   #define CCN_PULP
#endif

#ifdef CCN_PULP
   #include "hal/pulp.h"
   #include "perf.h"
   #ifndef MCHAN_HAL_H
#if MCHAN_VERSION == 2
   #include "mchan_hal_v2.h"
#elif MCHAN_VERSION == 3
   #include "mchan_hal_v3.h"
#endif
   #endif
   #define CCN_TILING
   #define CCN_DOUBLEBUF
#endif

#ifdef CCN_TILING
   // choose between general tiling or tiling with some contiguousness constraints
   #define CCN_TILING_3D
   // #define CCN_TILING_2D
   // #define CCN_TILING_1D
   // choose between a tiling implementation favoring execution time or memory occupation
   #define CCN_TILING_LESSTIME
   // #define CCN_TILING_LESSMEM
#endif

// activation types
#define ACTIVATION_NONE 0
#define ACTIVATION_TANH 1
#define ACTIVATION_RELU 2
#define ACTIVATION_SOFTMAX 3

// parallelization types
#define PARALLEL_PIXEL 0
#define PARALLEL_FEAT  1
#define PARALLEL_HWCE  2

// threads
#define THREAD_FE 1
#define THREAD_EX 0
#define THREAD_WB 2

// utility to round to the upper multiple of X
#define MULTIPLE2(x) ( (x % 2) ? (x - (x % 2) + 2) : (x) )
#define MULTIPLE4(x) ( (x % 4) ? (x - (x % 4) + 4) : (x) )
#define MULTIPLE8(x) ( (x % 8) ? (x - (x % 8) + 8) : (x) )

#if N_CORES >= 4
  #define N_CORES_PRAGMA 4
#else
  #define N_CORES_PRAGMA N_CORES
#endif
  #define CONV16_UNROLLED_PTR

typedef signed short int int16_t;

// if FULL_PRECISION is defined, CConvNet will accumulate on 32bit fixed points
#define FULL_PRECISION

// if FIXED_CONVNET is defined, CConvNet will work on fixed-point types
#define FIXED_CONVNET

#ifdef FIXED_CONVNET
   // the underlying data type for fixed-point CConvNet
   typedef int16_t data_t;
   // number of bits in the fractional part of the fixed-point data_t
   #define QF 13
   // max of data_t
   #define DATA_T_MAX 0x7fff
   // useful operations
   #define FIXED2FLOAT(a) (((float) a) / pow(2,QF))
   #define FLOAT2FIXED(a) ((data_t) floor(a * pow(2,QF)))
#else
   // the underlying data type for floating-point CConvNet
   typedef float data_t;
   // max of data_t (or rather, a big number)
   #define DATA_T_MAX 1000.0
   #define FAST_TANH
   // undefine float/fixed conversions
   #define FIXED2FLOAT(a) a
   #define FLOAT2FIXED(a) a
#endif

static inline void *ccn_malloc(int size) {
   return malloc(size);
}

static inline void ccn_free(void *ptr) {
   free(ptr);
}

static inline void ccn_memcpy_async(void *dst, void *src, int size) {
   int i;
// #ifdef CHECKDMA
//      volatile unsigned value;
//      volatile unsigned *pValue;
//      asm volatile ("l.sw %0, r9" : "=m" (*pValue));
// #endif
#ifndef NODMA
#ifdef FAKEDMA
   for(i=0; i<size/4; i++) {
      ((unsigned *) dst) [i] = ((unsigned *) src) [i];
   }
   for(i=size-size%4; i<size; i++) {
      ((char *) dst) [i] = ((char *) src) [i];
   }
#else /* ~FAKEDMA */
#if MCHAN_VERSION <= 3
   mchan_memcpy_async(dst, src, size);
#else /* MCHAN_VERSION > 3 */
   if ((unsigned int)dst >= L2_MEM_BASE_ADDR)
     dmaId = pulp_dma_memcpy(pulp_dma_base(), dst, src, 1, size);
   else
     dmaId = pulp_dma_memcpy(pulp_dma_base(), src, dst, 0, size);
#endif /* MCHAN_VERSION > 3 */
#endif /* ~FAKEDMA */
#ifdef CHECKDMA
   pulp_dma_wait(pulp_dma_base(), dmaId);
   if(
     (((unsigned)dst & 0x7) != ((unsigned)src & 0x7)) ||
     (((unsigned)dst & 0x7) && ((unsigned)dst >= L2_MEM_BASE_ADDR)) ||
     (((unsigned)src & 0x7) && ((unsigned)src >= L2_MEM_BASE_ADDR)) 
   ) {
     printf("[memcpy] @%08x->@%08x misaligned transfer\n", src, dst);
   }
   int sumdst=0, sumsrc=0;
   volatile int j;
   // #pragma omp master
   for(j=0; j<size; j++) {
      sumdst += ((char *) dst) [j];
      sumsrc += ((char *) src) [j];
   }
   // #pragma omp barrier
   // #pragma omp master
   if(sumsrc != sumdst)
      printf("[memcpy] @%08x->@%08x divergent sum: src=%08x dst=%08x\n", src, dst, sumsrc, sumdst);
   // #pragma omp barrier
#endif
#endif
}

static inline void ccn_memcpy_async_2d(
   void *dst,
   void *src,
   int size_1,
   int size_0, // includes also sizeof(data)
   int dst_stride_1,
   int src_stride_1
) {
#if MCHAN_VERSION >= 5
   if ((unsigned int)dst >= L2_MEM_BASE_ADDR) {
      dmaId = pulp_dma_memcpy_2d(
         pulp_dma_base(),
         dst, src, 1, 
         size_1*size_0,
         dst_stride_1,
         size_0
      );
   }
   else {
      dmaId = pulp_dma_memcpy_2d(
         pulp_dma_base(),
         src, dst, 0, 
         size_1*size_0,
         src_stride_1,
         size_0
      );
     }
#else
   int cl=0, cr=0;
   for(cl=0,cr=0; cl<size_1*dst_stride_1; cl+=dst_stride_1,cr+=src_stride_1) {
      ccn_memcpy_async(((unsigned) dst)+cl, ((unsigned) src)+cr, size_0);
   }
#endif
}

static inline void ccn_memcpy_async_3d(
   void *dst,
   void *src,
   int size_2,
   int size_1,
   int size_0, // includes also sizeof(data)
   int local_stride_2,
   int local_stride_1,
   int remote_stride_2,
   int remote_stride_1
) {
   int bl=0, cl=0, br=0, cr=0;
   for(bl=0,br=0; bl<size_2*local_stride_2*local_stride_1; bl+=local_stride_2*local_stride_1,br+=remote_stride_2*remote_stride_1) {
#if 1
      ccn_memcpy_async_2d(((unsigned) dst) + bl, ((unsigned) src) + br, size_1, size_0, local_stride_1, remote_stride_1);
#else
      for(cl=0,cr=0; cl<size_1*local_stride_1; cl+=local_stride_1,cr+=remote_stride_1) {
         ccn_memcpy_async(((unsigned) dst)+(bl+cl), ((unsigned) src)+(br+cr), size_0);
      }
#endif
   }
}

#define ABS(x)   ( (x<0) ? (-x) : x )
#define MIN(x,y) ( (x<y) ? x : y )

static char * fixed2string(
   signed short int x,
   unsigned int qf,
   unsigned int nb_frac_digits
) {
   int i,j;
   unsigned int nb_integer_digits;
   unsigned int nb_fractional_digits;
   char *s;
   unsigned int sign  = 0;
   unsigned int integer    = 0;
   float fractional = 0.0;
   unsigned int integer_bcd[15]; // max precision of 15 digits
   unsigned int fractional_bcd[16]; // max precision of 16 digits
   // 0) consider sign
   sign = (x<0) ? 1 : 0;
   // 1) integer part is just x shifted by qf bits
   integer = ABS(x) >> qf;
   // 2) fractional part is the rest
   fractional = ((float) (ABS(x) - (integer << qf))) / (1 << qf);
   // printf("%d %d %d\n", ABS(x), integer, ABS(x)-(integer << qf));
   // 3) convert integer to BCD
   for(i=0; i<15; i++) {
      integer_bcd[i] = integer % 10;
      // printf("    int=%d, int_bcd[%d]=%d\n", integer, i, integer_bcd[i]);
      integer = integer / 10;
      if (integer == 0) {
         nb_integer_digits = i+1;
         break;
      }
   }
   // 4) convert fractional to BCD
   for(i=0; i<16; i++) {
      fractional_bcd[i] = (unsigned) (fractional * 10);
      // printf("    frac_bcd[%d]=%d, %d\n", i, fractional_bcd[i], (unsigned) (fractional));
      fractional = (fractional * 10) - fractional_bcd[i];
      if (fractional == 0) {
         nb_fractional_digits = i+1;
         break;
      }
   }
   // printf("nb_fractional_digits=%d, nb_integer_digits=%d\n", nb_fractional_digits, nb_integer_digits);
   // 5) print to char
   s = (char *) malloc(sizeof(char *)*32);
   if(sign)
      s[0] = '-';
   for(j=nb_integer_digits-1,i=sign; j>=0; j--,i++) {
      s[i] = ((char) integer_bcd[j]) + 48;
      // printf("  j:%d, i:%d, s[i]: %c\n", j, i, s[i]);
   }
   s[nb_integer_digits+sign] = '.';
   for(j=0,i=nb_integer_digits+sign+1; j<MIN(nb_fractional_digits, nb_frac_digits); j++,i++) {
      s[i] = ((char) fractional_bcd[j]) + 48;
      // printf("  j:%d, i:%d, s[i]: %c\n", j, i, s[i]);
   }
   s[nb_integer_digits+sign+MIN(nb_fractional_digits, nb_frac_digits)+1] = '\0';
   return s;
}

static void __attribute__((noinline)) ccn_memcpy(void *dst, void *src, int size) {
   int i;
#ifndef NODMA
#ifdef FAKEDMA
   for(i=0; i<size; i++) {
      ((char *) dst) [i] = ((char *) src) [i];
   }
#else
#if MCHAN_VERSION <= 3
   mchan_memcpy(dst, src, size);
#else
   if ((unsigned int)dst >= L2_MEM_BASE_ADDR)
     pulp_dma_wait(pulp_dma_base(), pulp_dma_memcpy(pulp_dma_base(), dst, src, 1, size));
   else
     pulp_dma_wait(pulp_dma_base(), pulp_dma_memcpy(pulp_dma_base(), src, dst, 0, size));
#endif
#endif
#ifdef CHECKDMA
   if(
     (((unsigned)dst & 0x7) != ((unsigned)src & 0x7)) ||
     (((unsigned)dst & 0x7)) || // && ((unsigned)dst >= L2_MEM_BASE_ADDR)) ||
     (((unsigned)src & 0x7))  // && ((unsigned)src >= L2_MEM_BASE_ADDR)) 
   ) {
     printf("[memcpy] @%08x->@%08x misaligned transfer\n", src, dst);
   }
   int sumdst=0, sumsrc=0;
   volatile int j;
   // #pragma omp master
   for(j=0; j<size; j++) {
      sumdst += ((char *) dst) [j];
      sumsrc += ((char *) src) [j];
   }
   // #pragma omp barrier
   // #pragma omp master
   if(sumsrc != sumdst)
      printf("[memcpy] @%08x->@%08x divergent sum: src=%08x dst=%08x\n", src, dst, sumsrc, sumdst);
   // #pragma omp barrier
#endif
#endif
}

static inline void fake_memcpy(void *dst, void *src, int size) {
   int i;
   for(i=0; i<size; i++) {
      ((char *) dst) [i] = ((char *) src) [i];
   }
   unsigned *dst_int = ((unsigned)dst)-(((unsigned)dst)%8);
#ifdef CHECKDMA
   int sumdst=0, sumsrc=0;
   volatile int j;
   #pragma omp master
   for(j=0; j<size; j++) {
      sumdst += ((char *) dst) [j];
      sumsrc += ((char *) src) [j];
   }
   #pragma omp barrier
   #pragma omp master
   printf("[memcpy] checksum dst=%d src=%d\n", sumdst, sumsrc);
   #pragma omp barrier
#endif
}

static inline void ccn_memcpy_init() {
#ifdef CCN_PULP
#if MCHAN_VERSION < 3
   mchan_memcpy_init();
#endif
#endif
}

static inline void ccn_memcpy_deinit() {
#ifdef CCN_PULP
#if MCHAN_VERSION < 3
   mchan_memcpy_deinit();
#endif
#endif
}

static inline void ccn_memcpy_wait() {
#ifndef NODMA
#ifndef FAKEDMA
   #pragma omp master
#if MCHAN_VERSION <= 3
   mchan_memcpy_wait();
#else
   if (dmaId != -1) {
     pulp_dma_wait(pulp_dma_base(), dmaId);
     dmaId = -1;
   }
#endif
   #pragma omp barrier
#endif
#endif
}

static inline int ccn_get_time() {
#ifdef CCN_PULP
   return get_time();
#else
   return 0;
#endif
}

static inline void ccn_start_time() {
#ifdef CCN_PULP
   start_timer();
#endif
}

static inline void ccn_stop_time() {
#ifdef CCN_PULP
   stop_timer();
#endif
}

static inline void ccn_reset_time() {
#ifdef CCN_PULP
   reset_timer();
#endif
}

#endif
