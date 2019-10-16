#ifndef MEM_ZYNQ_APB_SPI_H
#define MEM_ZYNQ_APB_SPI_H

#include "mem.h"

#include <stdint.h>
#include <list>

class ZynqAPBSPIIF : public MemIF {
  public:
    ZynqAPBSPIIF();
    ~ZynqAPBSPIIF();

    bool access(bool write, unsigned int addr, int size, char* buffer);

  private:
    bool mem_write(unsigned int addr, int len, char *src);
    bool mem_read(unsigned int addr, int len, char *src);

    void mem_read_words(unsigned int addr, int len, char *src);
    void mem_write_words(unsigned int addr, int len, char *src);

    inline void apb_write(uint32_t addr, uint32_t data) { m_virt_apbspi[addr >> 2] = data; }
    inline uint32_t apb_read(uint32_t addr) {      return m_virt_apbspi[addr >> 2]; }

    int mmap_gen(uint32_t mem_address, uint32_t mem_size, volatile uint32_t **return_ptr);

    int is_fpga_programmed();

    void set_clkdiv(uint32_t clkdiv);
    void set_dummycycles(uint32_t dummycycles);
    void qpi_enable(bool enable);
    bool do_read_check(unsigned int addr, int size);

    bool soft_reset();


    struct addr_region {
      unsigned int start;
      unsigned int end;
    };


    bool m_qpi_enabled;
    volatile uint32_t *m_virt_apbspi;
    volatile uint32_t *m_virt_status;
    int g_mem_dev;
    std::list<struct addr_region> m_check_addrs;
};

#endif
