# OR1K Toolchain changelog #

+ **22-03-2015, v1.8.0
  - Added l.cnt and l.clb
  - Updated or1ksim
  - Fixed a couple of bugs in LLVM
  - `pulp3` CPU has crtl, mac3, mul16, ff1, fl1 instructions enabled by default

+ **06-03-2015, v1.7.3
  - Updated LLVM and Clang to v3.7.0
  - Implemented new instrucitons in or1ksim

+ **18-02-2015, v1.7.2
  - Bug fixes

+ **11-02-2015, v1.7.1
  - Added option to llv-objdump to print an human readable representation
    of instruction encoding (-show-hr-enc)
  - Updated LLVM and Clang
  - Bug fixes

+ **06-02-2015, v1.7.0
  - Readded reg+reg store instructions
  - Updated load/store instructions opcodes
  - Added "interrupt" attribute
  - Added support to unaligned memory accesses

+ **30-01-2015, v1.6.5
  - Fixed bug in encoding of l.mac.* instructions

+ **29-01-2015, v1.6.4
  - Toolchain is now stripped
  - Updated l.[mac|msb|mul].* and vectorial instructions

+ **23-01-2015, v1.6.3
  - Fixed bug with LNS floats
  - libmpfr, libgmp, ... compiled statically

+ **16-01-2015, v1.6.2
  - Finished adding all the vectorial intrinsics
  - Small optimizations for vectorial instructions

+ **15-01-2015, v1.6.1
  - Fixed bug in lv32.ext and lv32.ins encoding
  - Added lv32.cmp*, lv32.any*, lv32.all*
  - More intrinsics for vectorial instructions

+ **13-01-2015, v1.6.0
  - Working vectorial support to instructions in section IV
  - Support to l.abs, l.min, l.max, l.avg
  - Updated ELD with minor modifications

+ **17-12-2014, v1.5.13
  - New LNS format
  - Added lf.pow.s and lf.powi.s

+ **09-12-2014, v1.5.12 **
  - "hi", "lo", "got", ... relocations works also on immediates

+ **04-12-2014, v1.5.11**
  - Fixed another small problem with float

+ **28-11-2014, v1.5.10**
  - Fixed problem with int* <-> float* cast

+ **28-11-2014, v1.5.9**
  - l.abs must not be always generated

+ **28-11-2014, v1.5.8**
  - Updated LNS conversion functions

+ **24-11-2014, v1.5.7b*
  - Clang is compiled with libstdc++ statically linked

+ **19-11-2014, v1.5.7**
  - Added missing l.lws instruction
  - Fixed minor bugs

+ **18-11-2014, v1.5.6**
  - Added "-print-hex-imm" and "-symbolize" in llvm-objdump

+ **06-11-2014, v1.5.5**
  - Fixed a bug in compiler pass for MAC

+ **03-11-2014, v1.5.4**
  - Working MAC pass, 32-bit only for now
  - Added min/max/abs/cnt/ instructions
  - Initial implementation of some vectorial instructions

+ **27-10-2014, v1.5.3**
  - Added option to encode all the floating point numbers in the LNS format
  - Reworked implementation that handles custom float instruction latencies

+ **20-10-2014, v1.5.2**
  - Added option to specify float instruction latencies

+ **17-10-2014, v1.5.1**
  - Updated LLVM, Clang, compiler-rt

+ **05-10-2014, v1.5.0**
  - Added `or1k-elf-clang` and `or1kle-elf-clang` symlinks
  - Updated features of `pulp3` CPU
  - Renamed `pulp` CPU to `pulp2`
