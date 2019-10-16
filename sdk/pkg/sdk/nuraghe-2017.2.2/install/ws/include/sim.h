#ifndef SIM_H
#define SIM_H

#include "mem.h"

class SimIF : public MemIF {
  public:
    SimIF(const char* mem_server, int port);

    bool access(bool write, unsigned int addr, int size, char* buffer);

  private:
    bool access_raw(bool write, unsigned int addr, int size, char* buffer);

    const char* m_server;
    int m_port;

    int m_socket;
};

#endif

