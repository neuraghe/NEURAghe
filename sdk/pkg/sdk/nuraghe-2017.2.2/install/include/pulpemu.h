/* emulator-specific stuff */

#ifndef PULPEMU_H
#define PULPEMU_H

#ifndef PULP_HOST_H___
#define PULPEMU_MEM        ((unsigned int *)0x1c007800)
#define pulpemu_store(a,b) PULPEMU_MEM[((get_core_id()<<9)+a)] = (b)
#define pulpemu_print(a)   printf("%08X\n", PULPEMU_MEM[((get_core_id()<<9)+a)], 0, 0, 0)
#endif

#ifndef PULP_H
#include "pulp.h"
#endif

#endif // PULPEMU_H
