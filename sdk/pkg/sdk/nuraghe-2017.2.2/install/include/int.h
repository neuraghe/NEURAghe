#ifndef _INT_H_
#define _INT_H_

/* Number of interrupt handlers - really depends on PIC width in OR1200*/
#define MAX_INT_HANDLERS	32

/* Handler entry */
struct ihnd {
	void 	(*handler)(void *);
	void	*arg;
};

/* Add interrupt handler */ 
int int_add(unsigned long vect, void (* handler)(void *), void *arg);

/* Add exception vector handler */
void add_handler(unsigned long vector, void (* handler) (void));

/* Initialize routine */
void int_init();

/* Actual interrup handler function */
void int_main();

/* Enable interrupts */
static inline void int_enable(void)
{
#ifdef __riscv__
  int irq;
#if RISCV_VERSION >= 4
  asm volatile ("csrrs %0, 0x300, %1" : "=r" (irq) : "I" (0x1<<3) );
#else
  asm volatile ("csrrs %0, 0x300, %1" : "=r" (irq) : "I" (0x1<<0) );
#endif
#else
  set_SR(get_SR() | (SPR_SR_IEE));
#endif
}

static inline void int_disable(void)
{
#ifdef __riscv__
  int irq;
#if RISCV_VERSION >= 4
  asm volatile ("csrrc %0, 0x300, %1" :  "=r" (irq) : "I" (0x1<<3) );
#else
  asm volatile ("csrrc %0, 0x300, %1" :  "=r" (irq) : "I" (0x1<<0) );
#endif
#else
  set_SR(get_SR() & (~SPR_SR_IEE));
#endif
}

static inline unsigned int int_state_disable()
{
#ifdef __riscv__
  unsigned int result;
  asm volatile ("csrr %0, 0x300" : "=r" (result) );
  asm("csrw 0x300, %0" : : "r" (0x0) );
  return result;
  //return __builtin_pulp_spr_read(0x300);
#else
  unsigned int status = or1k_mfspr(SPR_SR);
  set_SR(status & (~SPR_SR_IEE));
  return status;
#endif
}

static inline void int_restore(unsigned int state)
{
#ifdef __riscv__
  __builtin_pulp_spr_write(0x300, state);
#else
  or1k_mtspr(SPR_SR, state);
#endif
}

#endif // _INT_H_
