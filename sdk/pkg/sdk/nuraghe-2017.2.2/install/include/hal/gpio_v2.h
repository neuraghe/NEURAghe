/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 */

#ifndef __HAL_GPIO_V2_H__
#define __HAL_GPIO_V2_H__

static inline void plp_gpio_paddir_set(unsigned int value)
{
	pulp_write32(GPIO_BASE_ADDR + PLP_GPIO_PADDIR, value);
}

static inline unsigned int plp_gpio_paddir_get()
{
	return pulp_read32(GPIO_BASE_ADDR + PLP_GPIO_PADDIR);
}

static inline unsigned int plp_gpio_padin_get()
{
	return pulp_read32(GPIO_BASE_ADDR + PLP_GPIO_PADIN);
}

static inline void plp_gpio_padout_set(unsigned int value)
{
	pulp_write32(GPIO_BASE_ADDR + PLP_GPIO_PADOUT, value);
}

static inline unsigned int plp_gpio_padout_get()
{
	return pulp_read32(GPIO_BASE_ADDR + PLP_GPIO_PADOUT);
}

static inline void plp_gpio_inten_set(unsigned int value)
{
	pulp_write32(GPIO_BASE_ADDR + PLP_GPIO_INTEN, value);
}

static inline unsigned int plp_gpio_inten_get()
{
	return pulp_read32(GPIO_BASE_ADDR + PLP_GPIO_INTEN);
}

static inline void plp_gpio_inttype_set(unsigned int id, unsigned int value)
{
	pulp_write32(GPIO_BASE_ADDR + PLP_GPIO_INTTYPE(id), value);
}

static inline unsigned int plp_gpio_inttype_get(unsigned int id)
{
	return pulp_read32(GPIO_BASE_ADDR + PLP_GPIO_INTTYPE(id));
}

static inline unsigned int plp_gpio_intstatus_get()
{
	return pulp_read32(GPIO_BASE_ADDR + PLP_GPIO_INTSTATUS);
}

static inline void plp_gpio_extwakeup_set(unsigned int value)
{
	pulp_write32(GPIO_BASE_ADDR + PLP_GPIO_EXTWAKEUP, value);
}






static inline void plp_gpio_set_direction(unsigned int gpio, unsigned int dir)
{
	plp_gpio_paddir_set((plp_gpio_paddir_get() & ~(1<<gpio)) | (dir << gpio));
}

static inline void plp_gpio_enable_interrupt(unsigned int gpio, unsigned int en)
{
	plp_gpio_inten_set((plp_gpio_inten_get() & ~(1<<gpio)) | (en << gpio));
}

static inline void plp_gpio_set_irq_trigger(unsigned int gpio, unsigned int inttype)
{
	unsigned int inttypeId = PLP_GPIO_INTTYPE_NO(gpio);
	unsigned int gpioBit = PLP_GPIO_INTTYPE_BIT(gpio);
	unsigned int oldval = plp_gpio_inttype_get(inttypeId) & ~(((1<<PLP_GPIO_INTTYPE_SIZE)-1) << gpioBit);
	unsigned int newVal = oldval | (inttype << gpioBit);
	plp_gpio_inttype_set(inttypeId, newVal);
}

static inline void plp_gpio_write(unsigned int gpio, unsigned int val)
{
	plp_gpio_padout_set((plp_gpio_padout_get() & ~(1<<gpio)) | (val << gpio));
}

static inline unsigned int plp_gpio_read(unsigned int gpio)
{
	return (plp_gpio_padin_get() >> gpio) & 1;
}

static inline void plp_gpio_clearall()
{
	plp_gpio_inten_set(0);
}

#endif
