#ifndef _OR1K_INTRINSICS
#define _OR1K_INTRINSICS

#define __RESET_CYCLE_CNT         "15"
#define __REPORT_CYCLE_CNT        "14"
#define __PUSH_TIMER        	  "16"
#define __REPORT_TIMER        	  "17"
#define __POP_TIMER        	  "18"

typedef short          __v2hi __attribute__((vector_size (4)));
typedef _Fract         __v2hq __attribute__((vector_size (4)));
// typedef _Fract 	       __v2hq __attribute__ ((mode(V2HQ)));

typedef signed char    __v4qi __attribute__((vector_size (4)));
typedef short _Fract   __v4qq __attribute__((vector_size (4)));
// typedef short _Fract   __v4qq __attribute__ ((mode(V4QQ)));

// Nasty hack to avoid saturation when moving long fract to int
typedef union {
        long _Fract as_long_fract;
        int as_int;
} Bit_Wise_Fract;

__extension__ static __inline int __attribute__ ((__always_inline__)) _ff1 (int src1)
{
  	return (int)__builtin_or1k_ff1 ((int)src1);
}

__extension__ static __inline int __attribute__ ((__always_inline__)) _fl1 (int src1)
{
  	return (int)__builtin_or1k_fl1 ((int)src1);
}

// Vectorial support for int types

// Add
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _add2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_add2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _add4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_add4 ((__v4qi)src1, (__v4qi)src2);
}

// Sub
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _sub2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_sub2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _sub4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_sub4 ((__v4qi)src1, (__v4qi)src2);
}

// Max
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _max2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_max2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _max4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_max4 ((__v4qi)src1, (__v4qi)src2);
}

// Min
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _min2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_min2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _min4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_min4 ((__v4qi)src1, (__v4qi)src2);
}

// Shift right logical
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _srl2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_srl2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _srl4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_srl4 ((__v4qi)src1, (__v4qi)src2);
}

// Shift right arithmetic
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _sra2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_sra2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _sra4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_sra4 ((__v4qi)src1, (__v4qi)src2);
}

// Shift left
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _sll2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_sll2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _sll4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_sll4 ((__v4qi)src1, (__v4qi)src2);
}

// Average
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _avg2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_avg2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _avg4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_avg4 ((__v4qi)src1, (__v4qi)src2);
}

// Mult
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _mult2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_mult2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _mult4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_mult4 ((__v4qi)src1, (__v4qi)src2);
}

// Mac
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _mac2 (__v2hi src1, __v2hi src2, __v2hi src3)
{
  	return (__v2hi)__builtin_or1k_mac2 ((__v2hi)src2, (__v2hi)src3, (__v2hi)src1);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _mac4 (__v4qi src1, __v4qi src2, __v4qi src3)
{
  	return (__v4qi)__builtin_or1k_mac4 ((__v4qi)src2, (__v4qi)src3, (__v4qi)src1);
}

// Abs
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _abs2 (__v2hi src1)
{
  	return (__v2hi)__builtin_or1k_abs2 ((__v2hi)src1);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _abs4 (__v4qi src1)
{
  	return (__v4qi)__builtin_or1k_abs4 ((__v4qi)src1);
}

// Neg
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _neg2 (__v2hi src1)
{
  	return (__v2hi)__builtin_or1k_neg2 ((__v2hi)src1);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _neg4 (__v4qi src1)
{
  	return (__v4qi)__builtin_or1k_neg4 ((__v4qi)src1);
}

// Logical and
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _and2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_and2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _and4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_and4 ((__v4qi)src1, (__v4qi)src2);
}

// Logical or
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _or2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_or2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _or4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_or4 ((__v4qi)src1, (__v4qi)src2);
}

// Logical xor
__extension__ static __inline __v2hi __attribute__ ((__always_inline__)) _exor2 (__v2hi src1, __v2hi src2)
{
  	return (__v2hi)__builtin_or1k_exor2 ((__v2hi)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qi __attribute__ ((__always_inline__)) _exor4 (__v4qi src1, __v4qi src2)
{
  	return (__v4qi)__builtin_or1k_exor4 ((__v4qi)src1, (__v4qi)src2);
}

// Mac on short int
__extension__ static __inline int  __attribute__ ((__always_inline__)) _macsi (int src1, short int src2, short int src3)
{
  	return (int)__builtin_or1k_mac_si((short int) src2, (short int) src3, (int) src1);
}

// Msu on short int
__extension__ static __inline int  __attribute__ ((__always_inline__)) _msusi (int src1, short int src2, short int src3)
{
  	return (int)__builtin_or1k_msu_si((short int) src2, (short int) src3, (int) src1);
}

// Non vectorial Fractional Support


__extension__ static __inline _Fract  __attribute__ ((__always_inline__)) _extract_l (long _Fract src1)

{
	return (_Fract)__builtin_or1k_extractl((long _Fract) src1);
}

__extension__ static __inline _Fract  __attribute__ ((__always_inline__)) _extract_h (long _Fract src1)

{
	return (_Fract)__builtin_or1k_extracth((long _Fract) src1);
}

__extension__ static __inline long _Fract  __attribute__ ((__always_inline__)) _mulfr (_Fract src1, _Fract src2)
{
  	return (long _Fract)__builtin_or1k_multfr((_Fract) src1, (_Fract) src2);
}

__extension__ static __inline long _Fract  __attribute__ ((__always_inline__)) _mulsfr (short _Fract src1, short _Fract src2)
{
  	return (long _Fract)__builtin_or1k_multsfr((short _Fract) src1, (short _Fract) src2);
}

__extension__ static __inline long _Fract  __attribute__ ((__always_inline__)) _macfr (long _Fract src1, _Fract src2, _Fract src3)
{
  	return (long _Fract)__builtin_or1k_macfr((_Fract) src2, (_Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract  __attribute__ ((__always_inline__)) _macsfr (long _Fract src1, short _Fract src2, short _Fract src3)
{
  	return (long _Fract)__builtin_or1k_macsfr((short _Fract) src2, (short _Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract  __attribute__ ((__always_inline__)) _msufr (long _Fract src1, _Fract src2, _Fract src3)
{
  	return (long _Fract)__builtin_or1k_msufr((_Fract) src2, (_Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract  __attribute__ ((__always_inline__)) _msusfr (long _Fract src1, short _Fract src2, short _Fract src3)
{
  	return (long _Fract)__builtin_or1k_msusfr((short _Fract) src2, (short _Fract) src3, (long _Fract) src1);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _macrfr(long _Fract src1, _Fract src2, _Fract src3)

{
	return (_Fract) __builtin_or1k_macrfr((_Fract) src2, (_Fract) src3, (long _Fract) src1);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _msurfr(long _Fract src1, _Fract src2, _Fract src3)

{
	return (_Fract) __builtin_or1k_msurfr((_Fract) src2, (_Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _dmacsufr(long _Fract src1, long _Fract src2, long _Fract src3)

{
	return (long _Fract) __builtin_or1k_dmacsufr((long _Fract) src2, (long _Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _dmacssfr(long _Fract src1, long _Fract src2, long _Fract src3)

{
	return (long _Fract) __builtin_or1k_dmacssfr((long _Fract) src2, (long _Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _macsufr(long _Fract src1, long _Fract src2, long _Fract src3)

{
	return (long _Fract) __builtin_or1k_macsufr((long _Fract) src2, (long _Fract) src3, (long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _muluufr(long _Fract src1, long _Fract src2)

{
	return (long _Fract) __builtin_or1k_muluufr((long _Fract) src1, (long _Fract) src2);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _mulsufr(long _Fract src1, long _Fract src2)

{
	return (long _Fract) __builtin_or1k_mulsufr((long _Fract) src1, (long _Fract) src2);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _mulrfr(_Fract src1, _Fract src2)

{
	return (_Fract) __builtin_or1k_mulrfr((_Fract) src1, (_Fract) src2);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _addfr(_Fract src1, _Fract src2)

{
	return (_Fract) __builtin_or1k_addfr((_Fract) src1, (_Fract) src2);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _addlfr(long _Fract src1, long _Fract src2)

{
	return (long _Fract) __builtin_or1k_addlfr((long _Fract) src1, (long _Fract) src2);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _subfr(_Fract src1, _Fract src2)

{
	return (_Fract) __builtin_or1k_subfr((_Fract) src1, (_Fract) src2);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _sublfr(long _Fract src1, long _Fract src2)

{
	return (long _Fract) __builtin_or1k_sublfr((long _Fract) src1, (long _Fract) src2);
}

__extension__ static __inline int __attribute__ ((__always_inline__)) _clb(long _Fract src1)

{
	return (int) __builtin_or1k_clb((long _Fract) src1);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _rnd(long _Fract src1)

{
	return (_Fract) __builtin_or1k_rnd((long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _abslfr(long _Fract src1)

{
	return (long _Fract) __builtin_or1k_abs_sq((long _Fract) src1);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _absfr(_Fract src1)

{
	return (_Fract) __builtin_or1k_abs_sq((_Fract) src1);
}

__extension__ static __inline _Fract __attribute__ ((__always_inline__)) _sat16(long _Fract src1)

{
	return (_Fract) __builtin_or1k_sat16((long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _sat32(long _Fract src1)

{
	return (long _Fract) __builtin_or1k_sat32((long _Fract) src1);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _divsfr(long _Fract src1, _Fract src2)

{
	return (long _Fract) __builtin_or1k_divsfr((long _Fract) src1, (_Fract) src2);
}

__extension__ static __inline long _Fract __attribute__ ((__always_inline__)) _asr_rnd(long _Fract src1, int src2)

{
        Bit_Wise_Fract Tmp;

        Tmp.as_long_fract = src1;
        Tmp.as_int =  __builtin_or1k_asr_round((int) Tmp.as_int, (int) src2);
        return (long _Fract) Tmp.as_long_fract;
}

// Vectorial support for fractional types

// Add
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _addfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_addfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _addfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_addfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Sub
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _subfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_subfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _subfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_subfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Max
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _maxfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_maxfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _maxfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_maxfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Min
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _minfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_minfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _minfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_minfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Shift right logical
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _srlfr2 (__v2hq src1, __v2hi src2)
{
  	return (__v2hq)__builtin_or1k_srlfr2 ((__v2hq)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _srlfr4 (__v4qq src1, __v4qi src2)
{
  	return (__v4qq)__builtin_or1k_srlfr4 ((__v4qq)src1, (__v4qi)src2);
}

// Shift right arithmetic
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _srafr2 (__v2hq src1, __v2hi src2)
{
  	return (__v2hq)__builtin_or1k_srafr2 ((__v2hq)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _srafr4 (__v4qq src1, __v4qi src2)
{
  	return (__v4qq)__builtin_or1k_srafr4 ((__v4qq)src1, (__v4qi)src2);
}

// Shift left
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _sllfr2 (__v2hq src1, __v2hi src2)
{
  	return (__v2hq)__builtin_or1k_sllfr2 ((__v2hq)src1, (__v2hi)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _sllfr4 (__v4qq src1, __v4qi src2)
{
  	return (__v4qq)__builtin_or1k_sllfr4 ((__v4qq)src1, (__v4qi)src2);
}

// Average
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _avgfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_avgfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _avgfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_avgfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Mult
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _multfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_multfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _multfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_multfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Mac
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _macfr2 (__v2hq src1, __v2hq src2, __v2hq src3)
{
  	return (__v2hq)__builtin_or1k_macfr2 ((__v2hq)src2, (__v2hq)src3, (__v2hq)src1);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _macfr4 (__v4qq src1, __v4qq src2, __v4qq src3)
{
  	return (__v4qq)__builtin_or1k_macfr4 ((__v4qq)src2, (__v4qq)src3, (__v4qq)src1);
}

// Abs
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _absfr2 (__v2hq src1)
{
  	return (__v2hq)__builtin_or1k_absfr2 ((__v2hq)src1);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _absfr4 (__v4qq src1)
{
  	return (__v4qq)__builtin_or1k_absfr4 ((__v4qq)src1);
}

// Neg
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _negfr2 (__v2hq src1)
{
  	return (__v2hq)__builtin_or1k_negfr2 ((__v2hq)src1);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _negfr4 (__v4qq src1)
{
  	return (__v4qq)__builtin_or1k_negfr4 ((__v4qq)src1);
}

// Logical and
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _andfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_andfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _andfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_andfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Logical or
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _orfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_orfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _orfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_orfr4 ((__v4qq)src1, (__v4qq)src2);
}

// Logical xor
__extension__ static __inline __v2hq __attribute__ ((__always_inline__)) _exorfr2 (__v2hq src1, __v2hq src2)
{
  	return (__v2hq)__builtin_or1k_exorfr2 ((__v2hq)src1, (__v2hq)src2);
}
__extension__ static __inline __v4qq __attribute__ ((__always_inline__)) _exorfr4 (__v4qq src1, __v4qq src2)
{
  	return (__v4qq)__builtin_or1k_exorfr4 ((__v4qq)src1, (__v4qq)src2);
}

#endif
