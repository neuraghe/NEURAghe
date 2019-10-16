/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 *                                                                            *
 * Project:     NEURAGHE - Accelerator for Convolutional neural network       *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
//#include <time.h>

#include "soc_drivers.h"
#include "colors.h"



#ifdef ZED
	#include <nuraghe_MW_l2.h>	//path included in CPATH environment variable for C and C++ header files
#endif

#ifdef ZC706
	#include <nuraghe_MW_l2.h>
#endif

#ifdef ZED_tcn
	#include <nuraghe_MW_l2.h>
#endif

#ifdef ZC706_tcn
	#include <nuraghe_MW_l2.h>
#endif

#ifdef ZC706_DUAL2x2
	#include <nuraghe_MW_l2.h>
#endif

#ifdef ZC706_DUAL2x4
	//#include "/home/gderiu/gianfranco/nuraghe_MW_l2.h"
	#include <nuraghe_MW_l2.h>
#endif

#include <sys/sendfile.h>
#define MAXSENDFILE 0x7ffff000

//#define DISABLE_PRINT

static int job_id;
/*
void *memcpyNEON(void *dst, const void *src, size_t len)
{
	_tcreate_(time);

        __asm__ __volatile__ (
                        "NEONCopyPLD:\n\t"
                        "PLD [%0, #0xC0]\n\t"
                        "VLDM %0!,{d0-d15}\n\t"
                        "VSTM %1!,{d0-d15}\n\t"
                        "SUBS %2,%2,#0x80\n\t"
                        "BGE NEONCopyPLD\n\t"
                        : "=&r" (src), "=&r" (dst), "=&r" (len)
                        : "0" (src), "1" (dst), "2" (len)
                        : "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "d11", "d12", "d13", "d14", "d15"
                );

    _tprintf_("\tmemcpyNEON: %5.3f ms\n", (get_wall_time()-time)/1000);

}*/


int soc_size, cntr_size, ddr_size, ps7_slcr_size;

void init_soc(SOCMAP* socs, DATA** wPointer, int MAXMEM, int SWAPMEM, char* bitstream_file) {
	
	SOCMAP socs_int[_NCLUSTER_];
	int nclu=0;
	for (nclu=0;nclu<_NCLUSTER_; nclu++){
		socs[nclu] = (SOCMAP) calloc(1, sizeof(struct Socmap));
		socs_int[nclu] = socs[nclu];
	}

//        printf("loading bitstream\n");
	//Mem mapping soc and ddr
	int fd = mmap_soc(socs_int);

	if(strlen(bitstream_file) != 0)
	{	
                
        printf("loading bitstream\n");
		load_bitstream(bitstream_file);

		if(bitstream_check()) {
			printf(RED "[ERROR] Bitstream not loaded!\n" NC);
	        exit(1);
		}
	
		_rprintf_("loading bitstream %s [" GREEN "Success!" NC "]\n", bitstream_file);

	}
	else
        	printf("no bitfile argument passed.\n");

	print_clk(socs_int[0]->ps7_slcr_addr);

	
	//Set soc frequencies


		//print_clk(socs_int[0]->ps7_slcr_addr);
	printf("loading instr.\n");
		//Loading instructions into L2 for cores into the programmable logic

	printf("# clusters: %d\n",_NCLUSTER_ );
	for (nclu=0; nclu<_NCLUSTER_; nclu++)
	{
		load_instr((volatile int *)(socs_int[nclu]->soc_addr));
		//set SOC ID
		socs_int[nclu]->id-=nclu;
		*((volatile int*)((neuADDR)socs_int[nclu]->soc_addr + CLUSTID_ADDR)) = nclu;
		
		// control code
		*((volatile int*)((neuADDR)socs_int[nclu]->soc_addr + SOC_HANDSHAKE_ADDR)) = 0xA00AB11B;
		
		// activate the core
	  fetch_enable (socs_int[nclu]->soc_cntr_addr);
    // wait for the startup of the core
	  wait_for_mw_ready(socs_int[nclu]->soc_addr);

	}		

	//int socnum=0;

	// reset ready variable
	// *((volatile int *)((neuADDR)socs_int[0]->ddr_addr + 0x0)) = 0;

		

	//fetch_enable (socs_int[0]->soc_cntr_addr);
	//sleep(1);
	//fetch_enable (socs_int[1]->soc_cntr_addr);

	//wait_for_mw_ready(socs_int[0]->soc_addr);
	//wait_for_mw_ready(socs_int[1]->soc_addr);
	//sleep(1);

	printf("setting task.\n");         
         
	int soc_num;
	for (soc_num=0; soc_num<_NCLUSTER_; soc_num++) {

		socs_int[soc_num]->task_ptr = (Conv_params*)(*((volatile int*)((neuADDR)socs_int[soc_num]->soc_addr + SOC_HANDSHAKE_ADDR)));
		_dprintf_("soc_addr: 0x%x, soc_addr+0x%x: 0x%x, task_ptr: 0x%x -> %d\n", (neuADDR)socs_int[soc_num]->soc_addr,SOC_HANDSHAKE_ADDR, (neuADDR)socs_int[soc_num]->soc_addr + SOC_HANDSHAKE_ADDR, socs_int[soc_num]->task_ptr, socs_int[soc_num]->task_ptr);

		_dprintf_("task_ptr: 0x%x -> %d\n", (neuADDR)socs_int[soc_num]->task_ptr & 0x7FFFFFF, (neuADDR)socs_int[soc_num]->task_ptr & 0x7FFFFFF);

		socs_int[soc_num]->task_ptr = (Conv_params*)((neuADDR)socs_int[soc_num]->soc_addr + ((neuADDR)socs_int[soc_num]->task_ptr & 0x7FFFFFF));
		_dprintf_("task_ptr: 0x%x -> %d\n", socs_int[soc_num]->task_ptr, socs_int[soc_num]->task_ptr);

		job_id = *((volatile int*)((neuADDR)socs_int[soc_num]->soc_addr + JOB_ADDR));
		_dprintf_("job_id_base: 0x%x -> %d\n", job_id, job_id);
	}


	//Initialization heap manager for Neuraghe l2 memory and DDR memory;
	// neu_l2init(L2_BASE_ADDRESS, 256*1024); //1M
#ifdef ZED
	neu_DDRinit((void *)(((neuADDR) socs_int[0]->ddr_addr) + 0x100U), 128U*1024U*1024U - 0x100U); //128MB
#endif
#ifdef ZC706
	neu_DDRinit((void *)(((neuADDR) socs_int[0]->ddr_addr) + 0x100U), 256U*1024U*1024U - 0x100U); //256MB - ZC706
#endif
#ifdef ZC706_DUAL2x2
	neu_DDRinit((void *)(((neuADDR) socs_int[0]->ddr_addr) + 0x100U), 256U*1024U*1024U - 0x100U); //256MB - ZC706
#endif
#ifdef ZC706_DUAL2x4
	neu_DDRinit((void *)(((neuADDR) socs_int[0]->ddr_addr) + 0x100U), 256U*1024U*1024U - 0x100U); //256MB - ZC706
#endif
#ifdef ZED_tcn
	neu_DDRinit((void *)(((neuADDR) socs_int[0]->ddr_addr) + 0x100U), 128U*1024U*1024U - 0x100U); //128MB
#endif
#ifdef ZC706_tcn
	neu_DDRinit((void *)(((neuADDR) socs_int[0]->ddr_addr) + 0x100U), 256U*1024U*1024U - 0x100U); //256MB - ZC706
#endif

         printf("memory buffers.\n");

for (soc_num=0; soc_num < _NCLUSTER_; soc_num++) {
	//External memory buffers
	socs_int[soc_num]->in  = (DATA *) neu_DDRmalloc(MAXMEM*sizeof(DATA));
	socs_int[soc_num]->out = (DATA *) neu_DDRmalloc(MAXMEM*sizeof(DATA));
}


	socs_int[0]->swap =  (DATA*) NULL;
	if(SWAPMEM)
	  socs_int[0]->swap = (DATA *) neu_DDRmalloc(SWAPMEM*sizeof(DATA));

	//FIXME this is really DEPRECATED!
	*wPointer    = (DATA *) neu_DDRmalloc(MAXMEM*sizeof(DATA));

	for (soc_num=0; soc_num < _NCLUSTER_; soc_num++) {
		_dprintf_(GREEN "\tsoc%d in       -> 0x%08x\n" NC, soc_num, (unsigned int)socs_int[soc_num]->in);
		_dprintf_(GREEN "\tsoc%d out      -> 0x%08x\n" NC, soc_num, (unsigned int)socs_int[soc_num]->out);
		_dprintf_(GREEN "\tsoc%d swap     -> 0x%08x\n" NC, soc_num, (unsigned int)socs_int[soc_num]->swap);
		_dprintf_(GREEN "\tsoc%d wPointer -> 0x%08x\n" NC, soc_num, (unsigned int)(*wPointer));
	}	

	close(fd);

}

int mmap_soc(SOCMAP* socs)
{
	_rprintf_(YELLOW "Memory mapping\n" NC);

	//printf("PAGE_SIZE: %d\n", PAGE_SIZE);
	int fd = open("/dev/mem", O_RDWR|O_SYNC );
	if (fd < 0) {
		fprintf(stderr, "open(/dev/mem) failed (%d)\n", errno);
		return  0;
	}
	//SOC0
	soc_size=(XPAR_NURAGHE_SOC_0_HIGHADDR-XPAR_NURAGHE_SOC_0_BASEADDR+1)/PAGE_SIZE;
	if ((XPAR_NURAGHE_SOC_0_HIGHADDR-XPAR_NURAGHE_SOC_0_BASEADDR+1)%PAGE_SIZE > 0) soc_size++;
	soc_size= soc_size*PAGE_SIZE;
	socs[0]->soc_addr = addr_linux(XPAR_NURAGHE_SOC_0_BASEADDR, soc_size, fd);
	_dprintf_(GREEN "\tsoc0_addr 0x%08lx      -> 0x%08lx size: %x \n" NC, (neuADDR)XPAR_NURAGHE_SOC_0_BASEADDR     , (neuADDR)(socs[0]->soc_addr), soc_size);


	//SOC0 CONTROLLER
	cntr_size=(XPAR_SOC_AXI_CTRL_V1_0_0_HIGHADDR-XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR+1)/PAGE_SIZE;
	if ((XPAR_SOC_AXI_CTRL_V1_0_0_HIGHADDR-XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR+1)%PAGE_SIZE > 0) cntr_size++;
	cntr_size= cntr_size*PAGE_SIZE;
	socs[0]->soc_cntr_addr = addr_linux(XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR, cntr_size, fd);
	
	_dprintf_(GREEN "\tsoc0_cntr_addr 0x%08lx -> 0x%08lx size: %x \n" NC, (neuADDR)XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR, (neuADDR)(socs[0]->soc_cntr_addr), cntr_size);

#if _NCLUSTER_ == 2
	//SOC1
	soc_size=(XPAR_NURAGHE_SOC_1_HIGHADDR-XPAR_NURAGHE_SOC_1_BASEADDR+1)/PAGE_SIZE;
	if ((XPAR_NURAGHE_SOC_1_HIGHADDR-XPAR_NURAGHE_SOC_1_BASEADDR+1)%PAGE_SIZE > 0) soc_size++;
	soc_size= soc_size*PAGE_SIZE;
	socs[1]->soc_addr = addr_linux(XPAR_NURAGHE_SOC_1_BASEADDR, soc_size, fd);
	_dprintf_(GREEN "\tsoc1_addr 0x%08lx      -> 0x%08lx size: %x \n" NC, (neuADDR)XPAR_NURAGHE_SOC_1_BASEADDR     , (neuADDR)(socs[1]->soc_addr), soc_size);
	
#ifdef _DUALCONTROLLER_ 
	//SOC1 CONTROLLER
	cntr_size=(XPAR_SOC_AXI_CTRL_V1_0_1_HIGHADDR-XPAR_SOC_AXI_CTRL_V1_0_1_BASEADDR+1)/PAGE_SIZE;
	if ((XPAR_SOC_AXI_CTRL_V1_0_1_HIGHADDR-XPAR_SOC_AXI_CTRL_V1_0_1_BASEADDR+1)%PAGE_SIZE > 0) cntr_size++;
	cntr_size= cntr_size*PAGE_SIZE;
	socs[1]->soc_cntr_addr = addr_linux(XPAR_SOC_AXI_CTRL_V1_0_1_BASEADDR, cntr_size, fd);
	_dprintf_(GREEN "\tsoc1_cntr_addr 0x%08lx -> 0x%08lx size: %x \n" NC, (neuADDR)XPAR_SOC_AXI_CTRL_V1_0_1_BASEADDR, (neuADDR)(socs[1]->soc_cntr_addr), cntr_size);
#else
	socs[1]->soc_cntr_addr = socs[0]->soc_cntr_addr;
#endif	
#endif

	//DDR
	ddr_size=(DDR_REMAP+DDR_SIZE-DDR_REMAP+1)/PAGE_SIZE;
	if ((DDR_REMAP+DDR_SIZE-DDR_REMAP+1)%PAGE_SIZE > 0) ddr_size++;
	ddr_size= ddr_size*PAGE_SIZE;
	socs[0]->ddr_addr = addr_linux(DDR_REMAP,ddr_size, fd);
#if _NCLUSTER_ == 2
        socs[1]->ddr_addr = socs[0]->ddr_addr;
#endif        
	_dprintf_(GREEN "\tddr_addr 0x%08lx      -> 0x%08lx size: %x \n" NC, (neuADDR)DDR_REMAP                        , (neuADDR)(socs[0]->ddr_addr), ddr_size);

#ifdef US
  //PS7_SLCR
	ps7_slcr_size=(XPAR_PSU_FPD_SLCR_S_AXI_HIGHADDR - XPAR_PSU_FPD_SLCR_S_AXI_BASEADDR + 1)/PAGE_SIZE;
	if ((XPAR_PSU_FPD_SLCR_S_AXI_HIGHADDR - XPAR_PSU_FPD_SLCR_S_AXI_BASEADDR + 1)%PAGE_SIZE > 0) ps7_slcr_size++;
	ps7_slcr_size= ps7_slcr_size*PAGE_SIZE;
	socs[0]->ps7_slcr_addr = addr_linux(XPAR_PSU_FPD_SLCR_S_AXI_BASEADDR,ps7_slcr_size, fd);
#if _NCLUSTER_ == 2
        socs[1]->ps7_slcr_addr = addr_linux(XPAR_PSU_FPD_SLCR_S_AXI_BASEADDR,ps7_slcr_size, fd);
#endif         
        
    //PS7_SLCR
	int ps7_crl_size=(XPAR_PSU_CRL_APB_S_AXI_HIGHADDR - XPAR_PSU_CRL_APB_S_AXI_BASEADDR + 1)/PAGE_SIZE;
	if ((XPAR_PSU_CRL_APB_S_AXI_HIGHADDR - XPAR_PSU_CRL_APB_S_AXI_BASEADDR + 1)%PAGE_SIZE > 0) ps7_crl_size++;
	ps7_crl_size= ps7_crl_size*PAGE_SIZE;
	int * ps7_crl_addr = addr_linux(XPAR_PSU_CRL_APB_S_AXI_BASEADDR,ps7_crl_size, fd);
	_dprintf_(GREEN "\tplref %x \n" NC, *((volatile int *)((neuADDR)ps7_crl_addr+0xc0)));
	_dprintf_(GREEN "\tps7_slcr_addr 0x%lx -> 0x%08lx size: %x \n" NC, (neuADDR)XPAR_PSU_FPD_SLCR_S_AXI_BASEADDR   , (neuADDR)(socs[0]->ps7_slcr_addr), ps7_slcr_size);
#else
  //PS7_SLCR
	ps7_slcr_size=(XPAR_PS7_SLCR_0_S_AXI_HIGHADDR - XPAR_PS7_SLCR_0_S_AXI_BASEADDR + 1)/PAGE_SIZE;
	if ((XPAR_PS7_SLCR_0_S_AXI_HIGHADDR - XPAR_PS7_SLCR_0_S_AXI_BASEADDR + 1)%PAGE_SIZE > 0) ps7_slcr_size++;
	ps7_slcr_size= ps7_slcr_size*PAGE_SIZE;
	socs[0]->ps7_slcr_addr = addr_linux(XPAR_PS7_SLCR_0_S_AXI_BASEADDR,ps7_slcr_size, fd);
#if _NCLUSTER_ == 2
        socs[1]->ps7_slcr_addr = socs[0]->ps7_slcr_addr;
#endif 
	_dprintf_(GREEN "\tps7_slcr_addr 0x%08lx -> 0x%08lx size: %x \n" NC, (neuADDR)XPAR_PS7_SLCR_0_S_AXI_BASEADDR, (neuADDR)(socs[0]->ps7_slcr_addr), ps7_slcr_size);
    
#endif
    

	
	_rprintf_(GREEN "\tMemory mapping complete!\n" NC);

	return fd;    
}

int munmap_soc(SOCMAP* socs)
{
 	_rprintf_(GREEN "Memory unmap\n" NC);
	int i;
	for (i=0;i<_NCLUSTER_;i++){
		munmap((void *)(socs[i]->soc_addr), soc_size); 
		munmap((void *)(socs[i]->soc_cntr_addr), cntr_size);
		munmap((void *)(socs[i]->ddr_addr), ddr_size);
		munmap((void *)(socs[i]->ps7_slcr_addr), ps7_slcr_size);
	}
	
	return 0;
    
}

int load_bitstream(char* bitstream_file){
	
	int bs = open(bitstream_file, O_RDONLY);
	if (bs < 0) {
	    perror("open: ");
	    return 1;
	}

	int xdev = open("/dev/xdevcfg", O_RDWR);
	if (xdev < 0) {
	    perror("open: ");
	    return 1;
	}

	if (sendfile(xdev, bs, NULL, MAXSENDFILE) < 0) {
	    perror("sendfile: ");
	    return 1;
	}

	close(xdev);
	close(bs);

	return 0;
}

int bitstream_check(void){   
	
	FILE * fd;   
        int val; 
	
	fd=fopen("/sys/class/xdevcfg/xdevcfg/device/prog_done", "r");
	
	if( fd==NULL ) {
	     perror("/sys/class/xdevcfg/xdevcfg/device/prog_done");
	     exit(1);   
	}
       
	fscanf(fd, "%d", &val);    
        fclose(fd);	

	if (val != 1)          
		return 1; //Bitstream not loaded
	else
		return 0;
}

/*
void wait_for_conv_ddr(volatile int * ddr_addr){
	while(*((volatile int *) ((neuADDR)ddr_addr + 0x0))!=0x6) {}
//	while(*((volatile int *) ((neuADDR)ddr_addr + 0x0))!=0x1) {}
	  ;
         // printf ("convdone!\n"); 
}

void wait_for_mw_ready_ddr(volatile int * ddr_addr){
	while(*((volatile int *) ((neuADDR)ddr_addr + 0x0))!=0x2) {}
//	while(*((volatile int *) ((neuADDR)ddr_addr + 0x0))!=0x1) {}

	  ;
}
*/

void wait_for_conv(volatile int * soc_cntr_addr, volatile int * soc_addr){
	 //printf ("wait convdone\n"); 
	 
	 while(*((volatile int *) ((neuADDR)soc_cntr_addr + 4))!=0x6) {}
	  ;
         *((volatile int *) ((neuADDR)soc_addr + OFFLOAD_READY_ADDR) )=0xC1A0;
         while(*((volatile int *) ((neuADDR)soc_cntr_addr + 4))!=0x0) {}

}

void wait_for_mw_ready(volatile int * soc_addr){
	 while(*((volatile int *) ((neuADDR)soc_addr + SOC_READY_ADDR))!=0x2) {}
	  ;
}

/*
void wait_for_mw_ready(volatile int * ddr_addr){
	 while(*((volatile int *) ((neuADDR)ddr_addr + 4))!=0x2) {}
	  ;
}

void trigger_conv (volatile int * ddr_addr, volatile int * soc_addr){
	*((volatile int *) ddr_addr)=0x0;
	*((volatile int *) ((neuADDR)soc_addr + OFFLOAD_READY_ADDR) )=0xABCDEF01;
}

*/
int conv_setup (volatile Conv_params * job_ptr, int in_f, int out_f, int ih, int iw, int fs_h, int fs_w, int max_og, int dil_h, int dil_w,
		         int rectifier_activ, int pooling, int qf, int precision8, int zero_padding, int w_addr, int x_addr, int y_addr){

	/* Setup the convolution layer
	 *
	 * in_f: number of INPUT FEATURES
	 * out_f: number of OUTPUT FEATURES
	 * ih: HEIGHT of the input features
	 * iw: WIDTH of the input features
	 * fs: filter size. Valid sizes are 3 and 5, at this time.
	 * max_og: number of OG in TCDM. This is a parameter of the middleware. Use ((NUM_BANKS-12)/4)-1 if not sure, it is a conservative value.
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
	 * */
	int id = job_id;
	
	if (USE_HW_POOL == 0 && pooling!=0){
	  printf ("ERROR: HW pooling is disabled!\n");
	  exit(0);
	}
	  

	_dprintf_(PURPLE "\tIF: %d\n" NC, in_f);
	_dprintf_(PURPLE "\tOF: %d\n" NC, out_f);
	_dprintf_(PURPLE "\tIH: %d\n" NC, ih);
	_dprintf_(PURPLE "\tIW: %d\n" NC, iw);
	_dprintf_(PURPLE "\tFS_h: %d\n" NC, fs_h);
	_dprintf_(PURPLE "\tFS_w: %d\n" NC, fs_w);
	_dprintf_(PURPLE "\tmaxOG: %d\n" NC, max_og);
	_dprintf_(PURPLE "\tDIL_h: %d\n" NC, dil_h);
	_dprintf_(PURPLE "\tDIL_w: %d\n" NC, dil_w);
	_dprintf_(PURPLE "\tW: 0x%x\n" NC, w_addr);
	_dprintf_(PURPLE "\tX: 0x%x\n" NC, x_addr);
	_dprintf_(PURPLE "\tY: 0x%x\n" NC, y_addr);
	_dprintf_(PURPLE "\tReLU: %d\n" NC, rectifier_activ);
	_dprintf_(PURPLE "\tPooling: %d\n" NC, pooling);
	_dprintf_(PURPLE "\tQF: %d\n" NC, qf);
	_dprintf_(PURPLE "\tprecision8: %d\n" NC, precision8);
	_dprintf_(PURPLE "\tZPadd: %d\n" NC, zero_padding);

	//_tcreate_(time);

	_dprintf_("job_id: %d\n", job_id);

	//Register configuration

	//volatile Conv_params* job_ptr = task_ptr + job_id;
	_dprintf_("job_ptr : 0x%lx\n", job_ptr);
	

	
        //_dprintf_("job_ptr->run: 0x%lx \n", &(job_ptr->run));
        //_dprintf_("job_ptr->run: 0x%lx \n",  job_ptr->run  );

	//Check for free space
	while(*(volatile uint32_t *)&job_ptr->run);

	job_ptr->IF              = in_f;
	job_ptr->OF              = out_f;
	job_ptr->IH              = ih;
	job_ptr->IW              = iw;
	job_ptr->FS_h            = fs_h;
	job_ptr->FS_w            = fs_w;
	job_ptr->MAX_OG          = max_og;
	job_ptr->max_stores      = 1;
	job_ptr->w_ext           = w_addr;
	job_ptr->x_ext           = x_addr;
	job_ptr->y_ext           = y_addr;
	job_ptr->rectifier_activ = rectifier_activ;
	job_ptr->pooling_hw      = pooling;
	job_ptr->qf              = qf;
	job_ptr->precision8	 = precision8;
	job_ptr->zero_padding    = zero_padding;
	job_ptr->dil_h           = dil_h;
	job_ptr->dil_w           = dil_w;

	//Trigger conv
	job_ptr->run = 1;

    job_id = (job_id + 1) % MAX_JOBS;

	//_tprintf_("Write-Reg time: %5.3f ms\n", (get_wall_time()-time)/1000);

	return 0;
}


void use_default_conv_test(){
    /* Conv_test has a default test with auto-generated features and weights.
     * If the control code is invalid the default test will be used.
     * */
	*((volatile int*)(CONV_SETUP_ADDR + NUM_BANKS*4*0)) = 0x00000000; // reset control code
}

#ifdef MEM_MAPPING
int * addr_linux(neuADDR addr, int size, int fd)
{
    neuADDR offset, base;
    unsigned long int *mm;


    offset = addr;

    base = offset & PAGE_MASK;
    offset &= ~PAGE_MASK;

    mm = (unsigned int*)mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, base);
    if (mm == MAP_FAILED) {
        fprintf(stderr, "mmap64(0x%x@0x%lx) failed (%d)\n",size, base, errno);
        return (int*)0;
    }
   // printf("addr_linux: 0x%lx\n\r", mm+offset);
    return (int*)((long int)mm + offset);
}
#endif


void load_instr (volatile int * soc_addr){
	/* Loads into L2 memory the instructions of the test.
	 *
	 * The function reads the array l2_code and writes its content into L2 through the Zynq - PL AXI interconnect.
	 * l2_code array must be defined into the header file specific for each test. See the top of this file.
	 */

    int i;

	volatile int * l2_ptr = (volatile int *) ((neuADDR)soc_addr + 0xC000000);

	_rprintf_(YELLOW "Loading code in L2 at address 0x%08lx...\n" NC, (neuADDR)l2_ptr);
	_rprintf_(YELLOW "\tsize: %d\n" NC, CODE_SIZE);

	for(i=0;i<CODE_SIZE;i++){
		l2_ptr[i]=l2_code[i];
    }

	_rprintf_(GREEN "\tLoading complete!\n" NC);

}




void fetch_enable (volatile int * soc_cntr_addr){
	/* Enables the fetch signal for the PL core.
	 * Immediately after the programming of the chip the core is clock gated waiting for the fetch signal.
	 * */
	*((volatile int*)((neuADDR) soc_cntr_addr))=0x1;

	_rprintf_(YELLOW "Fetch is enabled.\n" NC);
}

void fetch_disable (volatile int * soc_cntr_addr){
	/* Disables the fecth signal. See fetch_enable
	 * */
	*((volatile int*)((neuADDR) soc_cntr_addr))=0x0;

	_rprintf_(YELLOW "Fetch is disabled.\n" NC);

}

void wait_eoc (volatile int * soc_cntr_addr) {
	/* After fetch is enabled the core starts the computation. Some tests runs until they reach the end of the program.
	 * The last instruction is eoc() that assert the end-of-computation signal. The control IP catch the signal and writes 1
	 * in a specific register.
	 * */
	_dprintf_(GREEN "Waiting for EOC...\n" NC);

	while(*((volatile int*)EOC_ADDR)==0);

	fetch_disable ( soc_cntr_addr);

	_dprintf_(GREEN "EOC caught!\n" NC);
}

void wait_for (long int num){
  /* Wait for a while. The time depends on ARM working frequency and on the number of instructions used to implement the for statement.
   * */
	for (;num>0;num--);
}

/*
void read_tcdm (volatile int *from, int nrow){
	
	// Prints a nrow number of row of the TCDM starting from from address.
	// this function prints the content with the TCDM organization.
	 
	int i;
	volatile int * from_int;

	from_int = (volatile int *) (((neuADDR)from) & 0xFFFFFFC0);

	int len=nrow*NUM_BANKS;

	printf ("\nRow          \tBank_0               \tBank_1               \tBank_2               \tBank_3               \tBank_4               \tBank_5               \tBank_6                \tBank_7               \tBank_8               \tBank_9               \tBank_A               \tBank_B               \tBank_C               \tBank_D               \tBank_E               \tBank_F");
	printf ("          \tBank_10               \tBank_11               \tBank_12               \tBank_13               \tBank_14               \tBank_15               \tBank_16                \tBank_17               \tBank_18               \tBank_19               \tBank_1A               \tBank_1B               \tBank_1C               \tBank_1D               \tBank_1E               \tBank_1F");


	for (i=0;i<len;i++){
	  if (i%NUM_BANKS == 0)
		  printf ("\n[0x%04x]  \t",(((neuADDR)(&from_int[i]))&0x7FFFF)>>7);
	  printf ("0x%08x      \t", from_int[i]);
	}
	printf ("\n");
}
void read_mem (volatile int *from, int len, int stride) {
    //Prints values contained in a generic memory (it can be DDR, L2 memory or TCDM) int by int.
    // In TCDM word are read with the word-interleaving mapping (COREs mapping).
    //
    // *from: start address
    // len: num of int to be read
    // stride: step between two int.
    //
    // Stride is usefull if you want to read the content of a single bank setting stride to NUM_BANKS.
    //
    // This functions prints values int by int without any visual organization.
    
	int i;
	for (i=0;i<len;i++){
		if ((neuADDR)&from[i*stride]>=0x50000000 && (neuADDR)&from[i*stride]<0x50040000)
		  printf ("TCDM_%d[0x%08x]: 0x%08x\n", ((neuADDR)&from[i*stride]>>2)%NUM_BANKS, (neuADDR)&from[i*stride], from[i*stride]); //bank, address, data

		if ((neuADDR)&from[i*stride]>=0x5C000000 && (neuADDR)&from[i*stride]<0x5C040000)
		  printf ("L2[0x%08x]: 0x%08x\n",(neuADDR)&from[i*stride],from[i*stride]); // address, data

		if ((neuADDR)&from[i*stride]>=0x00100000 && (neuADDR)&from[i*stride]<0x40000000)
		  printf ("DDR[0x%08x]: 0x%08x\n",(neuADDR)&from[i*stride],from[i*stride]); // address, data
	}

}
*/

#ifdef US
  #define REL_ADDR_FCLK 0xD0
  #define REL_ADDR_DIVCLK 0xC0
#else
  #define REL_ADDR_FCLK 0x178
  #define REL_ADDR_DIVCLK 0x170
#endif
void print_clk(int* ps7_slcr_addr){
	/* Prints some informations about the PL clock generated by ZYNQ. See Xilinx documentation for further informations
	 * */
#ifdef _DEBUG_
        //int reg = *((volatile int*)0xF8000170);
	
        printf("print clock\n");
	printf("slcr: 0x%x\n\r", (neuADDR)ps7_slcr_addr+REL_ADDR_DIVCLK);
        int reg = *((volatile int*)((neuADDR)ps7_slcr_addr + REL_ADDR_DIVCLK));
	int div0=(reg & 0x00003F00)>>8;
	int div1=(reg & 0x03F00000)>>20;

	int freq= (1000/div0)/div1;

	printf ("FPGA0_clk_reg: 0x%08x\n", reg);
	printf ("\tDiv0: %d\n", div0);
	printf ("\tDiv1: %d\n", div1);
	printf ("\tFPGA0_clk_freq: %d MHz\n", freq);

	printf ("\tclk0_freq:      %d MHz\n", freq/2);
	printf ("\tclkfast_freq:   %d MHz\n", freq);

	printf ("Print_clk end\n\r");
	
#endif
}

void set_fclk_div(int* ps7_slcr_addr, int div0, int div1){
	/* Set clock dividers to change the PL clock frequency. See Xilinx documentation for further informations
           please see Xilinx documentation: UG585
	 * */

	int val = 0x00000000;

	val = val | div0<<8 | div1<<20;

	unlock_ps_regs (ps7_slcr_addr);

	*((int*)((neuADDR)ps7_slcr_addr + REL_ADDR_DIVCLK)) = val;

	lock_ps_regs (ps7_slcr_addr);

	_dprintf_ (GREEN "FPGA0_clk new: 0x%08x\n" NC, *((volatile int*)((neuADDR)ps7_slcr_addr + REL_ADDR_DIVCLK)));
}

void stop_fclk(int* ps7_slcr_addr){
	/* Stops PL clock
	 * */

	int val = 0x00000001;

	unlock_ps_regs (ps7_slcr_addr);

	*((int*)((neuADDR)ps7_slcr_addr + REL_ADDR_FCLK)) = val;
	//*((int*)0xF8000178) = val;

	lock_ps_regs (ps7_slcr_addr);

	_dprintf_ (GREEN "FPGA0_clk stopped: %08x\n" NC, *((volatile int*)((neuADDR)ps7_slcr_addr + REL_ADDR_FCLK)));
}

void start_fclk(int* ps7_slcr_addr){
	/* Starts PL clock
	 * */

	int val = 0x00000000;

	unlock_ps_regs (ps7_slcr_addr);

	*((int*)((neuADDR)ps7_slcr_addr + REL_ADDR_FCLK)) = val;
        //*((int*)0xF8000178) = val;

	lock_ps_regs (ps7_slcr_addr);

	_dprintf_ (GREEN "FPGA0_clk started\n" NC);
}


void unlock_ps_regs (int* ps7_slcr_addr){
	/* Remove the protection of specific registers of the PS if you want to change their values.
	 * */
	 *((int*)((neuADDR)ps7_slcr_addr + 0x8)) = 0xDF0D; // unlock 
       
 // *((int*)0XF8000008) = 0xDF0D;
}

void lock_ps_regs(int* ps7_slcr_addr){
	/* Set the protection of specific registers of the PS.
		 * */
	*((int*)((neuADDR)ps7_slcr_addr + 0x4)) = 0x767B; //lock
	//*((int*)0XF8000004) = 0x767B; //lock
}
