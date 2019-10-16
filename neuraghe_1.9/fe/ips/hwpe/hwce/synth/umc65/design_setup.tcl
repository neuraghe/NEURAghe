
set DESIGN_NAME hwce_top

set PROJ_DIR       "../../rtl/"
set HWPE_SM_DIR    "../../../hwpe-sm"
set APPROX_MUL_DIR "../../../approx_arith/rtl"
set SEARCH_DIR "../../../hwpe-sm/rtl ../../../hwpe-sm/rtl/axi ../../../hwce/rtl ../../../../../mia/rtl/includes"

set search_path [concat \
$SEARCH_DIR \
$search_path]

define_design_lib hwce_lib -path hwce_lib

