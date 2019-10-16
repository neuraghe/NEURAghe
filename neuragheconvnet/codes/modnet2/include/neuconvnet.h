#ifndef  __NEUCONVNET_H__
#define __NEUCONVNET_H__

#include <math.h>
#include "paramIO.h"
#include "types.h"
#include "assert.h"
extern "C" {
#include "soc_drivers.h"
}

#include "source.h"
#include "relu.h"
#include "batch.h"
#include "maxpool.h"
#include "maxpool_f32.h"
#include "maxpool_fp16.h"
#include "maxpool_fp8.h"
#include "avgpool.h"
#include "linear.h"
#include "linear_f32.h"
#include "linear_fp16.h"
#include "linear_fp8.h"
#include "linear.h"
#include "spatconv.h"
#include "spatconv_hw.h"
#include "add.h"
#include "imagenet.h"
#include "imageUtils.h"

#endif