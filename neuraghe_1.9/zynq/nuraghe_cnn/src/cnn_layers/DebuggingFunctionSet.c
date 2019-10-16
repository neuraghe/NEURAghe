/***********************************************************************************
 *                                                                                 *
 *                   EOLAB @ DIEE - University of Cagliari                         *
 *                          Via Marengo, 2, 09123                                  *
 *                       Cagliari - phone 070 675 5009                             *
 *                                                                                 *
 * Author:       Alessandro Varsi - alessandro.varsi@diee.unica.it                 *
 *                                                                                 *
 * Project:     Convolutional neural network                                       *
 * File:        DebuggingFunctionSet.c                                             *
 * Description: Sources codes of all procedures declared in DebuggingFunctionSet.c *
 *                                                                                 *
 ***********************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "types.h"
#include "DebuggingFunctionSet.h"

///If FIXED_CONVNET is defined then the Convolutional neural network will work on fixed-point types. Otherwise it will work on floating-point types
#define FIXED_CONVNET

void print_features(data_t *features, int n, int height, int width){
    FILE *f;
    int k,i,j;
    #ifdef FIXED_CONVNET
        f=fopen("fixed_point.txt","w");
        for(k=0;k<n;k++){
            for(i=0;i<height;i++){
                for(j=0;j<width;j++){
                    fprintf(f,"%f ",conversion_data_t_to_float(*(features+k*height*width+i*width+j),16));
                }
                fprintf(f,"\n");
            }
            fprintf(f,"\n");
        }
        fclose(f);
    #else
        f=fopen("floating_point.txt","w");
        for(k=0;k<n;k++){
            for(i=0;i<height;i++){
                for(j=0;j<width;j++){
                    fprintf(f,"%f ",*(features+k*height*width+i*width+j));
                }
                fprintf(f,"\n");
            }
            fprintf(f,"\n");
        }
        fclose(f);
    #endif // FIXED_CONVNET
    return;
}

void print_relative_errors(data_t *features, int n){
    #ifndef FIXED_CONVNET
        int i;
        data_t *array1, *array2, temp, temp1, temp2, max=0,min=100;
        array1=(data_t *)malloc(n*sizeof(data_t));
        array2=(data_t *)malloc(n*sizeof(data_t));
        leggi(array1,"floating_point.txt");
        leggi(array2,"fixed_point.txt");
        FILE *f;
        f=fopen("relative_errors.txt","w");
        for(i=0;i<n;i++) {
            temp1=*(array1+i);
            temp2=*(array2+i);
            temp=100*(fabs(temp1-temp2)/temp1);
            if(temp>max) max=temp;
            if(temp<min) min=temp;
            fprintf(f,"%f\n",temp);
        }
        fclose(f);
        printf("max=%f\n",max);
        printf("min=%f\n",min);
        return;
    #else
        return;
    #endif // FIXED_CONVNET
}
/*
void print_full(data_t *features, int dim){
    FILE *f;
    int i;
    #ifndef FIXED_CONVNET
        f=fopen("floating_point.txt","w");
        for(i=0;i<dim;i++) fprintf(f,"%f\n",*(features+i));
        fclose(f);
    #else
        return;
    #endif // FIXED_CONVET
}
*/
