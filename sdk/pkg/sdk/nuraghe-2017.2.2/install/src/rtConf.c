#include <rt/rt_api.h>

#define STACK_SIZE      1024
#define STACK_AREA_SIZE (STACK_SIZE*NB_CLUSTER*NB_PE)

unsigned char peStacks[STACK_AREA_SIZE];
unsigned int stackSize = STACK_SIZE;

#ifndef SCM_SIZE
#define SCM_SIZE 0
#endif

rt_sys_conf_t __attribute__((weak)) rtSysConf = {PLATFORM, NB_CLUSTER, NB_PE, L1_SIZE, SCM_SIZE, L2_SIZE, 0};

#ifdef SA_APP

extern int main();

static void clusterControllerEntry()
{
	int retval = main();
	exit(retval);
}

void rt_sa_init() {
	if (rt_init()) return;
	if (rt_start(clusterControllerEntry, 0, 0)) return;
}
#endif