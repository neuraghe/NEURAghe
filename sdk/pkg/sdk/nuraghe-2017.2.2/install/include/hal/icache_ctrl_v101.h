#ifndef __ICACHE_CTRL_H__
#define __ICACHE_CTRL_H__

#include <stdint.h>
#include "hal/pulp.h"
#include "hal/utils.h"

/*          I cache Controller memory map - September 2016               */
/*+-------------------+-------------------+-------------------+---------+*/
/*|  MultiPort Icache | SinglePort Icache |  Private Icache   |  Offset |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Enable         |    Enable         |    Enable         |   0x00U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    FLUSH          |    FLUSH          |    FLUSH          |   0x04U |*/
/*|    xxx            |    FLUSH L0       |    xxx            |   0x08U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Clear CNT      |    Clear CNT      |    Clear CNT      |   0x0CU |*/
/*|    Start CNT      |    Start CNT      |    Start CNT      |   0x10U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Global HIT     |    Global HIT     |    Global HIT     |   0x14U |*/
/*|    Global Trans   |    Global Trans   |    Global Trans   |   0x18U |*/
/*|    Global Miss    |    Global Miss    |    Global Miss    |   0x1CU |*/
/*|    xxx            |    Global Stall   |    xxx            |   0x20U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 0     |    Hit Core 0     |    Hit Core 0     |   0x24U |*/
/*|    Trans Core 0   |    Trans Core 0   |    Trans Core 0   |   0x28U |*/
/*|    Miss Core 0    |    Miss Core 0    |    Miss Core 0    |   0x2CU |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 1     |    Hit Core 1     |    Hit Core 1     |   0x30U |*/
/*|    Trans Core 1   |    Trans Core 1   |    Trans Core 1   |   0x34U |*/
/*|    Miss Core 1    |    Miss Core 1    |    Miss Core 1    |   0x38U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 2     |    Hit Core 2     |    Hit Core 2     |   0x3CU |*/
/*|    Trans Core 2   |    Trans Core 2   |    Trans Core 2   |   0x40U |*/
/*|    Miss Core 2    |    Miss Core 2    |    Miss Core 2    |   0x44U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 3     |    Hit Core 3     |    Hit Core 3     |   0x48U |*/
/*|    Trans Core 3   |    Trans Core 3   |    Trans Core 3   |   0x4CU |*/
/*|    Miss Core 3    |    Miss Core 3    |    Miss Core 3    |   0x50U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 4     |    Hit Core 4     |    Hit Core 4     |   0x54U |*/
/*|    Trans Core 4   |    Trans Core 4   |    Trans Core 4   |   0x58U |*/
/*|    Miss Core 4    |    Miss Core 4    |    Miss Core 4    |   0x5CU |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 5     |    Hit Core 5     |    Hit Core 5     |   0x60U |*/
/*|    Trans Core 5   |    Trans Core 5   |    Trans Core 5   |   0x64U |*/
/*|    Miss Core 5    |    Miss Core 5    |    Miss Core 5    |   0x68U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 6     |    Hit Core 6     |    Hit Core 6     |   0x6CU |*/
/*|    Trans Core 6   |    Trans Core 6   |    Trans Core 6   |   0x70U |*/
/*|    Miss Core 6    |    Miss Core 6    |    Miss Core 6    |   0x74U |*/ 
/*+-------------------+-------------------+-------------------+---------+*/
/*|    Hit Core 7     |    Hit Core 7     |    Hit Core 7     |   0x78U |*/
/*|    Trans Core 7   |    Trans Core 7   |    Trans Core 7   |   0x7CU |*/
/*|    Miss Core 7    |    Miss Core 7    |    Miss Core 7    |   0x80U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    xxx            |    Stall Core 0   |    xxx            |   0x84U |*/
/*|    xxx            |    Stall Core 1   |    xxx            |   0x88U |*/
/*|    xxx            |    Stall Core 2   |    xxx            |   0x8CU |*/
/*|    xxx            |    Stall Core 3   |    xxx            |   0x90U |*/
/*|    xxx            |    Stall Core 4   |    xxx            |   0x94U |*/
/*|    xxx            |    Stall Core 5   |    xxx            |   0x98U |*/
/*|    xxx            |    Stall Core 6   |    xxx            |   0x9CU |*/
/*|    xxx            |    Stall Core 7   |    xxx            |   0xA0U |*/
/*+-------------------+-------------------+-------------------+---------+*/
/*|    xxx            |    Set Private I$ |    xxx            |   0xF0U |*/
/*+-------------------+-------------------+-------------------+---------+*/


// Enable I-cache
static inline void enable_icache ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x00U ) = 0xFFFFFFFFU;
}

// Disable I-cache
static inline void disable_icache ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x00U ) = 0x00000000U;
}

// Flush the L0 buffers, each bit of conf identifies a L0 Buffer Block
static inline void flush_icache ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x04U ) = 0xFFFFFFFFU;
}

// Flush the L0 buffers, each bit of conf identifies a L0 Buffer Block
static inline void flush_L0_buffers ( __attribute__((unused)) int conf ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x08U ) = 0xFFFFFFFFU;
}

// Reset the stat counters in each icache banks
static inline void reset_all_icache_stat_regs ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x0CU ) = 0xFFFFFFFFU;
}

// Enable all the stat counters in all icache banks available
static inline void start_all_icache_stat_regs ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x10U ) = 0xFFFFFFFFU;
    return;
}

// Disable all the stat counters in all icache banks available
static inline void stop_all_icache_stat_regs ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x10U ) = 0x00000000U;
    return;
}

// Read Global I-cache Hit counter
static inline uint32_t read_hit_icache_global  ( ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x14U );
    return reg_status;
}

// Read Global I-cache Transaction counter
static inline uint32_t read_trans_icache_global ( ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x18U );
    return reg_status;
}

// Read Global I-cache Miss counter
static inline uint32_t read_miss_icache_global ( ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x1CU );
    return reg_status;
}

// Read Global I-cache Stall counter
static inline uint32_t read_stall_icache_global ( ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x20U );
    return reg_status;
}

// Read private I-cache Hit counter
static inline uint32_t read_hit_icache_reg  ( uint32_t core_id ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x24U + (core_id * 0x0CU ) + 0x0U );
    return reg_status;
}

// Read private I-cache Transaction counter
static inline uint32_t read_trans_icache_reg ( uint32_t core_id ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x24U + (core_id * 0x0CU ) + 0x4U );
    return reg_status;
}

// Read private I-cache Miss counter
static inline uint32_t read_miss_icache_reg ( uint32_t core_id ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x24U + (core_id * 0x0CU ) + 0x8U );
    return reg_status;
}

// Read private I-cache Miss counter
static inline uint32_t read_stall_icache_reg ( uint32_t core_id ) {
    volatile uint32_t reg_status;
    reg_status = *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0x84U + (core_id * 0x04U ));
    return reg_status;
}

static inline void set_private_icache ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0xF0U ) = 0xFFFFFFFFU;
}

static inline void set_shared_icache ( ) {
    *( volatile uint32_t* ) ( ICACHE_CTRL_BASE_ADDR + 0xF0U ) = 0x00000000U;
}

#endif
