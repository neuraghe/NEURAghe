/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __RT__RT_API_GPIO_H__
#define __RT__RT_API_GPIO_H__

void plp_gpio_clear(int gpio);

void plp_gpio_configure_task(int gpio, unsigned int itmode, plp_task_t task);

void plp_gpio_configure(int gpio, unsigned int dir, unsigned int config);

void plp_gpio_init();

void plp_gpio_deinit();

#endif