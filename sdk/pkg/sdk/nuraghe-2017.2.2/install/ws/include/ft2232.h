/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef FT2232_H
#define FT2232_H


#include "mem.h"

class Ft2232 : public MemIF {
  public:
    Ft2232();

    bool access(bool write, unsigned int addr, int size, char* buffer);
};

#endif

