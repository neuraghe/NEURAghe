#include <stdint.h>
#include <stdio.h>

#define QF 13

short int W[5*5];
short int Wcpp[7*7];
short int Wcp[7*7];
short int W0[5*5];
short int W1[5*5];
short int W2[5*5];
short int W3[5*5];
short int x[2*16*64];
short int y_sw[2*12*60];
short int y_swcp[2*12*60];
short int y_hw[2*12*60];
short int y_cp[2*12*60];

void conv16_gold(int16_t *__restrict__ W, int16_t *__restrict__ x, int16_t *__restrict__ y, int h, int w, int fh, int fw, int oh, int ow, int nif, int a, int b, int ow_tot);
void swce_conv16_5x5(short int *W, short int *x, short int *y, int h, int w, int fh, int fw, int oh, int ow, int nif, int a);

void swce_conv16_5x5(short int *W, short int *x, short int *y, int h, int w, int fh, int fw, int oh, int ow, int nif, int a) {

  printf("x=%08x, y=%08x\n", x, y);

  short int *y_ptr = y + a*oh*ow;
  short int *x_ptr = x; //+ (fh-1)*w + (fw-1);
  short int *W_ptr = &W[a*nif*fh*fw];

  unsigned int ow_int = ow;
  unsigned int offloads[8];
  unsigned int end_k;
  unsigned int k;
  unsigned int hwce_id = 0;

  // greedy algorithm for HWCE offload
  for (k=0; ow_int>0; k++) {
    unsigned int offload = -1;
    unsigned int ow_hwce = (ow_int < 2) ? 1 : (ow_int < 4) ? 2 : (ow_int < 8) ? 4 : (ow_int < 16) ? 8 : (ow_int < 32) ? 16 : 16;
    if(ow_hwce != 1) {
      ow_int -= ow_hwce;

      printf("x_ptr=%08x, y_ptr=%08x, ow_hwce=%d\n", x_ptr, y_ptr, ow_hwce);
      conv16_gold(W_ptr,
                  x_ptr,
                  y_ptr,
                  h,
                  w,
                  5,
                  5,
                  h-4,
                  ow_hwce,
                  nif,
                  0,
                  0,
                  w-4
      );

      x_ptr += ow_hwce;
      y_ptr += ow_hwce;
      end_k = k;

    }
    else {
      printf("here\n");
    }
  }

  // unsigned int width_int = w;
  // unsigned int offloads[8];
  // unsigned int end_k;
  // unsigned int k;
  // unsigned int hwce_id = 0;
  // // greedy algorithm for HWCE offload
  // for (k=0; width_int>4; k++) {
  //   unsigned int offload = -1;
  //   unsigned int width_hwce = (width_int < 6) ? -1 : (width_int < 8) ? 6 : (width_int < 12) ? 8 : (width_int < 20) ? 12 : (width_int < 36) ? 20 : 20;
  //   // offload to HWCE if possible
  //   if(width_hwce != -1) {
  //     width_int -= width_hwce;
  //     // busy-wait on all HWCEs
      
  //     printf("x_ptr=%08x, y_ptr=%08x, width_hwce=%d\n", x_ptr, y_ptr, width_hwce);
  //     conv16_gold(W_ptr,
  //                 x_ptr,
  //                 y_ptr,
  //                 h,
  //                 w,
  //                 5,
  //                 5,
  //                 h-4,
  //                 width_hwce-4,
  //                 nif,
  //                 0,
  //                 0,
  //                 w-4
  //       );

  //     x_ptr += width_hwce - fw + 1;
  //     y_ptr += width_hwce - fw + 1;
  //     end_k = k;
  //   }
  //   // compute in software if not possible
    // else {
    //   printf("Here\n");
    //   // ?
    // }
  // }

}


void conv16_gold(int16_t *__restrict__ W, int16_t *__restrict__ x, int16_t *__restrict__ y, int h, int w, int fh, int fw, int oh, int ow, int nif, int a, int b, int ow_tot) {
   int i;
   for (i=0; i<oh; i++) {
      int j;
      for (j=0; j<ow; j++) {
         int32_t conv = 0;
         int ui;
         for (ui=0; ui<fh; ui++) {
            int uj;
            for (uj=0; uj<fw; uj++) {
               int m;
               int n;
               m = i-ui+fh-1;
               n = j-uj+fw-1;
               conv += (W[((((a*nif)+b)*fh)+ui)*fw+uj] * x[(((b*h)+m)*w)+n]) >> QF;
            }
         }
         y[(a*oh+i)*ow_tot+j] = (y[(a*oh+i)*ow_tot+j] + conv);
      }
   }
}


int main() {
  int i,j;
  short int checksum = 0;
  for(i=0; i<5*5; i++) {
    W[i] = 1 << 13;
  }
  for(i=0; i<7*7; i++) {
    Wcp[i] = 1 << 13;
    Wcpp[i] = 1 << 13;
  }
  for(i=0; i<7; i++) {
    for(j=2; j<5; j++)
      Wcpp[i*7+j] = Wcpp[i*7+j] >> 1;
  }
  for(i=2; i<5; i++) {
    for(j=0; j<7; j++)
      Wcpp[i*7+j] = Wcpp[i*7+j] >> 1;
  }
  for(i=0; i<5; i++)
    for(j=0; j<5; j++) {
      W0[i*5+j] = Wcpp[i*7+j];
      W1[i*5+j] = Wcpp[i*7+j+2];
      W2[i*5+j] = Wcpp[(i+2)*7+j];
      W3[i*5+j] = Wcpp[(i+2)*7+j+2];
    }
  for(i=0; i<2*16*64; i++)
    x  [i] = i << 3;
  for(i=0; i<2*12*60; i++) {
    y_sw  [i] = 0;
    y_hw  [i] = 0;
    y_cp  [i] = 0;
    y_swcp  [i] = 0;
  }
  // gold
  conv16_gold(&W[0], &x[0], &y_sw[0], 16, 32, 5, 5, 12, 28, 1, 0, 0, 28);
  // swce
  swce_conv16_5x5(&W[0], &x[0], &y_hw[0],
                  16, 32,
                  5, 5,
                  12, 28,
                  1,
                  0);

  // gold
  conv16_gold(&Wcp[0], &x[0], &y_swcp[0], 16, 34, 7, 7, 10, 28, 1, 0, 0, 28);
  // composite
  conv16_gold(W0, &x[0*34+0], y_cp, 16, 34, 5, 5, 10, 28, 1, 0, 0, 28);
  conv16_gold(W1, &x[0*34+2], y_cp, 16, 34, 5, 5, 10, 28, 1, 0, 0, 28);
  conv16_gold(W2, &x[2*34+0], y_cp, 16, 34, 5, 5, 10, 28, 1, 0, 0, 28);
  conv16_gold(W3, &x[2*34+2], y_cp, 16, 34, 5, 5, 10, 28, 1, 0, 0, 28);

  for(i=0; i<12*60; i++) {
    checksum += y_sw[i];
  }
  printf("checksum_gold=%d\n", checksum);
  checksum = 0;
  for(i=0; i<12*60; i++) {
    checksum += y_hw[i];
  }
  printf("checksum_swce=%d\n", checksum);
  checksum = 0;
  for(i=0; i<10*28; i++) {
    checksum += y_swcp[i];
  }
  printf("checksum_swcp=%d\n", checksum);
  checksum = 0;
  for(i=0; i<10*28; i++) {
    checksum += y_cp[i];
  }
  printf("checksum_cp=%d\n", checksum);
  for(i=0; i<10000; i++);

  // printf("\ny_sw0=\n");
  // for(i=0; i<12; i++) {
  //   for(j=0; j<20; j++) {
  //       printf("%04x,", 0x0000ffff & y_sw[i*28+j]);
  //   }
  //   printf("\n");
  // }

  // printf("\ny_hw0=\n");
  // for(i=0; i<12; i++) {
  //   for(j=0; j<20; j++) {
  //       printf("%04x,", 0x0000ffff & y_cp[i*28+j]);
  //   }
  //   printf("\n");
  // }

  // printf("\ny_sw1=\n");
  // for(i=0; i<12; i++) {
  //   for(j=20; j<28; j++) {
  //       printf("%04x,", 0x0000ffff & y_sw[i*28+j]);
  //   }
  //   printf("\n");
  // }

  // printf("\ny_hw1=\n");
  // for(i=0; i<12; i++) {
  //   for(j=20; j<28; j++) {
  //       printf("%04x,", 0x0000ffff & y_cp[i*28+j]);
  //   }
  //   printf("\n");
  // }

  printf("\ny_swcp=\n");
  for(i=0; i<26; i++) {
    for(j=0; j<26; j++) {
        printf("%04x,", 0x0000ffff & y_swcp[i*26+j]);
    }
    printf("\n");
  }

  printf("\ny_cp=\n");
  for(i=0; i<26; i++) {
    for(j=0; j<26; j++) {
        printf("%04x,", 0x0000ffff & y_cp[i*26+j]);
    }
    printf("\n");
  }


  printf("\nW0=\n");
  for(i=0; i<5; i++) {
    for(j=0; j<5; j++) {
        printf("%04x,", 0x0000ffff & W0[i*5+j]);
    }
    printf("\n");
  }
  printf("\nW1=\n");
  for(i=0; i<5; i++) {
    for(j=0; j<5; j++) {
        printf("%04x,", 0x0000ffff & W1[i*5+j]);
    }
    printf("\n");
  }
  printf("\nW2=\n");
  for(i=0; i<5; i++) {
    for(j=0; j<5; j++) {
        printf("%04x,", 0x0000ffff & W2[i*5+j]);
    }
    printf("\n");
  }

  printf("\nW3=\n");
  for(i=0; i<5; i++) {
    for(j=0; j<5; j++) {
        printf("%04x,", 0x0000ffff & W3[i*5+j]);
    }
    printf("\n");
  }
  for(i=0; i<2*12*60; i++) {
    y_sw  [i] = 0;
    y_hw  [i] = 0;
  }
}

