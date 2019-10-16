/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef FLEXIBLE_MEMIF_H
#define FLEXIBLE_MEMIF_H


#include "mem.h"

class MemIF_flex : public MemIF {
  public:
    MemIF_flex(char *cable);

    bool access(bool write, unsigned int addr, int size, char* buffer);

  private:

  	MemIF *memif;
};

#endif

