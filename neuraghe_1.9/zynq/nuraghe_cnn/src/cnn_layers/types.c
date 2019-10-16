/******************************************************************************
 *                                                                            *
 *                   EOLAB @ DIEE - University of Cagliari                    *
 *                          Via Marengo, 2, 09123                             *
 *                       Cagliari - phone 070 675 5009                        *
 *                                                                            *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it            *
 *                                                                            *
 * Project:     Convolutional neural network                                  *
 * File:        types.c                                                       *
 * Description: Source codes of all procedures declared in types.h            *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
//#include <string.h>
//#include <math.h>
#include "types.h"

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point type. Otherwise it will work on floating-point type.
#define FIXED_CONVNET

void read_file(data_t *vett,char *file){
    /**
    This function reads data (such as weights and biases) from file. Then it calls a conversion function if the CNN is working of fixed-point datatype.
    **/
    FILE *f;
    char temp[20];
    float val;
    int i=0;
 //   data_t integ, decim;
    f=fopen(file,"r");
    //printf("%d\n",feof(f));
    while(!feof(f)){
        fscanf(f,"%s",temp);
        val=atof(temp);
        #ifdef FIXED_CONVNET
            *(vett+i)=conversion_float_to_data_t(val);
        #else
            *(vett+i)=val;
        #endif // FIXED_CONVNET
        i++;
    }
    fclose(f);
    return;
}
float pow_nur (int b, int e){
	int i;
	float p=1;
	if (e>=0) {
		for (i=0;i<e;i++)
			p=p*b;
	}
	else{
		for (i=0;i>e;i--)
			p=p/b;
	}

	return p;
}

data_t dec_to_data_t(float in){
    data_t out=0;
    #ifdef FIXED_CONVNET
        float temp1=in;
        int i, temp2;
        for(i=1;i<=QF;i++){
            temp1*=2;
            //printf("temp1: %f\n",temp1);
            if(temp1>=1){
                out+=(data_t)pow_nur(2,QF-i);
              //  printf("pow: %x out: %x\n",(data_t)pow2(8-i), out);
                temp2=(int)temp1;
               // printf("temp2: %d\n",temp2);
                temp1-=(float)temp2;
               // printf("temp1qq: %f\n",temp1);
               // printf("out: %x\n",out);
            }
        }
    #endif // FIXED_CONVNET
    return out;
}
float ceil_nur(float val){

	float val_i = (float)(int)val;
	val = val- val_i;

	if (val >0)
		val =1;
	else
		val =0;
	return val+val_i;

}

data_t conversion_float_to_data_t(float val){
    /**
    This function converts a floating-point variable into a data_t one.
    **/
    data_t integ, decim;
    #ifdef FIXED_CONVNET
        int n=QF;
        if(val>=0){
            integ=(data_t)(val);
            decim=dec_to_data_t(abs_nur(val-integ));
          //  printf("%f %f %x %x\n",val, fabs(val-integ), integ, decim);
        }
        else{
            integ=(data_t)(-ceil_nur(abs_nur(val)));
            if((abs_nur(val)-(int)(abs_nur(val)))==0)
            	decim=dec_to_data_t((abs_nur(val)-(int)(abs_nur(val))));
            else
            	decim=dec_to_data_t(1-(abs_nur(val)-(int)(abs_nur(val))));

             // printf("%f %f %f %x %x\n",val, fabs(val),-ceil_new(fabs(val)), integ, decim);
        }
        return (integ<<n)+decim;
    #else
        return integ+decim;
    #endif // FIXED_CONVNET
}


float abs_nur (float val) {
	if (val >= 0)
		return val;
	else
		return -val;
}

float round_nur (float val, int n){
	int d, i;
	int r;
	int add=1;

	float sign;
	if (val<0) sign = -1;
	else sign =1;

	int mul=1;

	for (i=0;i<n;i++)
        mul = mul*10;

    val = val*mul*sign;

	r = (int) val;
	for (d=10; d<100000; d=d*10){
		if ((val-(float)r)*d<4)
			add=0;
	}
	if ((val-(float)r)*d<5)
				add=0;
	if (add)
		r++;

    float ris= (float) r;

	return ris/mul*sign;
}


float exp_nur (float exp){
	int i, exp_int,exp_dec;
	float exp_round=round_nur(exp,1);

	exp_int= (int)exp_round;
	exp_dec = (int)((exp_round-exp_int)*10);

	float e_10m1= 1.105170918; // e^(1/10)

	float ris=1;

	if (exp_int>=0) {
		for (i=0;i<exp_int;i++)
			ris=ris*2.71828;

		for (i=0;i<exp_dec;i++)
					ris=ris*e_10m1;

	}
	else {
		for (i=0;i>exp_int;i--)
					ris=ris/2.71828;

		for (i=0;i>exp_dec;i--)
					ris=ris/e_10m1;
	}

	return ris;
}


float conversion_data_t_to_float(data_t val, int n){
    /**
    This function converts a data_t variable into a floating point one.
    If you want the k-th bit of n, then do
    (n & ( 1 << k )) >> k
    remember: the sign bit (the MSB in two's complement) is shifted in on the left/right
    **/
    #ifdef FIXED_CONVNET
        float dec=0, integ=0;
        int i, bit, neg=0;
        if(val<0) neg=1;
        for(i=0;i<QF;i++){
            bit=(val&(1<<0))>>0;
            dec+=(float)bit*(float)pow_nur(2,i-QF);
            val=val>>1;
        }
        if(neg){
            val=val-1;
            val=~val;
        }
        for(i=0;i<n-QF;i++){
            bit=(val&(1<<0))>>0;
            integ+=(float)bit*(float)pow_nur(2,i);
            val=val>>1;
        }
        if(neg) return -integ+dec;
        else return integ+dec;
    #else
        return val;
    #endif // FIXED_CONVNET
}

int out_feat_size(int feat_side, int window_side, int stride){
    /**
    This function calculates the size of one side of the output feature after the execution of either convolutional or pooling layers.
    So, it's true for both layers and this is due to the fact we don't use the zero-padding technique.
    feat_side is the height or width of the input feature.
    window_side is the height or width of the filter or of the pooling window.
    **/
    if(window_side>feat_side || ((feat_side-window_side)%stride)!=0) return -1;
    return (int)((feat_side-window_side)/stride+1);
}

// CConvNet max
data_t cnn_max(data_t x){
    /**
    This function executes the ReLU activation function.
    It basically returns the maximum value between the input one and 0.
    **/
    if(x<0) return 0;
    else return x;
}
