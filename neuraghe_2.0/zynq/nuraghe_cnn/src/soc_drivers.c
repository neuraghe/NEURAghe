/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 *                                                                            *
 * Project:     NURAGHE - Accelerator for Convolutional neural network        *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>

#include "soc_drivers.h"
#include "./colors.h"
#include "/home/gderiu/pulp/nuraghe_MW_l2.h"

//#define DISABLE_PRINT

void wait_for_conv(volatile int * ddr_addr){
	  while(*((volatile int *) ((int)ddr_addr))!=0x1) {}
	  ;
}

void trigger_conv (volatile int * ddr_addr, volatile int * soc_addr){
	*((volatile int *) ddr_addr)=0x0;
	*((volatile int *) ((int)soc_addr + 0x3FA00+ NUM_BANKS*4*11) )=0xABCDEF01;
}

void conv_setup (volatile int * soc_addr, int in_f, int out_f, int ih, int iw, int fs, int max_og,
		         int max_stores, int rectifier_activ, int w_addr, int x_addr, int y_addr){
	/* Setup the convolution layer
	 *
	 * in_f: number of INPUT FEATURES
	 * out_f: number of OUTPUT FEATURES
	 * ih: HEIGHT of the input features
	 * iw: WIDTH of the input features
	 * fs: filter size. Valid sizes are 3 and 5, at this time.
	 * max_og: number of OG in TCDM. This is a parameter of the middleware. Use ((NUM_BANKS-12)/4)-1 if not sure, it is a conservative value.
	 * max_stores: number of store performed together. This is a parameter of the middleware. Use 1 if not sure, it is a conservative value.
	 * w_addr: weights address
	 * x_addr: input features address
	 * y_addr: output features address
	 *
	 * To avoid overwrites addresses must be chosen keeping in mind the sizes of the features.
	 * Be careful using L2 memory addresses. This memory contains instructions also.
	 *
	 * Max_og depends on the size of the TCDM and the size of output features.
	 * Its value is a trade-off among these sizes and transfer time and can be chosen using TCDM configuration tool and Trasfer time tool.
	 *
	 * Max_stores depends primarily on transfers time and can be chosen using TCDM configuration tool and Trasfer time tool.
	 * */

	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*0)) = 0xA00AB11B; // control code
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*1)) = in_f; //# input features
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*2)) = out_f;//# input features
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*3)) = ih;//features height
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*4)) = iw;//features width
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*5)) = fs;//filter size
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*6)) = max_og;// number of OG in TCDM. This is a parameter of the middleware
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*7)) = max_stores;// number of store performed together. This is a parameter of the middleware
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*8)) = w_addr;//weights address
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*9)) = x_addr;//input features address
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*10)) = y_addr;//output features address
	*((volatile int*)((int)soc_addr +0x3FA00 + NUM_BANKS*4*12)) = rectifier_activ;//enable rectifier activation

}

void use_default_conv_test(){
    /* Conv_test has a default test with auto-generated features and weights.
     * If the control code is invalid the default test will be used.
     * */
	*((volatile int*)(CONV_SETUP_ADDR + NUM_BANKS*4*0)) = 0x00000000; // reset control code
}

#ifdef MEM_MAPPING
int * addr_linux(int addr, int size, int fd)
{
    uint64_t offset, base;
    volatile uint8_t *mm;


    offset = addr;

    base = offset & PAGE_MASK;
    offset &= ~PAGE_MASK;

    mm = (uint8_t *)mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, base);
    if (mm == MAP_FAILED) {
        fprintf(stderr, "mmap64(0x%x@0x%llx) failed (%d)\n",size, base, errno);
        return (int*)0;
    }



    return (int*)(mm + offset);
}
#endif

void load_instr (volatile int * soc_addr){
	/* Loads into L2 memory the instructions of the test.
	 *
	 * The function reads the array l2_code and writes its content into L2 through the Zynq - PL AXI interconnect.
	 * l2_code array must be defined into the header file specific for each test. See the top of this file.
	 */

    int i;

	volatile int * l2_ptr = (volatile int *) ((int)soc_addr + 0xC000000);
#ifndef DISABLE_PRINT
	YELLOW
	printf ("[ARM] Loading code in L2 at address 0x%08x...\n", (int)l2_ptr);
	NC
#endif
	for(i=0;i<CODE_SIZE;i++){
		l2_ptr[i]=l2_code[i];
    }

#ifndef DISABLE_PRINT
	GREEN
	printf ("\t [OK] Loading complete!\n");
	NC
#endif
}

void fetch_enable (volatile int * soc_cntr_addr){
	/* Enables the fetch signal for the PL core.
	 * Immediately after the programming of the chip the core is clock gated waiting for the fetch signal.
	 * */
	*((volatile int*)((int) soc_cntr_addr))=0x1;
#ifndef DISABLE_PRINT
	CYAN
	printf ("[ARM] Fetch is enabled.\n");
	NC
#endif
}

void fetch_disable (volatile int * soc_addr){
	/* Disables the fecth signal. See fetch_enable
	 * */
	*((volatile int*)FETCH_ENABLE_ADDR)=0x0;
#ifndef DISABLE_PRINT
	CYAN
	printf ("[ARM] Fetch is disabled.\n");
	NC
#endif
}

void wait_eoc (volatile int * soc_cntr_addr) {
	/* After fetch is enabled the core starts the computation. Some tests runs until they reach the end of the program.
	 * The last instruction is eoc() that assert the end-of-computation signal. The control IP catch the signal and writes 1
	 * in a specific register.
	 * */
#ifndef DISABLE_PRINT
	printf ("Waiting for EOC...\n");
#endif
	while(*((volatile int*)EOC_ADDR)==0);
	fetch_disable ( soc_cntr_addr);
#ifndef DISABLE_PRINT
	printf ("EOC caught!\n");
#endif
}

void wait_for (long int num){
  /* Wait for a while. The time depends on ARM working frequency and on the number of instructions used to implement the for statement.
   * */
	for (;num>0;num--);
}

void read_tcdm (volatile int *from, int nrow){
	/* Prints a nrow number of row of the TCDM starting from from address.
	 *
	 * this function prints the content with the TCDM organization.
	 * */
	int i;
	volatile int * from_int;

	from_int = (volatile int *) (((int)from) & 0xFFFFFFC0);

	int len=nrow*NUM_BANKS;

	printf ("\nRow          \tBank_0               \tBank_1               \tBank_2               \tBank_3               \tBank_4               \tBank_5               \tBank_6                \tBank_7               \tBank_8               \tBank_9               \tBank_A               \tBank_B               \tBank_C               \tBank_D               \tBank_E               \tBank_F");
	printf ("          \tBank_10               \tBank_11               \tBank_12               \tBank_13               \tBank_14               \tBank_15               \tBank_16                \tBank_17               \tBank_18               \tBank_19               \tBank_1A               \tBank_1B               \tBank_1C               \tBank_1D               \tBank_1E               \tBank_1F");


	for (i=0;i<len;i++){
	  if (i%NUM_BANKS == 0)
		  printf ("\n[0x%04x]  \t",(((int)(&from_int[i]))&0x7FFFF)>>7);
	  printf ("0x%08x      \t", from_int[i]);
	}
	printf ("\n");
}

void read_mem (volatile int *from, int len, int stride) {
    /* Prints values contained in a generic memory (it can be DDR, L2 memory or TCDM) int by int.
     * In TCDM word are read with the word-interleaving mapping (COREs mapping).
     *
     * *from: start address
     * len: num of int to be read
     * stride: step between two int.
     *
     * Stride is usefull if you want to read the content of a single bank setting stride to NUM_BANKS.
     *
     * This functions prints values int by int without any visual organization.
     * */
	int i;
	for (i=0;i<len;i++){
		if ((int)&from[i*stride]>=0x50000000 && (int)&from[i*stride]<0x50040000)
		  printf ("TCDM_%d[0x%08x]: 0x%08x\n", ((int)&from[i*stride]>>2)%NUM_BANKS, (int)&from[i*stride], from[i*stride]); //bank, address, data

		if ((int)&from[i*stride]>=0x5C000000 && (int)&from[i*stride]<0x5C040000)
		  printf ("L2[0x%08x]: 0x%08x\n",(int)&from[i*stride],from[i*stride]); // address, data

		if ((int)&from[i*stride]>=0x00100000 && (int)&from[i*stride]<0x40000000)
		  printf ("DDR[0x%08x]: 0x%08x\n",(int)&from[i*stride],from[i*stride]); // address, data
	}

}

void print_clk(){
	/* Prints same informations about the PL clock generated by ZYNQ. See Xilinx documentation for further informations
	 * */
#ifndef DISABLE_PRINT
	int reg = *((volatile int*)0xF8000170);

	int div0=(reg & 0x00003F00)>>8;
	int div1=(reg & 0x03F00000)>>20;

	int freq= (1000/div0)/div1;

	printf ("FPGA0_clk_reg: 0x%08x\n", reg);
	printf ("\tDiv0: 0x%03x\n", div0);
	printf ("\tDiv1: 0x%03x\n", div1);
	printf ("\tFPGA0_clk_freq: %d MHz\n", freq);

	printf ("\tclk0_freq:      %d MHz\n", freq/2);
	printf ("\tclkfast_freq:   %d MHz\n", freq);
#endif
}

void set_fclk_div(int div0, int div1){
	/* Set clock dividers to change the PL clock frequency. See Xilinx documentation for further informations
	 * */

	int val = 0x00000000;

	val = val | div0<<8 | div1<<20;

	unlock_ps_regs ();

	*((int*)0xF8000170) = val;

	lock_ps_regs ();
#ifndef DISABLE_PRINT
	printf ("FPGA0_clk new: 0x%08x\n", *((volatile int*)0xF8000170));
#endif
}

void stop_fclk(){
	/* Stops PL clock
	 * */

	int val = 0x00000001;

	unlock_ps_regs ();

	*((int*)0xF8000178) = val;

	lock_ps_regs ();

#ifndef DISABLE_PRINT
	printf ("FPGA0_clk stopped: %08x\n", *((volatile int*)0xF800017C));
#endif
}

void start_fclk(){
	/* Starts PL clock
	 * */

	int val = 0x00000000;

	unlock_ps_regs ();

	*((int*)0xF8000178) = val;

	lock_ps_regs ();

#ifndef DISABLE_PRINT
	printf ("FPGA0_clk started\n");
#endif
}


void unlock_ps_regs (){
	/* Remove the protection of specific registers of the PS if you want to change their values.
	 * */
	 *((int*)0XF8000008) = 0xDF0D; // unlock
}

void lock_ps_regs(){
	/* Set the protection of specific registers of the PS.
		 * */
	*((int*)0XF8000004) = 0x767B; //lock
}
