/*
 * ConvLayer.cc
 *
 *  Created on: May 30, 2016
 *      Author: alessandro
 */
/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     Convolutional neural network                                  *
 * File:        ConvLayer.c                                                   *
 * Description: Sources codes of all procedures declared in ConvLayer.c       *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <math.h>
#include "types.h"
#include "ConvLayer.h"

int addr_ps_to_pl(long int addr, volatile int* ddr_addr){
	//printf("\t 0x%x - 0x%x = 0x%x\n", addr,(int)ddr_addr, addr-(int)ddr_addr);
	return (int)(((addr-(long int)ddr_addr)&0x0FFFFFFF)|0x80000000);
}

int addr_pl_to_ps(int addr){
	return addr;
}

int conv_hwce(volatile int * ddr_addr, volatile Conv_params * job_ptr, DATA *W, DATA *x,
         int in_depth, int out_depth, int in_height, int in_width, int fs_h, int fs_w, int maxog, int dil_h, int dil_w, int activation, int pooling, int qf, int precision8, int zero_padding, DATA *y){

    //printf("setup ... \n");
    //use_default_conv_test();
    int job_id = conv_setup (
             job_ptr,
             in_depth, // in_f
             out_depth, // out_f
             in_height, // ih
             in_width, // iw
             fs_h, // fs
	           fs_w,
             maxog, // max_og
	           dil_h,
	           dil_w,
             activation, //activation
             pooling, //pooling
             qf, //qf
             precision8,
             zero_padding, //enable zero padding 
             addr_ps_to_pl((long int) W, ddr_addr), // w_addr
             addr_ps_to_pl((long int) x, ddr_addr), // x_addr
             addr_ps_to_pl((long int) y, ddr_addr)); // y_addr

    //printf("setup done \n");
    //_dprintf_(CYAN "\t[ARM] Triggering conv...\n" NC);

    //trigger_conv(ddr_addr, soc_addr);
    
    //_dprintf_(CYAN "\t[ARM] Waiting for conv...\n" NC);

    //wait_for_conv_ddr(ddr_addr);

    //volatile Conv_params* job_ptr = task_ptr + job_id;
    //while(*(volatile uint32_t *)&job_ptr->run);

    return 0;
}

int ConvLayer_exec(SOCMAP soc, SPATCONV sc, DATA* in, DATA* out, int in_height, int in_width, int activation, int pooling, int qf, int precision8, int zero_padding){
    /**
    This procedure executes a convolution and then the ReLU activation function if activation is asserted
    **/
   // int i;
    _dprintf_(YELLOW "[ARM] Executing Convlayer...\n" NC);

    //int ih = (in_height%2)? in_height+1 : in_height;
    int ih = in_height;
    int iw = (in_width%2)? in_width+1 : in_width;
    
    int next_job_id=*((volatile int*)((neuADDR)soc->soc_addr + JOB_ADDR));

    _dprintf_(CYAN "\tin            -> 0x%08lx -> 0x%08lx\n" NC, (unsigned long int)in, addr_ps_to_pl((long int)in, soc->ddr_addr));
    _dprintf_(CYAN "\tout           -> 0x%08lx -> 0x%08lx\n" NC, (unsigned long int)out, addr_ps_to_pl((long int)out, soc->ddr_addr));
    _dprintf_(CYAN "\tweights       -> 0x%08lx -> 0x%08lx\n" NC, (unsigned long int)sc->kernel, addr_ps_to_pl((long int)sc->kernel, soc->ddr_addr));
    _dprintf_(CYAN "\tddr_addr      -> 0x%08lx\n" NC, (unsigned long int)soc->ddr_addr);
    _dprintf_(CYAN "\tsoc_addr      -> 0x%08lx\n" NC, (unsigned long int)soc->soc_addr);
    _dprintf_(CYAN "\ttask_ptr      -> 0x%08lx\n" NC, (unsigned long int)soc->task_ptr);
    _dprintf_(CYAN "\tnext_job_id   -> 0x%08lx\n" NC, (unsigned long int)next_job_id);

    int job_id = conv_hwce(
                soc->ddr_addr,
    		soc->task_ptr + next_job_id,
    		sc->kernel,
		in,
		sc->kern_s[1],
		sc->kern_s[0],
		ih,
		iw,
		sc->kern_s[2],
		sc->kern_s[3],
                sc->maxog,
		sc->dil[0],
		sc->dil[1],
		activation,
		pooling,
		qf,
		precision8,
		zero_padding,
		out);
		
		job_id = next_job_id;

    _dprintf_("job_id: %d\n", job_id);

    //_dprintf_(GREEN "\t[OK] Execution complete!\n" NC);
    next_job_id= (job_id + 1) % MAX_JOBS;
    *((volatile int*)((neuADDR)soc->soc_addr + JOB_ADDR)) = next_job_id;
    return job_id;
}

void ConvLayer_wait(SOCMAP soc, int job_id)
{
    int status=0;
    _dprintf_(CYAN "\t[ARM] Waiting for conv...\n" NC);
    //wait_for_conv_ddr((volatile int *) soc->ddr_addr);
    volatile Conv_params* job_ptr = soc->task_ptr + job_id;

    while(*(volatile uint32_t *)&job_ptr->run==1);
    status = *(volatile uint32_t *)&job_ptr->run;
   // printf("status %d\n",status);
    if (status == 100){
      printf (RED "\t[ERROR] SoC returned error 100\n" NC);
      printf (RED "\t\tTiling error. The tiles are too small or IH<FS.\n" NC);

      //remove("/tmp/lockPL.neuraghe"); //unlockPL
      exit(status);
     
    }
}

