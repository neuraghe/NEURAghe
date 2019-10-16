#ifndef MEM_H
#define MEM_H

#include <unistd.h>
#include <stdint.h>
#include <stdbool.h>

class MemIF {
  public:
    virtual bool access(bool write, unsigned int addr, int size, char* buffer) = 0;
};

#endif
