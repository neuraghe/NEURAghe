/* not needed, but we need separate linker scripts anyway */
OUTPUT_ARCH(%(coreArchi)s)
SEARCH_DIR(.)
__DYNAMIC  =  0;

MEMORY
{
%(memorySections)s}

/* We have to align each sector to word boundaries as our current s19->slm
 * conversion scripts are not able to handle non-word aligned sections. */

SECTIONS
{
    .vectors :
    {
        . = ALIGN(4);
        KEEP(*(.vectors))
    } > L2
        
    .text : {
        . = ALIGN(4);
        _stext = .;
        *(.text)
        *(.text.*)
        _etext  =  .;
        *(.lit)
        *(.shdata)
        _endtext = .;
    }  > L2

    .dtors : {
        . = ALIGN(4);
        __DTOR_LIST__ = .;
        LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
        KEEP(*(.dtors.start))
        KEEP(*(.dtors))
        LONG(0)
        __DTOR_END__ = .;
    }  > L2

    .rodata : {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        *(.rodata);
        *(.rodata.*)
        . = ALIGN(4);
    } > L2

    /* or1k-specific */
    .got : { *(.got.plt) * (.igot.plt) *(.got) *(.igot) } > L2
    .shbss :
    {
        . = ALIGN(4);
        *(.shbss)
    } > L2
    
    .talias :
    { 
    }  > L2
    
    .data : {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        sdata  =  .;
        _sdata  =  .;
        *(.data);
        *(.data.*)
        . = ALIGN(4);
        edata  =  .;
        _edata  =  .;
    } > L2
    
    
    .bss :
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        _bss_start = .;
        *(.bss)
        *(.bss.*)
        *(.sbss)
        *(.sbss.*)
        *(COMMON)
        . = ALIGN(4);
        _bss_end = .;
    } > L2

    .libgomp : AT(%(sramBaseGlobal)s)
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        *(.libgomp)
        *(.libgomp.*)
        . = ALIGN(4);
    } > L1_sram

    .l1FcTiny : AT(%(sramBaseGlobal)s + SIZEOF(.libgomp))
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        _l1FcShared_start = .;
        *(.l1FcTiny)
        *(.l1FcTiny.*)
        . = ALIGN(4);
        _l1FcShared_end = .;
    } > L1_sram
    
    .l1clusterTiny : AT(%(sramBaseGlobal)s + SIZEOF(.libgomp) + SIZEOF(.l1FcTiny))
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        *(.l1clusterTiny)
        *(.l1clusterTiny.*)
%(fcTinySections)s
        . = ALIGN(4);
    } > L1_sram
    
    .tls : AT(%(sramBaseGlobal)s + SIZEOF(.libgomp) + SIZEOF(.l1FcTiny) + SIZEOF(.l1clusterTiny))
    {
        . = ALIGN(4);
        _tls_start = .;
        *(.tls)
        *(.tls.*)
        . = ALIGN(4);
        _tls_end = .;
    } > L1_sram_tls

    .heapsram (ORIGIN(L1_sram) + SIZEOF(.libgomp) + SIZEOF(.l1FcTiny) + SIZEOF(.l1clusterTiny) + SIZEOF(.tls) * __NB_ACTIVE_PE) : AT(%(sramBaseGlobal)s + SIZEOF(.libgomp) + SIZEOF(.l1FcTiny) + SIZEOF(.l1clusterTiny) + SIZEOF(.tls) * __NB_ACTIVE_PE)
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        *(.heapsram)
        *(.heapsram.*)
%(l1Sections)s
        . = ALIGN(4);
    } > L1_sram

    .l1cluster_g (ORIGIN(L1_sram_G) + SIZEOF(.libgomp) + SIZEOF(.l1FcTiny) + SIZEOF(.l1clusterTiny) + SIZEOF(.tls) * __NB_ACTIVE_PE + SIZEOF(.heapsram)) : AT(%(sramBaseGlobal)s + SIZEOF(.libgomp) + SIZEOF(.l1FcTiny) + SIZEOF(.l1clusterTiny) + SIZEOF(.tls) * __NB_ACTIVE_PE + SIZEOF(.heapsram))
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        *(.l1cluster_g)
        *(.l1cluster_g.*)
        . = ALIGN(4);
        _heapsram_start = .;
    } > L1_sram_G

    _heapsram_size = LENGTH(L1_sram_G) - _heapsram_start + ORIGIN(L1_sram_G) - %(stackSize)s;

%(l1SramSections)s

%(stackSections)s

%(fcSections)s

%(scmSections)s

    .heapl2ram :
    {
        /* Due to limitations on FPGA loader, loadable sections must have base and size aligned on 4 bytes */
        . = ALIGN(4);
        *(.heapl2ram)
        . = ALIGN(4);
        _heapl2ram_start = .;
    } > L2

    .boot :
    {
        /* We put the boot code a bit after the beginning of L2 heap so that it is automatically dropped after booting
         * The L2 allocator should just access the first words of the heap to initialize the free block */
        . = . + 0x100;
        *(.boot)
        *(.boot.data)
        . = ALIGN(4);
        __CTOR_LIST__ = .;
        LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
        KEEP(*(.ctors.start))
        KEEP(*(.ctors))
        KEEP (*(SORT(.init_array.*)))
        KEEP (*(.init_array ))
        LONG(0)
        __CTOR_END__ = .;
    } > L2
        


    _heapl2ram_size = LENGTH(L2) - _heapl2ram_start + ORIGIN(L2);

    .stab  0 (NOLOAD) :
    {
        [ .stab ]
    }
    
    .stabstr  0 (NOLOAD) :
    {
        [ .stabstr ]
    }
}

