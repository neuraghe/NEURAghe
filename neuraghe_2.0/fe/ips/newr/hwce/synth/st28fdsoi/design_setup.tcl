
set DESIGN_NAME hwce_top

set PROJ_DIR       "../../rtl/"
set HWPE_SM_DIR    "../../../hwpe-sm"
set APPROX_MUL_DIR "../../../approx_arith/approx-mul3/rtl"
set SEARCH_DIR "../../../hwpe-sm/rtl ../../../hwpe-sm/rtl/axi ../../../hwce/rtl ../../../../../pulp3/fe/rtl/includes"

set search_path [concat \
$SEARCH_DIR \
$search_path]

define_design_lib hwce_lib -path hwce_lib

