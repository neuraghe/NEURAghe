#ifndef _CLOCK_H_
#define _CLOCK_H_

#include <pulp.h>

#ifdef APB_SOC_CTRL_ADDR

#define CLK_REG_DIV0 (APB_SOC_CTRL_ADDR + 0x08)
#define CLK_REG_DIV1 (APB_SOC_CTRL_ADDR + 0x0C)
#define CLK_REG_DIV2 (APB_SOC_CTRL_ADDR + 0x4C)

#endif

void set_cluster_clk_divider(int divider); //if divider is 1 or 0 the divider is bypassed
void set_soc_clk_divider(int divider); //if divider is 1 or 0 the divider is bypassed

int read_cluster_clk_divider(); 
int read_soc_clk_divider(); 

#endif // _CLOCK_H_
