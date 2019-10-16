# OR1K Toolchain #

## Toolchain binaries ##

In the `bin` directory of the toolchain there are all the binaries of our
toolchain

* or1k-elf-*    - big endian version of the GNU compiler and tools
* or1kle-elf-*  - little endian version of the GNU compiler and tools
* llvm-*        - various LLVM tools, for both big and little endian CPUs
* or32-elf-*    - big endian version of the or1k-simulator
* or32le-elf-*  - little endian version of the or1k-simulator

## Clang ##

### Targets ###
We have 2 targets (-target <target_name>) `or1k` and `or1k-elf`, the former
can be used only to compile programs, the latter can also link togheter files
to create ELF objects, use always `or1k-elf`.

Our compiler must be invoked like this

    clang -target or1k-elf ....

As an alternative there is a symlink `or1k-elf-clang`, by using this command
you can omit the `-target` option

    or1k-elf-clang ...

### Features ###
We have defined a couple of features that can be enable/disabled

* cmov   - Enable conditional move.
* crtl   - Enable min/max/abs/cnt instructions
* div    - Enable hardware divider.
* ext    - Enable sign/zero extend instructions.
* fbit   - Enable find first/last bit instructions.
* hwlp   - Enable hardware loops.
* idxls  - Enable indexed load/store instructions.
* lswa   - Enable load/store word atomic instruction.
* lv32   - Enable vectorial instructions
* mac    - Enable MAC instructions.
* mac3   - Enable MAC instructions with explicit destination register.
* mul    - Enable hardware multiplier.
* mul16  - Enable 16 bits multiplications.
* mul64  - Enable 64-bit hardware multiplier.
* ror    - Enable hardware rotate right.
* rrls   - Enable load/store register base/offset.

* unalign-ls  - Enable unaligned memory accesses.

Features are forced to be enable using `-m<feature_name>` or disable using
`-mno-<feature_name>`.

### CPUs ###
We have defined some CPUs that have a set of feature enabled by default

* generic  -
* or1200   - mul, ror, ext, sfii
* pulp2    - mul, ror, ext, sfii, cmov, fbit
* pulp3    - mul, ror, ext, sfii, cmov, idxls, rrls, hwlp (max 2)

The CPU is selected using `-mcpu=<cpu_name>`, if no CPU is specified `generic`
is used.

### Hardware loops ###
PULP3 has hardware loops enabled by default. There is an option to change the
number of available hardware loops `-mmax-hwloops=<number_of_hwlp>` (the
maximum number is 4).

In functions marked with the attribute "interrupt" the generation of hardware
loop instructions is disabled.

__attribute__((interrupt)) void isr() {
  // lp.* instructions won't be generated
  ...
}

### Floating point instructions latencies ###
The latencies of floating point instructions can be changed using and external
file where are specified the custom latencies.
The file must use the following format

    ADD,4
    SUB,1
    FTOI,4
    IOTF,4
    MUL,1
    DIV,1
    REM,1
    SET_FLAG,1

There is an option `-mllvm -custom-or1k-delays=<file_name>` that can be used to
specify the path of the file with instructions latencies.

### LNS Floats ###
There is an option to encode `float` constants using the LNS format rather than
the standard IEEE754 one, `-mlns-format`. This option is only useful when using
`-mhard-float` otherwise it won't change anything.
There is problem with the `double` type. Since the CPU doesn't support double
precision floating-point instructions the computation is performed using
builtin functions (e.g. extendsfdf2, truncdfsf2), these functions work only
with floating-point numbers encoded with the IEEE754 standard. Therefore,
conversion from `float` to `double`, and vice versa, won't work.

### Delay slot model ###
We have defined 3 different delay slot models

* no-delay      - there is no delay slot
* delay         - branch and jump instructions have delay slot, the compiler
  will try to fill the delay slot with some instructions, otherwise a nop
  instruction is added
* compat-delay  - after each branch or jump instructions a nop is
  added, this is a compatibily mode, binaries compiled with compat-delay
  will work on a CPU with or without delay slots

The `generic` CPU uses the `compat-delay` mode while all the others have the
`delay` model, which is also the default. Delay slot models are enabled
using `-m<delay_slot_model>`.


## LLVM tools ##
LLVM provides a series of tools that are equivalent to `or1k-elf-readelf` and
so on. While GNU tools can still be used, `or1k-elf-objdump` won't work because
it's not aware of the new instructions of `pulp3` (hardware loops and
load/store). However, it can be replaced with `llvm-objdump`

    llvm-objdump -mcpu=pulp3 ...

There are some options to change the output of llvm-objdump that can be useful

* `-print-imm-hex`  - immediates are printed using hexadecimal notation
* `-symbolize`      - branch and call target are expressed also with symbols
* `-show-hr-enc`    - prints and extra column with an human readable
                      representation of instruction encoding

If you use some instructions that are not enabled in the selected CPU there's
an option `-mattr=...` where you can add the comma separated list of
needed features (i.e. `-mattr=lv32,mac3`).

## Newlib ##
libc and libm are compiled with `clang` for the `pulp3` CPU. This means that
new load/store instructions and hardware loops are used also in these
libraries.
