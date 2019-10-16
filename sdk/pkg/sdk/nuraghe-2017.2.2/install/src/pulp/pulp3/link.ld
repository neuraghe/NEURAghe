OUTPUT_ARCH(or1k)
SEARCH_DIR(.)
__DYNAMIC  =  0;

MEMORY
{
	ram         : ORIGIN = 0x1c000000, LENGTH = 0x100000
}

SECTIONS
{    
     .vectors :
    {
        . = ALIGN(4);
        KEEP(*(.vectors))
    } > ram
       
	.text : {
		_stext = .;
		*(.text)
		_etext  =  .;
		__CTOR_LIST__ = .;
		LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
		*(.ctors)
		LONG(0)
		__CTOR_END__ = .;
		__DTOR_LIST__ = .;
		LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
		*(.dtors)
		LONG(0)
		__DTOR_END__ = .;
		*(.lit)
		*(.shdata)
		_endtext = .;
	}  > ram
	
	.rodata : {
		*(.rodata);
		*(.rodata.*)
	} > ram
	
	.shbss :
	{
		*(.shbss)
	} > ram
	
	.talias :
	{ 
	}  > ram
	
	.data : {
		sdata  =  .;
		_sdata  =  .;
		*(.data)
		*(.data.*)
		*(.data.rel)
        	*(.data.rel.local)

		edata  =  .;
		_edata  =  .;
	} > ram 

	.got            : { *(.got.plt) *(.igot.plt) *(.got) *(.igot) } > ram 
	
	.bss :
	{
		_bss_start = .;
		*(.bss)
      		*(.bss.*)
        	*(.sbss)
        	*(.sbss.*)
		*(COMMON)
		_bss_end = .;
	} > ram
	
	_l2data_end = .;

	.stab  0 (NOLOAD) :
	{
		[ .stab ]
	}
	
	.stabstr  0 (NOLOAD) :
	{
		[ .stabstr ]
	}

	pulp_l2_heap_start = .;
}
