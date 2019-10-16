/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#include "rt/rt_api.h"

#define NB_ITER 10

static PLP_FC_DATA unsigned int count = 0;

static void handler_cluster(unsigned arg);
static void handler_fc(unsigned arg);

static void handler_fc(unsigned arg) {
  printf("[%d, %d] Entered handler with arg %x\n", plp_clusterId(), plp_coreId(), arg);
  count++;
  if (count < NB_ITER) plp_sched_remote_enqueue(0, plp_task(handler_cluster, count));
  else plp_sched_stop(0);
}

static void handler_cluster(unsigned arg) {
  printf("[%d, %d] Entered handler with arg %x\n", plp_clusterId(), plp_coreId(), arg);
  plp_sched_remote_enqueue(PLP_FC_CID, plp_task(handler_fc, arg + 100));
}

int main()
{
	if (plp_isFc()) {

		printf("[%d, %d] Starting test\n", plp_clusterId(), plp_coreId());

		// Only fabric controller starts execution, also start cluster 0
		plp_cluster_fetch(1);

		// Initial task on cluster
		plp_sched_remote_enqueue(0, plp_task(handler_cluster, count));

		return plp_sched_start();

	} else {

		return plp_sched_start();

	}

  return 0;
}
