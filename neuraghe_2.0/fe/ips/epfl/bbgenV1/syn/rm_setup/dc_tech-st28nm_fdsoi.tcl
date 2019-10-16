#--------------------------------------------------
# Technology specific setup for DC flow
#--------------------------------------------------


#--------------------------------------------------
# Dont use cells
#--------------------------------------------------

# Internal tristate cells
if {[sizeof_collection [get_lib_cells -quiet "saed32*/TNBUFF*"]] > 0} {
        set_dont_use [get_lib_cells -quiet "saed32*/TNBUFF*"]
}
if 0 {
        # Always on cells
        if {[sizeof_collection [get_lib_cells -quiet "saed32*/AOBUF*"]] > 0} {
                set_dont_use [get_lib_cells -quiet "saed32*/AOBUF*"]
        }
        if {[sizeof_collection [get_lib_cells -quiet "saed32*/AOINV*"]] > 0} {
                set_dont_use [get_lib_cells -quiet "saed32*/AOINV*"]
        }
        set_dont_use [get_lib_cells -quiet */PMT*]
        set_dont_use [get_lib_cells -quiet */NMT*]
}
# Isolation cells
if {[sizeof_collection [get_lib_cells -quiet "saed32*/ISO*"]] > 0} {
        set_dont_use [get_lib_cells -quiet "saed32*/ISO*"]
}

# Allow dual-supply ISO cells only:
if {[sizeof_collection [get_lib_cells -quiet "saed32*/ISO*AO*"]] > 0} {
        remove_attribute -quiet [get_lib_cells -quiet "saed32*/ISO*AO*"] dont_use
}

# Rentention FF cells - libs _rd
if {[sizeof_collection [get_lib_cells -quiet "saed32*/RDFF*"]] > 0} {
        set_dont_use [get_lib_cells -quiet "saed32*/RDFF*"]
}
if {[sizeof_collection [get_lib_cells -quiet "saed32*/RSDFF*"]] > 0} {
        set_dont_use [get_lib_cells -quiet "saed32*/RSDFF*"]
}
# Bad cells - logical/physical mismatch
if {[sizeof_collection [get_lib_cells -quiet "*/PGX*"]] > 0} {
        set_dont_use [get_lib_cells -quiet "*/PGX*"]
}
if {[sizeof_collection [get_lib_cells -quiet "*/BSLEX*"]] > 0} {
        set_dont_use [get_lib_cells -quiet "*/BSLEX*"]
}
if {[sizeof_collection [get_lib_cells -quiet "*/SDFFSSRX1_HVT"]] > 0} {
        set_dont_use [get_lib_cells -quiet "*/SDFFSSRX2_HVT */SDFFSSRX1_HVT"]
}
if {[sizeof_collection [get_lib_cells -quiet "*/SDFFSSRX1_LVT"]] > 0} {
        set_dont_use [get_lib_cells -quiet "*/SDFFSSRX2_LVT */SDFFSSRX1_LVT"]
}
if {[sizeof_collection [get_lib_cells -quiet "*/SDFFSSRX1"]] > 0} {
        set_dont_use [get_lib_cells -quiet "*/SDFFSSRX2 */SDFFSSRX1"]
}
if {[sizeof_collection [get_lib_cells -quiet "*/DELLN2X2_HVT"]] > 0} {
        set_dont_use [get_lib_cells -quiet "*/DELLN2X2_HVT"]
}


# These are used to make constraint files technology independent

set tech(libname,wc_rvt) {saed32rvt_ss0p75vn40c}
set tech(libname,wc_hvt) {saed32hvt_ss0p75vn40c}
set tech(libname,wc_lvt) {saed32lvt_ss0p75vn40c}
set tech(libname,bc_rvt) {saed32rvt_ff0p95vn40c}
set tech(libname,bc_hvt) {saed32hvt_ff0p95vn40c}
set tech(libname,bc_lvt) {saed32lvt_ff0p95vn40c}

if {[sizeof_collection [get_libs -quiet $tech(libname,wc_rvt)]] > 0} {
  set tech(libname,wc) $tech(libname,wc_rvt)
  set tech(driving_cell,isolate) {NBUFFX16_RVT}
  set tech(driving_cell,clock)   {INVX8_RVT}
  set tech(driving_cell,default) {INVX1_RVT}
  if {[sizeof_collection [get_libs -quiet $tech(libname,bc_rvt)]] > 0} {
    set tech(libname,bc) $tech(libname,bc_rvt)
  }
} elseif {[sizeof_collection [get_libs -quiet $tech(libname,wc_hvt)]] > 0} {
  set tech(libname,wc) $tech(libname,wc_hvt)
  set tech(driving_cell,isolate) {NBUFFX16_HVT}
  set tech(driving_cell,clock)   {INVX8_HVT}
  set tech(driving_cell,default) {INVX1_HVT}
  if {[sizeof_collection [get_libs -quiet $tech(libname,bc_hvt)]] > 0} {
    set tech(libname,bc) $tech(libname,bc_hvt)
  }
} elseif {[sizeof_collection [get_libs -quiet $tech(libname,wc_lvt)]] > 0} {
  set tech(libname,wc) $tech(libname,wc_lvt)
  set tech(driving_cell,isolate) {NBUFFX16_LVT}
  set tech(driving_cell,clock)   {INVX8_LVT}
  set tech(driving_cell,default) {INVX1_LVT}
  if {[sizeof_collection [get_libs -quiet $tech(libname,bc_lvt)]] > 0} {
    set tech(libname,bc) $tech(libname,bc_lvt)
  }
}

set tech(opcond,wc) {ss0p75vn40c}
set tech(opcond,bc) {ff0p95vn40c}

# Cap unit is ff
set tech(pin_load,small)   {10}
set tech(pin_load,medium)  {30}
set tech(pin_load,large)   {100}
set tech(pin_load,default) $tech(pin_load,medium)

# Added by amins
set tech_io(libname)  {saed32io_max}
set tech_io(cell)     B4I1025
set tech_io(pin,i)    DIN
set tech_io(pin,i_en) EN
set tech_io(pin,o)    DOUT
set tech_io(pin,o_en) R_EN
set tech_io(pin,io)   PADIO


# Some libraries don't have the correct hvt/lvt attributes
# {saed32max_hvt_rdsr saed32max_hth_hvt_rdsr} are broken as well, but not in use currently
#foreach_in_collection lib [get_libs -quiet "saed32max_hth_cg_hvt saed32max_cg_hvt saed32max_hthn_hvt_lsh"] {
#        set_attribute $lib default_threshold_voltage_group saed90cell_hvt
#        regsub -all {hvt} $lib lvt lib
#        set_attribute $lib default_threshold_voltage_group saed90cell_lvt
#}


# Workaround for bad max_cap on SRAM_LP outputs
#set_attribute [get_lib_pins */SRAMLP*/O1*] max_capacitance 16 > /dev/null
#set_attribute [get_lib_pins */SRAMLP*/O2*] max_capacitance 16 > /dev/null

return 1