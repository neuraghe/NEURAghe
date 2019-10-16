/* 
 * arith.h
 * Francesco Conti <f.conti@unibo.it>
 *
 * Copyright (C) 2015 ETH Zurich, University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 */
 
#include "types.h"

#ifndef ARITH_H
#define ARITH_H

// CConvNet product (fixed- or floating-point)
static inline data_t ccn_mult(data_t a, data_t b) {
#ifdef FIXED_CONVNET
   return (a*b) >> QF;
#else
   return a*b;
#endif
}

// CConvNet division (fixed- or floating-point)
static inline data_t ccn_div(data_t a, data_t b) {
#ifdef FIXED_CONVNET
   int a_exp = a << QF;
   return a_exp / b;
#else
   return a/b;
#endif
}

// CConvNet exponential (fixed-point)
static inline data_t ccn_exp(data_t x) {
#if QF == 8
   int y = 0;
   if(x < -256)
      y = 94;
   else if(x < -192)
      y = 94 + ccn_mult(106, (x - (-256)));
   else if(x < -128)
      y = 120 + ccn_mult(137, (x - (-192)));
   else if(x < -64)
      y = 155 + ccn_mult(176, (x - (-128)));
   else if(x < 0)
      y = 199 + ccn_mult(226, (x - (-64)));
   else if(x < 64)
      y = 256 + ccn_mult(290, (x - (0)));
   else if(x < 128)
      y = 328 + ccn_mult(373, (x - (64)));
   else if(x < 192)
      y = 422 + ccn_mult(479, (x - (128)));
   else
      y = 541;
   return y;
#endif /* QF == 8 */
#if QF == 9
   int y = 0;
   if(x < -512)
      y = 188;
   else if(x < -384)
      y = 188 + ccn_mult(213, (x - (-512)));
   else if(x < -256)
      y = 241 + ccn_mult(274, (x - (-384)));
   else if(x < -128)
      y = 310 + ccn_mult(352, (x - (-256)));
   else if(x < 0)
      y = 398 + ccn_mult(453, (x - (-128)));
   else if(x < 128)
      y = 512 + ccn_mult(581, (x - (0)));
   else if(x < 256)
      y = 657 + ccn_mult(746, (x - (128)));
   else if(x < 384)
      y = 844 + ccn_mult(959, (x - (256)));
   else
      y = 1083;
   return y;
#endif /* QF == 9 */
#if QF == 10
   int y = 0;
   if(x < -1024)
      y = 376;
   else if(x < -768)
      y = 376 + ccn_mult(427, (x - (-1024)));
   else if(x < -512)
      y = 483 + ccn_mult(549, (x - (-768)));
   else if(x < -256)
      y = 621 + ccn_mult(705, (x - (-512)));
   else if(x < 0)
      y = 797 + ccn_mult(906, (x - (-256)));
   else if(x < 256)
      y = 1024 + ccn_mult(1163, (x - (0)));
   else if(x < 512)
      y = 1314 + ccn_mult(1493, (x - (256)));
   else if(x < 768)
      y = 1688 + ccn_mult(1918, (x - (512)));
   else
      y = 2167;
   return y;
#endif /* QF == 10 */
#if QF == 11
   int y = 0;
   if(x < -2048)
      y = 753;
   else if(x < -1536)
      y = 753 + ccn_mult(855, (x - (-2048)));
   else if(x < -1024)
      y = 967 + ccn_mult(1099, (x - (-1536)));
   else if(x < -512)
      y = 1242 + ccn_mult(1411, (x - (-1024)));
   else if(x < 0)
      y = 1594 + ccn_mult(1812, (x - (-512)));
   else if(x < 512)
      y = 2048 + ccn_mult(2326, (x - (0)));
   else if(x < 1024)
      y = 2629 + ccn_mult(2987, (x - (512)));
   else if(x < 1536)
      y = 3376 + ccn_mult(3836, (x - (1024)));
   else
      y = 4335;
   return y;
#endif /* QF == 11 */
#if QF == 12
   int y = 0;
   if(x < -4096)
      y = 1506;
   else if(x < -3072)
      y = 1506 + ccn_mult(1711, (x - (-4096)));
   else if(x < -2048)
      y = 1934 + ccn_mult(2198, (x - (-3072)));
   else if(x < -1024)
      y = 2484 + ccn_mult(2822, (x - (-2048)));
   else if(x < 0)
      y = 3189 + ccn_mult(3624, (x - (-1024)));
   else if(x < 1024)
      y = 4096 + ccn_mult(4653, (x - (0)));
   else if(x < 2048)
      y = 5259 + ccn_mult(5975, (x - (1024)));
   else if(x < 3072)
      y = 6753 + ccn_mult(7672, (x - (2048)));
   else
      y = 8671;
   return y;
#endif /* QF == 12 */
#if QF == 13
   int y = 0;
   if(x < -8192)
      y = 3013;
   else if(x < -6144)
      y = 3013 + ccn_mult(3423, (x - (-8192)));
   else if(x < -4096)
      y = 3869 + ccn_mult(4396, (x - (-6144)));
   else if(x < -2048)
      y = 4968 + ccn_mult(5644, (x - (-4096)));
   else if(x < 0)
      y = 6379 + ccn_mult(7248, (x - (-2048)));
   else if(x < 2048)
      y = 8192 + ccn_mult(9306, (x - (0)));
   else if(x < 4096)
      y = 10518 + ccn_mult(11950, (x - (2048)));
   else if(x < 6144)
      y = 13506 + ccn_mult(15344, (x - (4096)));
   else
      y = 17342;
   return y;
#endif /* QF == 13 */
#if QF == 14
   int y = 0;
   if(x < -16384)
      y = 6027;
   else if(x < -12288)
      y = 6027 + ccn_mult(6847, (x - (-16384)));
   else if(x < -8192)
      y = 7739 + ccn_mult(8792, (x - (-12288)));
   else if(x < -4096)
      y = 9937 + ccn_mult(11289, (x - (-8192)));
   else if(x < 0)
      y = 12759 + ccn_mult(14496, (x - (-4096)));
   else if(x < 4096)
      y = 16384 + ccn_mult(18613, (x - (0)));
   else if(x < 8192)
      y = 21037 + ccn_mult(23900, (x - (4096)));
   else if(x < 12288)
      y = 27012 + ccn_mult(30689, (x - (8192)));
   else
      y = -30852;
   return y;
#endif /* QF == 14 */
}

// CConvNet rectify (fixed- or floating-point)
static inline data_t ccn_relu(data_t x) {
   if (x < 0)
      return 0;
   else
      return x;
}

// CConvNet softmax (fixed- or floating-point)
static inline ccn_softmax(data_t * __restrict__ x, data_t * __restrict__ y, int len) {
   int i = 0;
   int sum = 0;
   for(i=0; i<len; i++) {
      y[i] = ccn_exp(x[i]);
      sum += y[i];
   }
   printf("sum=%d\n", sum);
   for(i=0; i<len; i++) {
      printf(" y[i]=%d sum=%d\n", y[i], sum);
      y[i] = ccn_div(y[i], sum);
   }
}

// CConvNet hyperbolic tangent (fixed- or floating-point)
static inline data_t ccn_tanh(data_t x) {
#if QF == 8
   int y = 0;
   if(x < -256)
      y = -194;
   else if(x < -192)
      y = -194 + ccn_mult(129, (x - (-256)));
   else if(x < -128)
      y = -162 + ccn_mult(177, (x - (-192)));
   else if(x < -64)
      y = -118 + ccn_mult(222, (x - (-128)));
   else if(x < 0)
      y = -62 + ccn_mult(250, (x - (-64)));
   else if(x < 64)
      y = 0 + ccn_mult(250, (x - (0)));
   else if(x < 128)
      y = 62 + ccn_mult(222, (x - (64)));
   else if(x < 192)
      y = 118 + ccn_mult(177, (x - (128)));
   else
      y = 162;
   return y;
#endif /* QF == 8 */
#if QF == 9
   int y = 0;
   if(x < -512)
      y = -389;
   else if(x < -384)
      y = -389 + ccn_mult(258, (x - (-512)));
   else if(x < -256)
      y = -325 + ccn_mult(354, (x - (-384)));
   else if(x < -128)
      y = -236 + ccn_mult(444, (x - (-256)));
   else if(x < 0)
      y = -125 + ccn_mult(501, (x - (-128)));
   else if(x < 128)
      y = 0 + ccn_mult(501, (x - (0)));
   else if(x < 256)
      y = 125 + ccn_mult(444, (x - (128)));
   else if(x < 384)
      y = 236 + ccn_mult(354, (x - (256)));
   else
      y = 325;
   return y;
#endif /* QF == 9 */
#if QF == 10
   int y = 0;
   if(x < -1024)
      y = -779;
   else if(x < -768)
      y = -779 + ccn_mult(517, (x - (-1024)));
   else if(x < -512)
      y = -650 + ccn_mult(708, (x - (-768)));
   else if(x < -256)
      y = -473 + ccn_mult(889, (x - (-512)));
   else if(x < 0)
      y = -250 + ccn_mult(1003, (x - (-256)));
   else if(x < 256)
      y = 0 + ccn_mult(1003, (x - (0)));
   else if(x < 512)
      y = 250 + ccn_mult(889, (x - (256)));
   else if(x < 768)
      y = 473 + ccn_mult(708, (x - (512)));
   else
      y = 650;
   return y;
#endif /* QF == 10 */
#if QF == 11
   int y = 0;
   if(x < -2048)
      y = -1559;
   else if(x < -1536)
      y = -1559 + ccn_mult(1035, (x - (-2048)));
   else if(x < -1024)
      y = -1300 + ccn_mult(1417, (x - (-1536)));
   else if(x < -512)
      y = -946 + ccn_mult(1779, (x - (-1024)));
   else if(x < 0)
      y = -501 + ccn_mult(2006, (x - (-512)));
   else if(x < 512)
      y = 0 + ccn_mult(2006, (x - (0)));
   else if(x < 1024)
      y = 501 + ccn_mult(1779, (x - (512)));
   else if(x < 1536)
      y = 946 + ccn_mult(1417, (x - (1024)));
   else
      y = 1300;
   return y;
#endif /* QF == 11 */
#if QF == 12
   int y = 0;
   if(x < -4096)
      y = -3119;
   else if(x < -3072)
      y = -3119 + ccn_mult(2071, (x - (-4096)));
   else if(x < -2048)
      y = -2601 + ccn_mult(2834, (x - (-3072)));
   else if(x < -1024)
      y = -1892 + ccn_mult(3558, (x - (-2048)));
   else if(x < 0)
      y = -1003 + ccn_mult(4012, (x - (-1024)));
   else if(x < 1024)
      y = 0 + ccn_mult(4012, (x - (0)));
   else if(x < 2048)
      y = 1003 + ccn_mult(3558, (x - (1024)));
   else if(x < 3072)
      y = 1892 + ccn_mult(2834, (x - (2048)));
   else
      y = 2601;
   return y;
#endif /* QF == 12 */
#if QF == 13
   int y = 0;
   if(x < -8192)
      y = -6238;
   else if(x < -6144)
      y = -6238 + ccn_mult(4143, (x - (-8192)));
   else if(x < -4096)
      y = -5203 + ccn_mult(5669, (x - (-6144)));
   else if(x < -2048)
      y = -3785 + ccn_mult(7117, (x - (-4096)));
   else if(x < 0)
      y = -2006 + ccn_mult(8025, (x - (-2048)));
   else if(x < 2048)
      y = 0 + ccn_mult(8025, (x - (0)));
   else if(x < 4096)
      y = 2006 + ccn_mult(7117, (x - (2048)));
   else if(x < 6144)
      y = 3785 + ccn_mult(5669, (x - (4096)));
   else
      y = 5203;
   return y;
#endif /* QF == 13 */
#if QF == 14
   int y = 0;
   if(x < -16384)
      y = -12477;
   else if(x < -12288)
      y = -12477 + ccn_mult(8286, (x - (-16384)));
   else if(x < -8192)
      y = -10406 + ccn_mult(11339, (x - (-12288)));
   else if(x < -4096)
      y = -7571 + ccn_mult(14234, (x - (-8192)));
   else if(x < 0)
      y = -4012 + ccn_mult(16050, (x - (-4096)));
   else if(x < 4096)
      y = 0 + ccn_mult(16050, (x - (0)));
   else if(x < 8192)
      y = 4012 + ccn_mult(14234, (x - (4096)));
   else if(x < 12288)
      y = 7571 + ccn_mult(11339, (x - (8192)));
   else
      y = 10406;
   return y;
#endif /* QF == 14 */
}

#endif
