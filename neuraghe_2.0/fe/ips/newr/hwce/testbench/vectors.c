#include <stdio.h>
#include <stdint.h>

#define ccn_mult(a,b) (((a)*(b)) >> 13)

static inline void linalg_2dconv_int_baseline(int16_t *restrict W, int16_t *restrict x, int16_t *restrict y, int h, int w, int fh, int fw, int oh, int ow, int nif, int a, int b) {
    for (int i=0; i<oh; i++) {
        for (int j=0; j<ow; j++) {
            int16_t conv = 0;
            for (int ui=0; ui<fh; ui++) {
                for (int uj=0; uj<fw; uj++) {
                    int m = i-ui+fh-1;
                    int n = j-uj+fw-1;
                    // ccn_mult(a,b) = a*b>>QF if fixed-point, a*b if floating-point
                    conv += ccn_mult(W[((((a*nif)+b)*fh)+ui)*fw+uj], x[(((b*h)+m)*w)+n]);
                }
            }
            y[(a*oh+i)*ow+j] += conv;
        }
    }
}

int main() {
    int16_t x[32*64];
    int16_t y[28*60];
    int16_t W[32];

    for(int i=0; i<30; i++) {
        W[i] = 0x2000;
    }
    for(int i=0; i<32*64; i++) {
        x[i] = i % 0x2000;
    }
    for(int i=0; i<28*60; i++) {
        y[i] = i % 0x2000;        
    }

    linalg_2dconv_int_baseline(W, x, y, 16, 64, 5, 5, 12, 60, 1, 0, 0);
    linalg_2dconv_int_baseline(W, x+16*64, y+12*60, 16, 64, 5, 5, 12, 60, 1, 0, 0);

    for(int i=0; i<28*60/2; i++) {
        printf("%04x%04x\n", 0x0000ffff & y[2*i], 0x0000ffff & y[2*i+1]);
    }
    return 0;
}
