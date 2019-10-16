/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Gianfranco Deriu - gian.deriu@gmail.com                      *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     NURAGHE - Accelerator for Convolutional neural network        *
 * File:                                                                      *
 * Description:                                                               *
 *                                                                            *
 ******************************************************************************/


/********************************************************************************************
 * ******************************* BAREMETAL - LINUX SWITCH *********************************
 ********************************************************************************************
 * To switch between baremetal and linux version comment or uncomment the define in params.h
 * then change the active build configuration (right click on project folder in Project Explore pane):
 * Debug -> for baremetal
 * Linux -> for Linux (of course)
 *
 *
 */


#include "cnn_layers/cnn.h"
#include "params.h"
#include <stdio.h>

#include "soc_drivers.h"

#ifdef BAREMETAL
	#include "platform.h"
#endif

void print_stream            (int16_t * stream, int h, int w, int n_feat);
void deinterlace             (int * dest, int * src, int n, int len_dest_B);
void interlace               (int * dest, int * src, int n, int len_dest_B);
void zeros_fill              (int16_t *w, int len_B);
void copy_stream             (int16_t * dest, int16_t * src, int len_B);
void round4_features         (int16_t * dest, int16_t * src, int in_f);
void print_results           (data_t * y, int nr_classes, int posit, int label);
void print_interlaced_stream (data_t * stream, int h, int w, int n_feat);
void print_stream            (data_t * stream, int h, int w, int n_feat);
void print_image             (data_t * image, int h, int w);


/************************************/
/* ███╗   ███╗ █████╗ ██╗███╗   ██╗ */
/* ████╗ ████║██╔══██╗██║████╗  ██║ */
/* ██╔████╔██║███████║██║██╔██╗ ██║ */
/* ██║╚██╔╝██║██╔══██║██║██║╚██╗██║ */
/* ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║ */
/* ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ */
/************************************/
int main()
{
   //init_platform();


#ifdef BAREMETAL
	cleanup_platform();
#endif

    printf("\n\n***************  Start Test  ***************\n\n");

    /*
     *   __  __                                              _
        |  \/  | ___ _ __ ___    _ __ ___   __ _ _ __  _ __ (_)_ __   __ _
        | |\/| |/ _ \ '_ ` _ \  | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` |
 	 	| |  | |  __/ | | | | | | | | | | | (_| | |_) | |_) | | | | | (_| |
 	 	|_|  |_|\___|_| |_| |_| |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |
                                         	 	|_|   |_|            |___/
     */

	int * soc_addr;
	int * soc_cntr_addr;
	int * ddr_addr;

#ifdef MEM_MAPPING
    YELLOW
	printf ("[ARM] Memory mapping\n");

    //printf("PAGE_SIZE: %d\n", PAGE_SIZE);
    int fd = open("/dev/mem", O_RDWR|O_SYNC );
	if (fd < 0) {
		fprintf(stderr, "open(/dev/mem) failed (%d)\n", errno);
		return  0;
	}

	int size;

    //SOC
    size=(XPAR_ULPSOC_0_HIGHADDR-XPAR_ULPSOC_0_BASEADDR+1)/PAGE_SIZE;
    if ((XPAR_ULPSOC_0_HIGHADDR-XPAR_ULPSOC_0_BASEADDR+1)%PAGE_SIZE > 0) size++;
    size= size*PAGE_SIZE;
    soc_addr      = addr_linux(XPAR_ULPSOC_0_BASEADDR, size, fd);


    //SOC CONTROLLER
    size=(XPAR_SOC_AXI_CTRL_V1_0_0_HIGHADDR-XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR+1)/PAGE_SIZE;
	if ((XPAR_SOC_AXI_CTRL_V1_0_0_HIGHADDR-XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR+1)%PAGE_SIZE > 0) size++;
	size= size*PAGE_SIZE;
	soc_cntr_addr = addr_linux(XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR,size, fd);


	//DDR
	size=(DDR_REMAP+0x0FFFFFFF-DDR_REMAP+1)/PAGE_SIZE;
	if ((DDR_REMAP+0x0FFFFFFF-DDR_REMAP+1)%PAGE_SIZE > 0) size++;
	size= size*PAGE_SIZE;
	ddr_addr = addr_linux(DDR_REMAP,size, fd);



    CYAN
    printf ("\tsoc_addr 0x%08x      -> 0x%08x\n", (int)XPAR_ULPSOC_0_BASEADDR, (int)soc_addr);
    printf ("\tsoc_cntr_addr 0x%08x -> 0x%08x\n", (int)XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR, (int)soc_cntr_addr);
    printf ("\tddr_addr 0x%08x      -> 0x%08x\n", (int)DDR_REMAP, (int)ddr_addr);
    NC
    GREEN
    printf ("\t[OK] Memory mapping complete!\n");
#else
    soc_addr      = (int*)XPAR_ULPSOC_0_BASEADDR;
    soc_cntr_addr = (int*)XPAR_SOC_AXI_CTRL_V1_0_0_BASEADDR;
	ddr_addr      = (int*)DDR_REMAP;
#endif




    /*
     *   _                    _ _                             _
 	 	| |    ___   __ _  __| (_)_ __   __ _    ___ ___   __| | ___
 	 	| |   / _ \ / _` |/ _` | | '_ \ / _` |  / __/ _ \ / _` |/ _ \
 	 	| |__| (_) | (_| | (_| | | | | | (_| | | (_| (_) | (_| |  __/
 	 	|_____\___/ \__,_|\__,_|_|_| |_|\__, |  \___\___/ \__,_|\___|
                                 	 	|___/
     Loading instructions into L2 for cores into the programmable logic
     */

    load_instr((volatile int *)soc_addr);




/*
 *    ____ _   _ _   _            _
     / ___| \ | | \ | |  ___  ___| |_ _   _ _ __
    | |   |  \| |  \| | / __|/ _ \ __| | | | '_ \
    | |___| |\  | |\  | \__ \  __/ |_| |_| | |_) |
     \____|_| \_|_| \_| |___/\___|\__|\__,_| .__/
                                           |_|
 */

    YELLOW
	printf ("[ARM] CNN setup...\n");
	NC

    int if_round;

    //printf ("1\n");
	///An interface of all changeable parameters follows
	int in_height        = 28; //input parameters
	int in_width         = 28;
	int in_ft            = 1;


	if_round=in_ft/4;
	if (in_ft%4>0) if_round++;
	if_round=if_round*4;



	int c0_out_ft        = 8;
	int c0_filter_height = 5;
	int c0_filter_width  = 5;

	int p0_height;
	int p0_width;
	int p0_pool_height   = 2;
	int p0_pool_width    = 2;
	int p0_out_height;
	int p0_out_width;
	int p0_stride        = 2;

	int c1_out_ft        = 16;
	int c1_filter_height = 5;
	int c1_filter_width  = 5;

	int p1_height;
	int p1_width;
	int p1_pool_height   = 2;
	int p1_pool_width    = 2;
	int p1_out_height;
	int p1_out_width;
	int p1_stride        = 2;

	int fc_out_ft        = 128;
	int fc_out_height    = 1;
	int fc_out_width     = 1;

	int nr_classes       = 10;

    //printf ("2\n");
	///Calculation of sizes of all features for each internal hidden layer
	p0_height     = in_height-c0_filter_height+1; ///because stride=1 and there is not zero-padding (N-K)/S + 1 where S represents the stride
	p0_width      = in_width-c0_filter_width+1;
	p0_out_height = out_feat_size(p0_height,p0_pool_height,p0_stride);
	p0_out_width  = out_feat_size(p0_width,p0_pool_width,p0_stride);

    //printf ("3\n");
	p1_height     = p0_out_height-c1_filter_height+1;
	p1_width      = p0_out_width-c1_filter_width+1;
	p1_out_height = out_feat_size(p1_height,p1_pool_height,p1_stride);
	p1_out_width  = out_feat_size(p1_width,p1_pool_width,p1_stride);

	//int dim_c0    = in_ft*c0_out_ft*c0_filter_height*c0_filter_width;

   // printf ("4\n");
	//int dim_c1    = c0_out_ft*c1_out_ft*c1_filter_height*c1_filter_width;

	int dim_fw    = c1_out_ft*fc_out_ft*p1_out_height*p1_out_width;
	int dim_fb    = fc_out_ft;

	int dim_sw    = fc_out_ft*fc_out_height*fc_out_width*nr_classes;
	int dim_sb    = nr_classes;

	///Memory allocation of all arrays that we need such as the main input x and the main output y.
	data_t x[in_ft*in_height*in_width];

	//printf ("Structs\n");
	// *************************** LAYER STRUCT ALLOCATING ***************************


	ConvLayer    *conv_layer0 = (ConvLayer *)   malloc(sizeof(ConvLayer));
	PoolLayer    *pool_layer0 = (PoolLayer *)   malloc(sizeof(PoolLayer));
	ConvLayer    *conv_layer1 = (ConvLayer *)   malloc(sizeof(ConvLayer));
	PoolLayer    *pool_layer1 = (PoolLayer *)   malloc(sizeof(PoolLayer));
	FullLayer    *fc_layer    = (FullLayer *)   malloc(sizeof(FullLayer));
	SoftmaxLayer *sfm_layer   = (SoftmaxLayer *)malloc(sizeof(SoftmaxLayer));


	// *************************** DATA ARRAY *******************************
	//conv0
//	data_t * y0       = (data_t *)malloc(c0_out_ft*p0_height*p0_width*sizeof(data_t));
	data_t * x0_zerofill       = (data_t *)malloc(if_round*in_height*in_width*sizeof(data_t));

	data_t * x0_hwce    = (data_t *)((int)ddr_addr + 0x100);
	data_t * c0_wb_hwce = (data_t *)((int)ddr_addr + 0x10000);
	data_t * y0_hwce    = (data_t *)((int)ddr_addr + 0x20000);
	//printf ("x0_hwce 0x%08x\n",(int)x0_hwce);

    //poll0
//	data_t * deintrlaced_array = (data_t *)calloc(28*28*16,sizeof(data_t));

    //conv1
//	data_t * y1       = (data_t *)malloc(c1_out_ft*p1_height*p1_width*sizeof(data_t));

	data_t * x1_hwce    = (data_t *)((int)ddr_addr + 0x30000);
	data_t * c1_wb_hwce = (data_t *)((int)ddr_addr + 0x40000);
	data_t * y1_hwce    = (data_t *)((int)ddr_addr + 0x50000);

    //pool1
	data_t * y1_pool1 = (data_t *)malloc(c1_out_ft*p1_out_height*p1_out_width*sizeof(data_t));
	data_t * y1_pool1_deintr = (data_t *)calloc(c1_out_ft*p1_out_height*p1_out_width,sizeof(data_t));


    //fullconnected
	data_t *fc_w      = (data_t *)malloc(c1_out_ft*fc_out_ft*p1_out_height*p1_out_width*sizeof(data_t));
	data_t *fc_b      = (data_t *)malloc(fc_out_ft*sizeof(data_t));
	data_t *y_full    = (data_t *)malloc(fc_out_ft*fc_out_height*fc_out_width*sizeof(data_t));

    //softmax
	data_t *sfm_w     = (data_t *)malloc(fc_out_ft*fc_out_height*fc_out_width*nr_classes*sizeof(data_t));
	data_t *sfm_b     = (data_t *)malloc(nr_classes*sizeof(data_t));
	data_t *y         = (data_t *)malloc(nr_classes*sizeof(data_t));



	ConvLayer_new(conv_layer0,c0_wb_hwce,if_round,c0_out_ft,c0_filter_height,c0_filter_width,in_height,
			in_width,p0_height,	p0_width,	1,	1);

	PoolLayer_new(	pool_layer0,c0_out_ft,p0_pool_height,	p0_pool_width,	p0_height,	p0_width,
			p0_out_height,	p0_out_width,	p0_stride);

	ConvLayer_new(	conv_layer1,	c1_wb_hwce,	c0_out_ft,	c1_out_ft,	c1_filter_height,	c1_filter_width,
			p0_out_height,	p0_out_width,	p1_height,	p1_width,		1,			1);

	PoolLayer_new(	pool_layer1,	c1_out_ft,	p1_pool_height,		p1_pool_width,		p1_height,
			p1_width,		p1_out_height,		p1_out_width,		p1_stride);

	FullLayer_new(	fc_layer,	c1_out_ft,	fc_out_ft,	p1_out_height,	p1_out_width,1,		fc_w,		fc_b);

	SoftmaxLayer_new(		sfm_layer,		fc_out_ft,		nr_classes,		1,		1,		sfm_w,		sfm_b);

	GREEN
	printf ("\t[OK] Setup complete\n");
	NC


    YELLOW
    printf ("[ARM] Sampling of weights and biases\n");
	NC
	// *************************** Sampling of weights and biases ***************************
	int k;

//	ddr_addr [0]= 0xc1a0;
 //   printf ("0x%x\n",ddr_addr [0]);
	    for(k=0;k<28*4*8;k++)
	    	//c0_wb_hwce[k]=conversion_float_to_data_t(wb_layer0[k]);
	    	c0_wb_hwce[k]=(wb_layer0[k]);

	    for(k=0;k<28*8*16;k++)
	    	//c1_wb_hwce[k]=conversion_float_to_data_t(wb_layer1[k]);
	        c1_wb_hwce[k]=(wb_layer1[k]);


		for(k=0;k<dim_fw;k++){
			fc_w[k]=conversion_float_to_data_t(weights_full[k]);
			//printf ("[%d] %f -> %x\n",k, weights_full[k], fc_w[k]);
		}
		for(k=0;k<dim_fb;k++)
			fc_b[k]=conversion_float_to_data_t(bias_full[k]);
		for(k=0;k<dim_sw;k++)
			sfm_w[k]=conversion_float_to_data_t(weights_softmax[k]);
		for(k=0;k<dim_sb;k++)
			sfm_b[k]=conversion_float_to_data_t(bias_softmax[k]);

		GREEN
		    printf ("\t[OK] Sampling complete!\n");
			NC

/*
 *      _                      _   _                __      _       _                          _     _
       / \   ___ ___  ___ _ __| |_(_)_ __   __ _   / _| ___| |_ ___| |__       ___ _ __   __ _| |__ | | ___
      / _ \ / __/ __|/ _ \ '__| __| | '_ \ / _` | | |_ / _ \ __/ __| '_ \     / _ \ '_ \ / _` | '_ \| |/ _ \
     / ___ \\__ \__ \  __/ |  | |_| | | | | (_| | |  _|  __/ || (__| | | |      __/ | | | (_| | |_) | |  __/
    /_/   \_\___/___/\___|_|   \__|_|_| |_|\__, | |_|  \___|\__\___|_| |_| ___\___|_| |_|\__,_|_.__/|_|\___|
                                           |___/                          |___|
 */

	fetch_enable (soc_cntr_addr);
    wait_for_conv(ddr_addr);




/*
 *   _____         _     _
    |_   _|__  ___| |_  | | ___   ___  _ __
      | |/ _ \/ __| __| | |/ _ \ / _ \| '_ \
      | |  __/\__ \ |_  | | (_) | (_) | |_) |
      |_|\___||___/\__| |_|\___/ \___/| .__/
                                      |_|
 */

    int tries;
	int score=0;
	int number_tries=2;  ///number_tries is the number of images we are going to test. score is the number of scores

	float percentage;///percentage represents the test accuracy
    BLUE
    printf ("Num of tries %d\n", number_tries);
    NC
	///Loop of test images
	for(tries=0;tries<number_tries;tries++){

	  //int pos=rand() % 4999; //No more than 4999
		int pos=tries;
		int j=0,i;
		int label = labels[pos];

		///Sampling of the i-th image
		for(i=pos*in_height*in_width;i<pos*in_height*in_width+in_height*in_width;i++){
		   // float temp = mnist_first_image[i];
			float temp = features[i];

			if(temp!=0){
				x[j]=conversion_float_to_data_t(temp);
			}
			else{
				x[j]=0;
			}
			//if (j<100)
			//  printf ("x[%d]: %f; 0x%x\n", j, temp, x[j]);

			j++;
		}




/*
  ____                                                   _
 |  _ \ _ __ ___       _ __  _ __ ___   ___ ___  ___ ___(_)_ __   __ _
 | |_) | '__/ _ \_____| '_ \| '__/ _ \ / __/ _ \/ __/ __| | '_ \ / _` |
 |  __/| | |  __/_____| |_) | | | (_) | (_|  __/\__ \__ \ | | | | (_| |
 |_|   |_|  \___|     | .__/|_|  \___/ \___\___||___/___/_|_| |_|\__, |
                      |_|                                        |___/
 */


		print_image (x, 28, 28);

		//print_stream (x, 28,28,1);

		YELLOW
		printf ("[ARM] Input features pre-processing...\n");
		NC

		round4_features (x0_zerofill, x, 1);
		interlace ((int*)x0_hwce, (int*)x0_zerofill, 4, 28*28*2);
		GREEN
		printf ("\t[OK] Pre-processing complete!\n");
		NC


/*
        _     _     _     _     _     _              _
       / |___| |_  | |__ (_) __| | __| | ___ _ __   | | __ _ _   _  ___ _ __
       | / __| __| | '_ \| |/ _` |/ _` |/ _ \ '_ \  | |/ _` | | | |/ _ \ '__|
       | \__ \ |_  | | | | | (_| | (_| |  __/ | | | | | (_| | |_| |  __/ |
       |_|___/\__| |_| |_|_|\__,_|\__,_|\___|_| |_| |_|\__,_|\__, |\___|_|
                                                       |___/
 *
 * */

		///FIRST HIDDEN LAYER
		///Execution of the first Convolutional Layer

		//print_interlaced_stream (x0_hwce, 28,28,4);

		ConvLayer_exec(ddr_addr,soc_addr,conv_layer0,x0_hwce,y0_hwce);

		//print_interlaced_stream (y0_hwce, 24,24,8);

		///Execution of the first Max Pooling Layer

		PoolLayer_exec(pool_layer0,y0_hwce,x1_hwce);

		//print_interlaced_stream (x1_hwce, 12,12,8);

		/*
		 ____            _   _     _     _     _              _
		|___ \ _ __   __| | | |__ (_) __| | __| | ___ _ __   | | __ _ _   _  ___ _ __
          __) | '_ \ / _` | | '_ \| |/ _` |/ _` |/ _ \ '_ \  | |/ _` | | | |/ _ \ '__|
         / __/| | | | (_| | | | | | | (_| | (_| |  __/ | | | | | (_| | |_| |  __/ |
        |_____|_| |_|\__,_| |_| |_|_|\__,_|\__,_|\___|_| |_| |_|\__,_|\__, |\___|_|
                                                                      |___/
*/

		///Execution of the second Convolutional Layer

		ConvLayer_exec(ddr_addr,soc_addr, conv_layer1,x1_hwce,y1_hwce);

	//	read_tcdm ((volatile int *)TCDM_BASE_ADDRESS, 40);

		//print_interlaced_stream (y1_hwce, 8,8,16);

		///Execution of the second Max Pooling Layer

		PoolLayer_exec(pool_layer1,y1_hwce,y1_pool1);

		/*
		 *     ____           _                                          _
              |  _ \ ___  ___| |_      _ __  _ __ ___   ___ ___  ___ ___(_)_ __   __ _
              | |_) / _ \/ __| __|____| '_ \| '__/ _ \ / __/ _ \/ __/ __| | '_ \ / _` |
              |  __/ (_) \__ \ ||_____| |_) | | | (_) | (_|  __/\__ \__ \ | | | | (_| |
              |_|   \___/|___/\__|    | .__/|_|  \___/ \___\___||___/___/_|_| |_|\__, |
                                      |_|                                        |___/
   		 */

		deinterlace ((int*)y1_pool1_deintr, (int*)y1_pool1, 16, p1_out_height*p1_out_width*2);

		//print_stream (y1_pool1_deintr, 4,4,16);


/*
 *   _____      _ _   _
    |  ___|   _| | | | | __ _ _   _  ___ _ __
    | |_ | | | | | | | |/ _` | | | |/ _ \ '__|
    |  _|| |_| | | | | | (_| | |_| |  __/ |
    |_|   \__,_|_|_| |_|\__,_|\__, |\___|_|
                              |___/
 */


		///Execution of the Full Connected Layer

		FullLayer_exec(fc_layer,y1_pool1_deintr,y_full);

		//print_stream (y_full, 1,1,128);
/*
 *   ____         __ _                          _
    / ___|  ___  / _| |_ _ __ ___   __ ___  __ | | __ _ _   _  ___ _ __
    \___ \ / _ \| |_| __| '_ ` _ \ / _` \ \/ / | |/ _` | | | |/ _ \ '__|
     ___) | (_) |  _| |_| | | | | | (_| |>  <  | | (_| | |_| |  __/ |
    |____/ \___/|_|  \__|_| |_| |_|\__,_/_/\_\ |_|\__,_|\__, |\___|_|
                                                        |___/
 */

		///Execution of the Softmax Layer

		SoftmaxLayer_exec(sfm_layer,y_full,y);

		//print_stream (y, 1,10,1);

/*
 *   ____                 _ _
    |  _ \ ___  ___ _   _| | |_ ___
    | |_) / _ \/ __| | | | | __/ __|
    |  _ <  __/\__ \ |_| | | |_\__ \
    |_| \_\___||___/\__,_|_|\__|___/

 */



		///Calculation of the most correlated class
		data_t max_d=*(y+0);
		int posit=0;
		for(i=1;i<nr_classes;i++){
			if(max_d<*(y+i)){
				max_d=*(y+i);
				posit=i;
			}
		}

		print_results (y, nr_classes, posit, label);

		if (posit==label)
			score++;///If the most correlated class is the correct one then we score one point

	}

	/*
	 *      _
    	   / \   ___ ___ _   _ _ __ __ _  ___ _   _
   	   	  / _ \ / __/ __| | | | '__/ _` |/ __| | | |
  	  	 / ___ \ (_| (__| |_| | | | (_| | (__| |_| |
 	 	/_/   \_\___\___|\__,_|_|  \__,_|\___|\__, |
                                       	   	  |___/
	 */

	///Calculation and print of test accuracy
	percentage = (float)score/number_tries;
    BLUE
	printf("percentage = %f\n",percentage*100);
	//printf("Output took %llu clock cycles.\n", 2*(tEnd - tStart));
    NC

#ifdef MEM_MAPPING
	munmap((void *)soc_addr, PAGE_SIZE); //FIXME size
	munmap((void *)soc_cntr_addr, PAGE_SIZE);//FIXME size
	close(fd);
#endif

    printf("\n\n***************  End of test  ***************\n\n");

   // printf("%x -> %f \n",-5,(float)pow2(-5));
    //printf("%x -> %f \n",conversion_float_to_data_t(0.313426),conversion_data_t_to_float(conversion_float_to_data_t(0.313426),16));


#ifdef BAREMETAL
    cleanup_platform();
#endif
    return 0;
}


void zeros_fill(int16_t *w, int len_B){
    int i;
    for (i=0; i<len_B/2; i++)
        w[i]=0;
}

void copy_stream(int16_t * dest, int16_t * src, int len_B){
    int i;
    for (i=0;i<len_B/2;i++){
        dest[i]=src[i];
    }

}

void round4_features (int16_t * dest, int16_t * src, int in_f){

    int if_round, j;

    if_round=in_f/4;
    if (in_f%4>0) if_round++;
    if_round=if_round*4;

    for (j=0;j<if_round;j++){
		if (j<in_f){
			copy_stream(&dest[j*28*28], &src[j*28*28], 28*28*2);
		}
		else{
			zeros_fill(&dest[j*28*28],28*28*2);
		}
	}
}
void print_results (data_t * y, int nr_classes, int posit, int label){
	int i;
	BLUE
	printf ("Results\n");
	NC
	for(i=0;i<nr_classes;i++){

			printf("Cl[%d]  ",i);
			GREEN

#ifndef BAREMETAL
				printf("█");
#else
				printf("#");
#endif

			int j;
			for (j=0;j<(int)(conversion_data_t_to_float(*(y+i),16)*20);j++)

#ifndef BAREMETAL
				printf("█");
#else
				printf("#");
#endif

			BLUE
			printf(" %f\n",conversion_data_t_to_float(*(y+i),16));
			NC

	}
	if (posit==label)
		GREEN
	else
		RED
	printf("Posit: %d Label: %d\n",posit, label);
	NC
}

void interlace (int * dest, int * src, int n_feat, int len_B){ // len is the number of bytes of a dest
    int stride = 4;

    int gr = n_feat/stride;
    if (n_feat%4>0) gr++;


    int i, j, g;
    for (g=0; g<gr;g++){
      for (j=0; j<stride; j++) {
	    for (i=0; i< len_B /4; i++) {
		  dest[g*stride*len_B/4 + j + i*stride]=src [g*stride*len_B/4 + i+j*len_B /4];
		}
	  }
  }
}

void deinterlace (int * dest, int * src, int n_feat, int len_dest_B){ // len is the number of bytes of a dest
    int stride = 4;

    int gr = n_feat/stride;
    if (n_feat%4>0) gr++;


    int i, j, g;
    for (g=0; g<gr;g++){
      for (j=0; j<stride; j++) {
	    for (i=0; i< len_dest_B /4; i++) {
		  dest[g*stride*len_dest_B/4 + i+j*len_dest_B /4]=src [g*stride*len_dest_B/4 + j + i*stride];
		}
	  }
  }
}




void print_image (data_t * image, int h, int w){

	int i, j;
	//printf ("Image\n");
	//Image print on console
	BLUE
	for(i=0;i<h;i++) {
		for(j=0;j<w;j++){
			if(image[i*w+j]==0){
#ifndef BAREMETAL
				printf("██");
#else
				printf("#");
#endif
			}
			else
				printf("  ");
		}
		printf("\n");
	}
	NC
}


void print_stream (data_t * stream, int h, int w, int n_feat){
	int i;
	for (i=0; i<n_feat*h*w;i++)
		printf ("[%d %d %d]: 0x%x\n", i/(h*w), i%(h*w),  i, stream[i]);
}

void print_interlaced_stream (data_t * stream, int h, int w, int n_feat){
	data_t * deinterlaced_array;
	deinterlaced_array = (data_t *) malloc (n_feat*h*w*2);

	deinterlace ((int*)deinterlaced_array, (int*)stream, n_feat, h*w*2);

	print_stream (deinterlaced_array, h, w, n_feat);

}