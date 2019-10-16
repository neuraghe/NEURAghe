/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

// This file defines all the macros needed for sharing the fabric between several programming
// models. The current versio support OpenMP and OpenCL

#ifndef __HD_REQ_H__
#define __HD_REQ_H__

#include <hal/pulp.h>

/*
 * Programming models ID
 */

// Define the supported number of programming models
// This is used for multiplexing host-to-fabric communication
// Note that the first one is reserved for the low-level generic runtime
#define PULP_REQ_NB_PMID          4

// Generic low-level runtime programming model ID
#define PULP_REQ_RT_PMID          0

// OpenCL programming model ID
#define PULP_REQ_OCL_PMID         1

// OpenMP programming model ID
#define PULP_REQ_OMP_PMID         2

// OpenVX programming model ID
#define PULP_REQ_OVX_PMID         3


/*
 * Host to fabric requests fields definition
 */

// A request is made of the following fields
// MSB          Req ID (16) |  ISWORD (1) | RESERVED(11) | PM ID (2) | ISWORD (1) | RESERVED(1)        LSB

#define PULP_FREQ_ISTASK_OFFSET       0
#define PULP_FREQ_ISWORD_OFFSET       1
#define PULP_FREQ_PMID_OFFSET         2
#define PULP_FREQ_PRIO_OFFSET         4
#define PULP_FREQ_WORD_DATA_OFFSET    6
#define PULP_FREQ_TASK_OFFSET_OFFSET  6
#define PULP_FREQ_TASK_DATA_OFFSET    20

#define PULP_FREQ_PMID_BITS           2
#define PULP_FREQ_PRIO_BITS           2
#define PULP_FREQ_WORD_DATA_BITS      26
#define PULP_FREQ_TASK_OFFSET_BITS    14
#define PULP_FREQ_TASK_DATA_BITS      12



/*
 * Fabric to host requests fields definition
 */

// A request is made of the following fields
// MSB         MSG DATA(23) | ISFABRIC (1) | TYPE (1) | PM ID (2) | PROCESS ID (5)           LSB

#define PULP_HREQ_PROCESSID_OFFSET 0
#define PULP_HREQ_PMID_OFFSET      5
#define PULP_HREQ_TYPE_OFFSET      7
#define PULP_HREQ_ISFABRIC_OFFSET  8
#define PULP_HREQ_MSGDATA_OFFSET   9

#define PULP_HREQ_PROCESSID_BITS   5
#define PULP_HREQ_PMID_BITS        2
#define PULP_HREQ_MSGDATA_BITS     23



/*
 * Macros for request access
 */

// Host to fabric request access
#define PULP_FREQ_GET_ISWORD(req)      ((req) & (1<<PULP_FREQ_ISWORD_OFFSET))
#define PULP_FREQ_GET_PMID(req)        (((req) >> PULP_FREQ_PMID_OFFSET) & ((1<<PULP_FREQ_PMID_BITS)-1))
#define PULP_FREQ_GET_PRIO(req)        (((req) >> PULP_FREQ_PRIO_OFFSET) & ((1<<PULP_FREQ_PRIO_BITS)-1))

#define PULP_FREQ_WORD_GET_DATA(req)   ((req) >> PULP_FREQ_WORD_DATA_OFFSET)
#define PULP_FREQ_TASK_GET_OFFSET(req) (((req) >> PULP_FREQ_TASK_OFFSET_OFFSET) & ((1<<PULP_FREQ_TASK_OFFSET_BITS)-1))
#define PULP_FREQ_TASK_GET_DATA(req)   ((req) >> PULP_FREQ_TASK_DATA_OFFSET)

// Host to fabric request generation. All the results of these defines can be ORed to
// generate the full request
#define PULP_FREQ_ISTASK               (1<<PULP_FREQ_ISTASK_OFFSET)
#define PULP_FREQ_ISWORD               (1<<PULP_FREQ_ISWORD_OFFSET)
#define PULP_FREQ_PRIO(id)             ((id)<<PULP_FREQ_PRIO_OFFSET)
#define PULP_FREQ_PMID(id)             ((id)<<PULP_FREQ_PMID_OFFSET)
#define PULP_FREQ_WORD_DATA(id)        ((id)<<PULP_FREQ_WORD_DATA_OFFSET)
#define PULP_FREQ_TASK_OFFSET(offset)  ((offset)<<PULP_FREQ_TASK_OFFSET_OFFSET)
#define PULP_FREQ_TASK_DATA(id)        ((id)<<PULP_FREQ_TASK_DATA_OFFSET)

#define PULP_FREQ_TASK_MSG(data,offset,pmId,prio) PULP_FREQ_TASK_OFFSET(offset) | PULP_FREQ_TASK_DATA(data) | PULP_FREQ_PMID(pmId) | PULP_FREQ_PRIO(prio) | PULP_FREQ_ISTASK

// Fabric to host request access
#define PULP_HREQ_GET_PMID(req)        (((req) >> PULP_HREQ_PMID_OFFSET) & ((1<<PULP_HREQ_PMID_BITS)-1))
#define PULP_HREQ_GET_MSGDATA(req)     ((req) >> PULP_HREQ_MSGDATA_OFFSET)
#define PULP_HREQ_GET_PROCESSID(req)   (((req) >> PULP_HREQ_PROCESSID_OFFSET) & ((1<<PULP_HREQ_PROCESSID_BITS)-1))
#define PULP_HREQ_GET_TYPE(req)        (((req) >> PULP_HREQ_TYPE_OFFSET) & 1)
#define PULP_HREQ_GET_ISFABRIC(req)    (((req) & (1<<PULP_HREQ_ISFABRIC_OFFSET))

// Fabric to host request generation. All the results of these defines can be ORed to
// generate the full request
#define PULP_HREQ_PROCESSID(id)        (id)
#define PULP_HREQ_PMID(id)             ((id) << PULP_HREQ_PMID_OFFSET)
#define PULP_HREQ_TYPE(id)             ((id) << PULP_HREQ_TYPE_OFFSET)
#define PULP_HREQ_ISFABRIC             (1 << PULP_HREQ_ISFABRIC_OFFSET)
#define PULP_HREQ_MSGDATA(id)          ((id) << PULP_HREQ_MSGDATA_OFFSET)


/*
 * Low-level runtime requests
 */ 

#define PULP_RT_REQ_PRIO              0


#define PULP_RT_LOADBINARY            (PULP_FREQ_REQID(0) | PULP_FREQ_ISWORD)
#define PULP_RT_CLOSEBINARY           (PULP_FREQ_REQID(1) | PULP_FREQ_ISWORD)
#define PULP_RT_CALLMAIN              (PULP_FREQ_REQID(2) | PULP_FREQ_ISWORD)
#define PULP_RT_FLUSHPERF             (PULP_FREQ_REQID(3) | PULP_FREQ_ISWORD)
#define PULP_RT_FCTOCC_FLUSHPERF      (PULP_FREQ_REQID(4) | PULP_FREQ_ISWORD | PULP_FREQ_ISWORD)
#define PULP_RT_CCTOFC_FLUSHPERF      (PULP_FREQ_REQID(5) | PULP_FREQ_ISWORD | PULP_FREQ_ISWORD)
#define PULP_RT_FREQ_ALLOC            6


// Fabric memory allocation
#define PULP_RT_ALLOC_SIZE_OFFSET     6
#define PULP_RT_ALLOC_LOC_L2          ((1<<PULP_RT_ALLOC_SIZE_OFFSET)-1)
#define PULP_RT_ALLOC_LOC_L1(cid)     (cid)
#define PULP_RT_ALLOC_INFO(loc,size)  ((loc) | ((size) << PULP_RT_ALLOC_SIZE_OFFSET))
#define PULP_RT_ALLOC_LOC(info)       ((info) & ((1<<PULP_RT_ALLOC_SIZE_OFFSET)-1))
#define PULP_RT_ALLOC_SIZE(info)      ((info) >> PULP_RT_ALLOC_SIZE_OFFSET)

#endif
