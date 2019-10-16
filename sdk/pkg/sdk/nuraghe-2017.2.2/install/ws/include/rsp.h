#ifndef RSP_H
#define RSP_H

#include "mem.h"
#include "debug_if.h"
#include "breakpoints.h"

#include <list>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <errno.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <string.h>
#include <sys/select.h>


class Rsp {
  public:
    Rsp(int socket_port, MemIF* mem, LogIF *log, std::list<DbgIF*> list_dbgif, BreakPoints* bp);

    bool open();
    void close();

    bool wait_client();
    bool loop();

    bool decode(char* data, size_t len);

    bool multithread(char* data, size_t len);

    bool cont(char* data, size_t len); // continue, reserved keyword, thus not used as function name
    bool step(char* data, size_t len);

    bool query(char* data, size_t len);
    bool v_packet(char* data, size_t len);

    bool regs_send();
    bool reg_read(char* data, size_t len);
    bool reg_write(char* data, size_t len);

    bool get_packet(char* data, size_t* len);

    bool signal();

    bool send(const char* data, size_t len);
    bool send_str(const char* data);
  private:
    // internal helper functions
    bool pc_read(unsigned int* pc);

    bool waitStop(DbgIF* dbgif);
    bool resume(bool step);
    bool resume(int tid, bool step);
    void resumeAll(bool step);
    void resumeCore(DbgIF* dbgif, bool step);
    void resumeCoresPrepare(DbgIF *dbgif, bool step);
    void resumeCores();

    bool mem_read(char* data, size_t len);
    bool mem_write_ascii(char* data, size_t len);
    bool mem_write(char* data, size_t len);

    bool bp_insert(char* data, size_t len);
    bool bp_remove(char* data, size_t len);

    DbgIF* get_dbgif(int thread_id);

    int m_socket_port;
    int m_socket_in;
    int m_socket_client;

    int m_thread_sel;
    MemIF* m_mem;
    LogIF *log;
    BreakPoints* m_bp;
    std::list<DbgIF*> m_dbgifs;
};

#endif
