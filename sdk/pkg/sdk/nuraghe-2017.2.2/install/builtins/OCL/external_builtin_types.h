/*
  This file is part of AstC2C.

  Copyright (c) STMicroelectronics, 2013.
  All rights reserved.

  Redistribution and use in source and binary forms, with or without modification,
  are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, 
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
    * Neither the name of STMicroelectronics nor the names of its contributors
      may be used to endorse or promote products derived from this software
      without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

  Authors: Thierry Lepley
*/

/* This header file is used at C backend compilation time */


#ifndef __EXTERNAL_BUILTIN_TYPE_H
#define __EXTERNAL_BUILTIN_TYPE_H

/*-- Simple builtin types --*/
#ifndef __cplusplus
typedef int bool;
#endif
typedef unsigned char uchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;

/*  intptr_t, uintptr_t defined by standard C99 include stdint.h */
/*  ptrdiff_t, size_t defined by standard C99 include stddef.h */

/* half - not supported */


/*-- Complex builtin types --*/
/* image2d_t - not supported */
/* image3d_t - not supported */
/* sampler_t - not supported */
typedef int event_t;

/*-- For synchronisation functions --*/
typedef enum {
  CLK_LOCAL_MEM_FENCE,
  CLK_GLOBAL_MEM_FENCE
} cl_mem_fence_flags;

#endif // __EXTERNAL_BUILTIN_TYPE_H

