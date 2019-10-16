#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

short int dec_to_short (float num, int QF);
short int convert_float_to_short (float val, int QF);

float fixed2float (short int a, int QF);
short int float2fixed (float a, int QF);

int main(int argc, char* argv[])
{

    int i=0;
    double value;
    float conv;
    short int conv_16;
    size_t count;

    int QF = atoi(argv[2]);

    if(strcmp(argv[1], "-h") == 0)
    {
        printf("help: ./covert_data <out type> <QF> <input bin file> <output bin file>\n\n"
               "    out type:\n"
               "     -float : floating point\n"
               "     -fixed : fixed point\n\n");
        return 0;
    }

    FILE *in = fopen(argv[3], "rb");
    FILE *out = fopen(argv[4], "wb+");

    if (in == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }

//    printf("Sizeof double:    %d\n", (int)sizeof(double));
//    printf("Sizeof float :    %d\n", (int)sizeof(float));
//    printf("Sizeof fized :    %d\n", (int)sizeof(short int));
//    printf("Sizeof int :      %d\n", (int)sizeof(int));
//    printf("Sizeof long int : %d\n", (int)sizeof(long int));

    if(strstr(argv[3], "var") != NULL)
        printf("Convert %30s file ", argv[3]);
    else
        printf("Convert %30s file ", argv[3]);

    if(strcmp(argv[1], "-float") == 0)
        printf("in floating point......");    

    if(strcmp(argv[1], "-fixed") == 0)
        printf("in fixed point......");    

    while( fread(&value, sizeof(double), 1, in) == 1 )
    {
        
        if(strcmp(argv[1], "-float") == 0)
        {
            if(strstr(argv[3], "var") != NULL)
                conv = (float)(sqrt(value));
            else
                conv = (float)value;

            fwrite(&conv, sizeof(float), 1, out);
        }

        if(strcmp(argv[1], "-fixed") == 0)
        {
            //conv_16 = convert_float_to_short ((float)value, QF);
            if(strstr(argv[3], "var") != NULL){
                conv = (float)(sqrt(value));
                conv_16 = float2fixed(conv, QF);
                if(conv_16 == 0)
                    conv_16 = float2fixed(pow(2,-QF), QF);
            }
            else{
                conv = (float)value;
                conv_16 = float2fixed(conv, QF);
            }

            fwrite(&conv_16, sizeof(short int), 1, out);
            //printf("\n[%4d]float: %+2.10f  --> fixed: %+5d --->  fixed2float: %+2.10f", i, conv, float2fixed(conv, QF), fixed2float(conv_16, QF));
            i++;
        }

    }

    printf("%d values converted!\n", i);

    fclose(in);
    fclose(out);
}

float fixed2float ( short int a, int QF ) { return (((float) a) / pow(2,QF)); }
short int float2fixed ( float a, int QF ) { return ((short int) floor(a * pow(2,QF))); }

short int dec_to_short (float num, int QF)
{
    //printf("num:  %+1.10f  ", num);
    short int out=0;
    float temp1 = num;
    int temp2;
    int i;

    for(i=1; i<=QF; i++)
    {
        temp1 *= 2;
        if (temp1>=1)
        {
            out += pow(2,QF-i);
            temp2 = (int)temp1;
            temp1 -= (float)temp2;
        }
    }

    return out;
}

short int convert_float_to_short (float val, int QF)
{
    short int integ;
    short int decim;

    if(val>=0)
    {
        integ = (short int)val;
        decim = dec_to_short(fabs(val-integ), QF);
    }
    else
    {
        integ = (short int)(-ceil(fabs(val)));

        if((fabs(val)-(int)(fabs(val))) == 0)
          decim = dec_to_short((fabs(val)-(int)(fabs(val))), QF);
        else
          decim = dec_to_short(1-((fabs(val)-(int)(fabs(val)))), QF);
    }

    return (integ<<QF)+decim;
}
