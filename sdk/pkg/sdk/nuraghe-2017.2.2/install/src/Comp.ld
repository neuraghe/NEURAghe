OUTPUT_ARCH(riscv)
SEARCH_DIR(.)
__DYNAMIC  =  0;

SECTIONS
{
    .component.body :
    {
        *(.text)
        *(.text.*)
        *(.rodata);
        *(.rodata.*)
    }
    .others :
    {
        *(.lit)
        *(.shdata)
        *(.data);
        *(.data.*)
        *(.shbss)
        *(.bss)
        *(.bss.*)
        *(.sbss)
        *(.sbss.*)
        *(COMMON)
    }

    .got : { *(.got.plt) * (.igot.plt) *(.got) *(.igot) }

    .libgomp :
    {
        *(.libgomp)
        *(.libgomp.*)
    }

    .l1FcTiny :
    {
        *(.l1FcTiny)
        *(.l1FcTiny.*)
    }
    
    .l1clusterTiny :
    {
        *(.l1clusterTiny)
        *(.l1clusterTiny.*)
    }
    
    .heapsram :
    {
        *(.heapsram)
        *(.heapsram.*)
    }

    .l1cluster_g :
    {
        *(.l1cluster_g)
        *(.l1cluster_g.*)
    }

     .fcTcdmTiny :
     {
       *(.fcTcdmTiny)
       *(.fcTcdmTiny.*)
     }

     .fcTcdm :
     {
       *(.fcTcdm)
       *(.fcTcdm.*)
       *(.fcTcdm_g)
       *(.fcTcdm_g.*)
     }

    .heapl2ram :
    {
        *(.heapl2ram)
    }

    .stab  0 (NOLOAD) :
    {
        [ .stab ]
    }
    
    .stabstr  0 (NOLOAD) :
    {
        [ .stabstr ]
    }
}

