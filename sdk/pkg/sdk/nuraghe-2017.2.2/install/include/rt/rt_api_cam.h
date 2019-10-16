/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_CAM_H__
#define __RT__RT_API_CAM_H__

#define PLP_CAM_VGA  0
#define PLP_CAM_QVGA 1
#define PLP_CAM_CIF  2
#define PLP_CAM_QCIF 3

int plp_cam_conf_update();

plp_cam_conf_t *plp_cam_conf_get();

void plp_cam_start();

void plp_cam_stop();

plp_copy_t *plp_cam_copy_init(unsigned int size, plp_task_t task);

#endif