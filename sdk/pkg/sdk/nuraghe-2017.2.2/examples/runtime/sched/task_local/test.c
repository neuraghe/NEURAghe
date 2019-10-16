#include "rt/rt_api.h"

void handler0(unsigned arg) {
  printf("Entered handler0 with arg %x\n", arg);
  plp_sched_stop(0);
}

int main()
{
  printf("[%d, %d] Starting test\n", plp_clusterId(), plp_coreId());

  plp_sched_enqueue(plp_task(handler0, 0x123));

  plp_sched_start();

  return 0;
}
