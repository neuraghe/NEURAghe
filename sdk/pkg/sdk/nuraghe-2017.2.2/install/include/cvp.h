#ifndef _CVP_H_
#define _CVP_H_

#include <pulp.h>

#define CVP_SOC_REG_FMODE_0           ( CVP_BASE_ADDR + 0x00 )
#define CVP_SOC_REG_FMODE_1           ( CVP_BASE_ADDR + 0x04 )
#define CVP_SOC_REG_FMODE_2           ( CVP_BASE_ADDR + 0x08 )
#define CVP_SOC_REG_FMODE_3           ( CVP_BASE_ADDR + 0x0C )
#define CVP_SOC_REG_FMODE_4           ( CVP_BASE_ADDR + 0x10 )
#define CVP_SOC_REG_FMODE_5           ( CVP_BASE_ADDR + 0x14 )
#define CVP_SOC_REG_FMODE_6           ( CVP_BASE_ADDR + 0x18 )
#define CVP_SOC_REG_FMODE_7           ( CVP_BASE_ADDR + 0x1C )
#define CVP_SOC_REG_CFG_FLL           ( CVP_BASE_ADDR + 0x20 )
#define CVP_SOC_REG_CFG_CLK_GEN       ( CVP_BASE_ADDR + 0x24 )
#define CVP_SOC_REG_STATUS            ( CVP_BASE_ADDR + 0x28 )

/*
Multiprobe Controller 0
========================
0x080    SerDes_value
0x084    SerDes_value+shift
0x088    SerDes_prog
0x08C    SerDes_prog+shift
0x090    SerDes_Ctrl
0x094    Sample_time
0x098    Mprob_Ctrl
*/

#define CVP_SOC_MPROB_SERDES_VAL        ( CVP_BASE_ADDR + 0x80 )
#define CVP_SOC_MPROB_SERDES_VAL_SHIFT  ( CVP_BASE_ADDR + 0x84 )
#define CVP_SOC_MPROB_SERDES_PROG       ( CVP_BASE_ADDR + 0x88 )
#define CVP_SOC_MPROB_SERDES_PROG_SHIFT ( CVP_BASE_ADDR + 0x8C )
#define CVP_SOC_MPROB_SERDES_CTRL       ( CVP_BASE_ADDR + 0x90 )
#define CVP_SOC_MPROB_SAMPLE_TIME       ( CVP_BASE_ADDR + 0x94 )
#define CVP_SOC_MPROB_CTRL              ( CVP_BASE_ADDR + 0x98 )


#define CVP_CLUSTER_REG_FMODE_0       ( CVP_BASE_ADDR + 0x800 )
#define CVP_CLUSTER_REG_FMODE_1       ( CVP_BASE_ADDR + 0x804 )
#define CVP_CLUSTER_REG_FMODE_2       ( CVP_BASE_ADDR + 0x808 )
#define CVP_CLUSTER_REG_FMODE_3       ( CVP_BASE_ADDR + 0x80C )
#define CVP_CLUSTER_REG_FMODE_4       ( CVP_BASE_ADDR + 0x810 )
#define CVP_CLUSTER_REG_FMODE_5       ( CVP_BASE_ADDR + 0x814 )
#define CVP_CLUSTER_REG_FMODE_6       ( CVP_BASE_ADDR + 0x818 )
#define CVP_CLUSTER_REG_FMODE_7       ( CVP_BASE_ADDR + 0x81C )
#define CVP_CLUSTER_REG_CFG_FLL       ( CVP_BASE_ADDR + 0x820 )
#define CVP_CLUSTER_REG_CFG_CLK_GEN   ( CVP_BASE_ADDR + 0x824 )
#define CVP_CLUSTER_REG_STATUS        ( CVP_BASE_ADDR + 0x828 )

void init_cvp();
void boot_FLL();
void set_soc_frequency(int frequency);
void set_cluster_frequency(int frequency);

int  get_MPROB_serdes_value           ();
int  get_MPROB_serdes_value_and_shift ();
void set_MPROB_serdes_value           (int ripple, int ringo, int overflow);
void set_MPROB_serdes_value_and_shift (int ripple, int ringo, int overflow);
void set_MPROB_serdes_ctrl            (int status, int ser_des_delay);
int  get_MPROB_serdes_ctrl            ();
void set_MPROB_sample_time            (int sample_time);
int  get_MPROB_sample_time            ();

void set_MPROB_ctrl                   (int mprob_start, int mprob_force, int mprob_reset, int mprob_test_freq);
int  get_MPROB_ctrl                   ();

#endif // _CVP_H_
