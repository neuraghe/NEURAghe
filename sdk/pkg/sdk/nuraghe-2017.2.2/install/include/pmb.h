#ifndef _PMB_H_
#define _PMB_H_

#include <archi/pulp.h>

#define PMB_REG_SENS_CTRL       ( PMB_BASE_ADDR + 0x04 )
#define PMB_REG_REF_CNT         ( PMB_BASE_ADDR + 0x08 )
#define PMB_REG_SENSOR_STAT     ( PMB_BASE_ADDR + 0x0C )

void pmb_set_ctrl(unsigned int ctrl);
void pmb_set_counter(unsigned int cnt);

unsigned int pmb_get_stat();
unsigned int pmb_get_ctrl();
unsigned int pmb_get_counter();


#endif // _I2C_H_
