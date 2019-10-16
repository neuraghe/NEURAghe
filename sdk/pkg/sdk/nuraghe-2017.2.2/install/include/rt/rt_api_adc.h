/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_ADC_H__
#define __RT__RT_API_ADC_H__

int plp_adc_conf(unsigned int period_ms);

plp_copy_t *plp_adc_copy_init(unsigned int size, plp_task_t task);

#endif