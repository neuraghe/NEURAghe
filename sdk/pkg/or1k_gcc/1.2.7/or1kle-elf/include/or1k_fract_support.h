// #define OR1K_FRACT
#define INL1 __extension__ static __inline
#define INL2 __attribute__ ((__always_inline__))

#ifdef OR1K_FRACT

#include "or1k_intrinsics.h"
typedef _Fract Word16;
typedef long _Fract Word32;

INL1 Word16 INL2 extract_h (Word32 L_var1)

{
	return (Word16) _extract_h((Word32) L_var1);
}

INL1 Word16 INL2 extract_l (Word32 L_var1)

{
	return (Word16) _extract_l((Word32) L_var1);
}

INL1 Word32 INL2 L_deposit_h (Word16 var1)

{
	return (Word32) var1;
}

INL1 Word32 INL2 L_deposit_l (Word16 var1)

{
	return (Word32) ((Word32) var1 >> 16);
}


INL1 Word16 INL2 saturate (Word32 L_var1)

{
	return (Word16) _sat16((Word32) L_var1);
}

INL1 Word32 INL2 L_sat (Word32 L_var1)

{
	return (Word32) _sat32((Word32) L_var1);
}

INL1 Word16 INL2 add (Word16 var1, Word16 var2)

{
    return (Word16)((Word16) var1 + (Word16) var2);
}

INL1 Word16 INL2 sub (Word16 var1, Word16 var2)

{
    return (Word16)((Word16) var1 - (Word16) var2);
}

INL1 Word16 INL2 negate (Word16 var1)

{
    return (Word16)(- (Word16) var1);
}


INL1 Word16 INL2 abs_s (Word16 var1)

{
    return (Word16)(_absfr((Word16) var1));
}

INL1 Word32 INL2 L_abs (Word32 L_var1)

{
    return (Word32)(_abslfr((Word32) L_var1));
}

INL1 Word16 INL2 shl (Word16 var1, int var2)

{
    return (Word16)((Word16) var1 << (int) var2);
}

INL1 Word16 INL2 shr (Word16 var1, int var2)

{
    // return (Word16)((Word16) var1 >> (int) var2);
    return (Word16)(_extract_h((Word32) var1 >> (int) var2));
}

INL1 Word16 INL2 shr_r (Word16 var1, int var2)

{
    return (Word16)(_rnd((Word32)((Word16) var1 >> (int) var2)));
}

INL1 Word16 INL2 mult (Word16 var1, Word16 var2)

{
	return (Word16) ((Word16) var1 * (Word16) var2);
}

INL1 Word32 INL2 L_mult (Word16 var1, Word16 var2)

{
	return (Word32) (_mulfr((Word16) var1, (Word16) var2));
}


INL1 Word16 INL2 rounds (Word32 L_var1)

{
	return (Word16) (_rnd((Word32) L_var1));
}

INL1 Word32 INL2 L_mac (Word32 L_var3, Word16 var1, Word16 var2)

{
	return (Word32) (_macfr((Word32) L_var3, (Word16) var1, (Word16) var2));
}

INL1 Word16 INL2 mac_r (Word32 L_var3, Word16 var1, Word16 var2)

{
	return (Word32) (_macrfr((Word32) L_var3, (Word16) var1, (Word16) var2));
}

INL1 Word32 INL2 L_msu (Word32 L_var3, Word16 var1, Word16 var2)

{
	return (Word32) (_msufr((Word32) L_var3, (Word16) var1, (Word16) var2));
}

INL1 Word16 INL2 msu_r (Word32 L_var3, Word16 var1, Word16 var2)

{
	return (Word32) (_msurfr((Word32) L_var3, (Word16) var1, (Word16) var2));
}

INL1 Word32 INL2 L_add (Word32 L_var1, Word32 L_var2)

{
	return (Word32) ((Word32) L_var1 + (Word32) L_var2);
}

INL1 Word32 INL2 L_sub (Word32 L_var1, Word32 L_var2)

{
	return (Word32) ((Word32) L_var1 - (Word32) L_var2);
}

INL1 Word32 INL2 L_negate (Word32 L_var1)

{
	return (Word32) (- (Word32) L_var1);
}

INL1 Word16 INL2 mult_r (Word16 var1, Word16 var2)

{
	return (Word16) (_mulrfr((Word16) var1, (Word16) var2));
}


INL1 Word32 INL2 L_shl (Word32 L_var1, int var2)

{
	return (Word32) ((Word32) L_var1 << (int) var2);
}

INL1 Word32 INL2 L_shr_r (Word32 L_var1, int var2)

{
	return (Word32) _asr_rnd((Word32) L_var1, (int) var2);
}

INL1 Word32 INL2 L_shr (Word32 L_var1, int var2)

{
	return (Word32) ((Word32) L_var1 >> (int) var2);
}

INL1 int INL2 norm_s (Word16 var1)

{
	return (int) _clb((Word32) var1);
}

INL1 int INL2 norm_l (Word32 L_var1)

{
	return (int) _clb((Word32) L_var1);
}


INL1 Word32 INL2 Mpy_32(Word32 a, Word32 b)

{
        return (Word32) _dmacssfr(_macsufr(_dmacsufr(_muluufr(a, b), a, b), b, a), a, b);
}

INL1 Word32 INL2 Mpy_32_16(Word32 a, Word16 b)

{
        return (Word32) _dmacssfr(_mulsufr((Word32) b, a ), a, (Word32) b);
}

INL1 Word16 INL2 div_s (Word16 var1, Word16 var2)

{
        long _Fract Tmp;

        __asm__ volatile ("l.addi \t%0,%1,0" : "=r" (Tmp) : "r" (var1)); // Clear Carry


        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);
        Tmp = _divsfr(Tmp, var2);

        return (_extract_l(Tmp));
}

INL1 Word32 INL2 Div_32 (Word32 L_num, Word32 L_denom)

{
    Word16 approx;
    Word32 L_32;

    /* First approximation: 1 / L_denom = 1/msp(L_denom) */
    approx = div_s ((Word16) 0x3fff, extract_h(L_denom)); // approx = 0.5/Dh

    /* 1/L_denom = approx * (2.0 - L_denom * approx) */
    L_32 = Mpy_32_16 (L_denom, approx);
    L_32 = L_sub ((Word32) 0x7fffffffL, L_32);
    L_32 = Mpy_32_16 (L_32, approx);			// 1/(4*D) = 0.5/Dh * (1.0 - D*(0.5/Dh)) 

    /* L_num * (1/L_denom) */
    L_32 = Mpy_32 (L_num, L_32);
    L_32 = L_shl (L_32, 2);

    return (L_32);
}

#else

#define MAX_32 (Word32)0x7fffffffL
#define MIN_32 (Word32)0x80000000L

#define MAX_16 (Word16)0x7fff
#define MIN_16 (Word16)0x8000

typedef short Word16;
typedef int Word32;
typedef int Flag;

Flag Overflow = 0;
Flag Carry = 0;


INL1 Word16 INL2 extract_h (Word32 L_var1)

{
    Word16 var_out;

    var_out = (Word16) (L_var1 >> 16);
    return (var_out);
}

INL1 Word16 INL2 extract_l (Word32 L_var1)

{
    Word16 var_out;

    var_out = (Word16) L_var1;
    return (var_out);
}

INL1 Word32 INL2 L_deposit_h (Word16 var1)

{
    Word32 L_var_out;

    L_var_out = (Word32) var1 << 16;
    return (L_var_out);
}

INL1 Word32 INL2 L_deposit_l (Word16 var1)

{
    Word32 L_var_out;

    L_var_out = (Word32) var1;
    return (L_var_out);
}

INL1 Word16 INL2 saturate (Word32 L_var1)

{
    Word16 var_out;

    if (L_var1 > 0X00007fffL) {
        Overflow = 1;
        var_out = MAX_16;
    } else if (L_var1 < (Word32) 0xffff8000L) {
        Overflow = 1;
        var_out = MIN_16;
    } else var_out = extract_l (L_var1);
    return (var_out);
}

INL1 Word32 INL2 L_sat (Word32 L_var1)

{
    Word32 L_var_out;

    L_var_out = L_var1;
    if (Overflow) {
        if (Carry) L_var_out = MIN_32;
        else L_var_out = MAX_32;
        Carry = 0;
        Overflow = 0;
    }
    return (L_var_out);
}

INL1 Word16 INL2 add (Word16 var1, Word16 var2)

{
    Word16 var_out;
    Word32 L_sum;

    L_sum = (Word32) var1 + var2;
#ifdef WITH_SAT
    var_out = saturate (L_sum);
#else
    var_out = L_sum;
#endif
    return (var_out);
}

INL1 Word16 INL2 sub (Word16 var1, Word16 var2)

{
    Word16 var_out;
    Word32 L_diff;

    L_diff = (Word32) var1 - var2;
#ifdef WITH_SAT
    var_out = saturate (L_diff);
#else
    var_out = L_diff;
#endif
    return (var_out);
}

INL1 Word16 INL2 negate (Word16 var1)

{
    Word16 var_out;

#ifdef WITH_SAT
    var_out = (var1 == MIN_16) ? MAX_16 : -var1;
#else
    var_out = -var1;
#endif
    return (var_out);
}


INL1 Word16 INL2 abs_s (Word16 var1)

{
    Word16 var_out;

#ifdef WITH_SAT
    if (var1 == (Word16) 0X8000) var_out = MAX_16;
    else if (var1 < 0) var_out = -var1;
    else var_out = var1;
#else
    var_out = (var1<0)?-var1:var1;
#endif
    return (var_out);
}

INL1 Word32 INL2 L_abs (Word32 L_var1)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    if (L_var1 == MIN_32) L_var_out = MAX_32;
    else if (L_var1 < 0) L_var_out = -L_var1;
    else L_var_out = L_var1;
#else
    L_var_out = (L_var1<0)?-L_var1:L_var1;
#endif
    return (L_var_out);
}

INL1 Word16 INL2 shl (Word16 var1, Word16 var2)

{
    Word16 var_out;
    Word32 result;

#ifdef WITH_SAT
    result = (Word32) var1 *((Word32) 1 << var2);
    if ((var2 > 15 && var1 != 0) || (result != (Word32) ((Word16) result))) {
        Overflow = 1;
        var_out = (var1 > 0) ? MAX_16 : MIN_16;
    } else var_out = extract_l (result);
#else
    var_out = var1<<var2;
#endif
    return var_out;
}

INL1 Word16 INL2 shr (Word16 var1, Word16 var2)

{
    Word16 var_out;

#ifdef WITH_SAT
    if (var2 >= 15) var_out = (var1 < 0) ? -1 : 0;
    else if (var1 < 0) var_out = ~((~var1) >> var2);
    else var_out = var1 >> var2;
#else
    var_out = var1>>var2;
#endif
    return (var_out);
}

INL1 Word16 INL2 shr_r (Word16 var1, Word16 var2)

{
    Word16 var_out;

#ifdef WITH_SAT
    if (var2 > 15) var_out = 0;
    else {
        var_out = shr (var1, var2);
        if ((var2 > 0) && ((var1 & ((Word16) 1 << (var2 - 1))) != 0)) var_out++;
    }
#else
    var_out = var1 >> var2;
    if ((var2 > 0) && ((var1 & ((Word16) 1 << (var2 - 1))) != 0)) var_out++;
#endif
    return (var_out);
}

INL1 Word16 INL2 mult (Word16 var1, Word16 var2)

{
    Word16 var_out;
    Word32 L_product;

#ifdef WITH_SAT
    L_product = (Word32) var1 *(Word32) var2;
    L_product = (L_product & (Word32) 0xffff8000L) >> 15;
    if (L_product & (Word32) 0x00010000L) L_product = L_product | (Word32) 0xffff0000L;
    var_out = saturate (L_product);
#else
    L_product = (Word32) var1 *(Word32) var2;
    L_product = (L_product & (Word32) 0xffff8000L) >> 15;
    var_out = L_product;
#endif
    return (var_out);
}

INL1 Word32 INL2 L_mult (Word16 var1, Word16 var2)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    L_var_out = (Word32) var1 *(Word32) var2;
    if (L_var_out != (Word32) 0x40000000L) L_var_out *= 2;
    else {
        Overflow = 1;
        L_var_out = MAX_32;
    }
#else
   L_var_out = ((Word32) var1 *(Word32) var2)<<1;
#endif
    return (L_var_out);
}

INL1 Word32 INL2 L_add (Word32 L_var1, Word32 L_var2)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    L_var_out = L_var1 + L_var2;
    if (((L_var1 ^ L_var2) & MIN_32) == 0) {
        if ((L_var_out ^ L_var1) & MIN_32) {
            L_var_out = (L_var1 < 0) ? MIN_32 : MAX_32;
            Overflow = 1;
        }
    }
#else
    L_var_out = L_var1 + L_var2;
#endif
    return (L_var_out);
}

INL1 Word32 INL2 L_sub (Word32 L_var1, Word32 L_var2)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    L_var_out = L_var1 - L_var2;
    if (((L_var1 ^ L_var2) & MIN_32) != 0) {
        if ((L_var_out ^ L_var1) & MIN_32) {
            L_var_out = (L_var1 < 0L) ? MIN_32 : MAX_32;
            Overflow = 1;
        }
    }
#else
    L_var_out = L_var1 - L_var2;
#endif
    return (L_var_out);
}

INL1 Word16 INL2 rounds (Word32 L_var1)

{
    Word16 var_out;
    Word32 L_rounded;

#ifdef WITH_SAT
    L_rounded = L_add (L_var1, (Word32) 0x00008000L);
    var_out = extract_h (L_rounded);
#else
    var_out = extract_h(L_var1 + (Word32) 0x00008000L);
#endif
    return (var_out);
}

INL1 Word32 INL2 L_shr (Word32 L_var1, Word16 var2)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    if (var2 >= 31) {
        L_var_out = (L_var1 < 0L) ? -1 : 0;
    } else {
        if (L_var1 < 0) L_var_out = ~((~L_var1) >> var2);
        else L_var_out = L_var1 >> var2;
    }
#else
    L_var_out = L_var1 >> var2;
#endif
    return (L_var_out);
}

INL1 Word32 INL2 L_mac (Word32 L_var3, Word16 var1, Word16 var2)

{
    Word32 L_var_out;
    Word32 L_product;

    L_product = L_mult (var1, var2);
    L_var_out = L_add (L_var3, L_product);
    return (L_var_out);
}

INL1 Word16 INL2 mac_r (Word32 L_var3, Word16 var1, Word16 var2)

{
    Word16 var_out;

    L_var3 = L_mac (L_var3, var1, var2);
    L_var3 = L_add (L_var3, (Word32) 0x00008000L);
    var_out = extract_h (L_var3);
    return (var_out);
}

INL1 Word32 INL2 L_msu (Word32 L_var3, Word16 var1, Word16 var2)

{
    Word32 L_var_out;
    Word32 L_product;

    L_product = L_mult (var1, var2);
    L_var_out = L_sub (L_var3, L_product);
    return (L_var_out);
}

INL1 Word16 INL2 msu_r (Word32 L_var3, Word16 var1, Word16 var2)

{
    Word16 var_out;

    L_var3 = L_msu (L_var3, var1, var2);
    L_var3 = L_add (L_var3, (Word32) 0x00008000L);
    var_out = extract_h (L_var3);
    return (var_out);
}



INL1 Word32 INL2 L_negate (Word32 L_var1)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    L_var_out = (L_var1 == MIN_32) ? MAX_32 : -L_var1;
#else
    L_var_out = -L_var1;
#endif
    return (L_var_out);
}

INL1 Word16 INL2 mult_r (Word16 var1, Word16 var2)

{
    Word16 var_out;
    Word32 L_product_arr;

#ifdef WITH_SAT
    L_product_arr = (Word32) var1 *(Word32) var2;       /* product */
    L_product_arr += (Word32) 0x00004000L;      /* round */
    L_product_arr &= (Word32) 0xffff8000L;
    L_product_arr >>= 15;       /* shift */
    if (L_product_arr & (Word32) 0x00010000L)   /* sign extend when necessary */
        L_product_arr |= (Word32) 0xffff0000L;
    var_out = saturate (L_product_arr);
#else
    L_product_arr = (Word32) var1 *(Word32) var2;       /* product */
    L_product_arr += (Word32) 0x00004000L;      /* round */
    L_product_arr >>= 15;       /* shift */
    var_out = L_product_arr;
#endif
    return (var_out);
}

INL1 Word32 INL2 L_shl (Word32 L_var1, Word16 var2)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    L_var_out = L_var1;
    for (; var2 > 0; var2--) {
        if (L_var1 > (Word32) 0X3fffffffL) {
            Overflow = 1;
            L_var_out = MAX_32;
            break;
        } else {
            if (L_var1 < (Word32) 0xc0000000L) {
                Overflow = 1;
                L_var_out = MIN_32;
                break;
            }
        }
        L_var1 *= 2;
        L_var_out = L_var1;
    }
#else
    L_var_out = L_var1<<var2;
#endif
    return (L_var_out);
}

INL1 Word32 INL2 L_shr_r (Word32 L_var1, Word16 var2)

{
    Word32 L_var_out;

#ifdef WITH_SAT
    if (var2 > 31) L_var_out = 0;
    else {
        L_var_out = L_shr (L_var1, var2);
        if ((var2 > 0) && ((L_var1 & ((Word32) 1 << (var2 - 1))) != 0)) L_var_out++;
    }
#else
   L_var_out = L_var1>>var2;
   if ((var2 > 0) && ((L_var1 & ((Word32) 1 << (var2 - 1))) != 0)) L_var_out++;
#endif
    return (L_var_out);
}


INL1 Word16 INL2 norm_s (Word16 var1)

{
    Word16 var_out;

    if (var1 == 0) var_out = 0;
    else if (var1 == (Word16) 0xffff) var_out = 15;
    else {
        if (var1 < 0) var1 = ~var1;
        for (var_out = 0; var1 < 0x4000; var_out++) var1 <<= 1;
    }
    return (var_out);
}

INL1 Word16 INL2 norm_l (Word32 L_var1)

{
    Word16 var_out;

    if (L_var1 == 0) var_out = 0;
    else if (L_var1 == (Word32) 0xffffffffL) var_out = 31;
    else {
        if (L_var1 < 0) L_var1 = ~L_var1;
        for (var_out = 0; L_var1 < (Word32) 0x40000000L; var_out++) L_var1 <<= 1;
    }
    return (var_out);
}

INL1 Word16 INL2 div_s (Word16 var1, Word16 var2)

{
    Word16 var_out = 0;
    Word16 iteration;
    Word32 L_num;
    Word32 L_denom;

    if (var1 == 0) var_out = 0;
    else if (var1 == var2) var_out = MAX_16;
    else {
        L_num = L_deposit_l (var1);
        L_denom = L_deposit_l (var2);
        for (iteration = 0; iteration < 15; iteration++) {
            var_out <<= 1;
            L_num <<= 1;
            if (L_num >= L_denom) {
                L_num = L_sub (L_num, L_denom);
                var_out = add (var_out, 1);
            }
        }
    }
    return (var_out);
}


#ifndef MISC_FRACT_DPF
INL1 int INL2 mpyfrlluu(unsigned short int a, unsigned short int b)

{
        unsigned int p = (a*b)<<1;

        return p;
}

INL1 int INL2 mpyfrhlsu(short int a, unsigned short int b)

{
        int p = (a*b)<<1;
        return p;
}

INL1 int INL2 macfrhlsu(int c, short int a, unsigned short int b)

{
        return (int) (c + ((a*b)<<1));
}
INL1 int INL2 dmacfrhlsu(int c, short int a, unsigned short int b)

{
        return (int) (c>>16) + ((a*b)<<1);
}

INL1 int INL2 dmacfrhhss(int c, short int a, short int b)

{
        return (int) (c>>16) + ((a*b)<<1);
}

#define __lsp(n) (n & 0x0FFFF)
#define __msp(n) ((n>>16) & 0x0FFFF)

INL1 int INL2 Mpy_32(int a, int b)

{
        int d2;

        d2 =  mpyfrlluu(    __lsp(a), __lsp(b));
        d2 = dmacfrhlsu(d2, __msp(a), __lsp(b));
        d2 =  macfrhlsu(d2, __msp(b), __lsp(a));
        d2 = dmacfrhhss(d2, __msp(a), __msp(b));
	return d2;
}

INL1 int INL2 Mpy_32_16(int a, short int b)

{
        int d2;

        d2 =  mpyfrhlsu(    __lsp(b), __lsp(a));
        d2 = dmacfrhhss(d2, __msp(a), __lsp(b));
	return d2;
}

INL1 Word32 INL2 Div_32 (Word32 L_num, Word32 L_denom)

{
    Word16 approx;
    Word32 L_32;

    /* First approximation: 1 / L_denom = 1/msp(L_denom) */
    approx = div_s ((Word16) 0x3fff, extract_h(L_denom)); // approx = 0.5/Dh

    /* 1/L_denom = approx * (2.0 - L_denom * approx) */
    L_32 = Mpy_32_16 (L_denom, approx);
    L_32 = L_sub ((Word32) 0x7fffffffL, L_32);
    L_32 = Mpy_32_16 (L_32, approx);			// 1/(4*D) = 0.5/Dh * (1.0 - D*(0.5/Dh)) 

    /* L_num * (1/L_denom) */
    L_32 = Mpy_32 (L_num, L_32);
    L_32 = L_shl (L_32, 2);

    return (L_32);
}

#else
// MISC_FRACT_DPF
// Double precision with Long = Hi<<16 + Low<<1                
INL1 void INL2 L_Extract (Word32 L_32, Word16 *hi, Word16 *lo)

{
    *hi = extract_h (L_32);
    *lo = extract_l (L_msu (L_shr (L_32, 1), *hi, 16384));
    return;
}

INL1 Word32 INL2 L_Comp (Word16 hi, Word16 lo)

{
    Word32 L_32;

    L_32 = L_deposit_h (hi);
    return (L_mac (L_32, lo, 1));       /* = hi<<16 + lo<<1 */
}

INL1 Word32 INL2 Mpy_32 (Word16 hi1, Word16 lo1, Word16 hi2, Word16 lo2)

{
    Word32 L_32;

    L_32 = L_mult (hi1, hi2);
    L_32 = L_mac (L_32, mult (hi1, lo2), 1);
    L_32 = L_mac (L_32, mult (lo1, hi2), 1);

    return (L_32);
}

INL1 Word32 INL2 Mpy_32_16 (Word16 hi, Word16 lo, Word16 n)

{
    Word32 L_32;

    L_32 = L_mult (hi, n);
    L_32 = L_mac (L_32, mult (lo, n), 1);

    return (L_32);
}

INL1 Word32 INL2 Div_32 (Word32 L_num, Word16 denom_hi, Word16 denom_lo)

{
    Word16 approx, hi, lo, n_hi, n_lo;
    Word32 L_32;

    /* First approximation: 1 / L_denom = 1/denom_hi */
    approx = div_s ((Word16) 0x3fff, denom_hi);
    /* 1/L_denom = approx * (2.0 - L_denom * approx) */
    L_32 = Mpy_32_16 (denom_hi, denom_lo, approx);
    L_32 = L_sub ((Word32) 0x7fffffffL, L_32);
    L_Extract (L_32, &hi, &lo);
    L_32 = Mpy_32_16 (hi, lo, approx);

    /* L_num * (1/L_denom) */
    L_Extract (L_32, &hi, &lo);
    L_Extract (L_num, &n_hi, &n_lo);
    L_32 = Mpy_32 (n_hi, n_lo, hi, lo);
    L_32 = L_shl (L_32, 2);

    return (L_32); // 24 bits precision
}
#endif

#endif




