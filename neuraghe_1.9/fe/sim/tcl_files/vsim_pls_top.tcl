# yes I know this looks ugly, but for some reason vsim deso not recognize the VSIM_FLAGS as correct arguments :-/
# e.g. it did not recognize the -pli ./something.so argument
set cmd "vsim -quiet $TB \
  -L tech_lib \
  -L common_cells_lib \
  -L fll_lib \
  -L hm_lib \
  +nowarn \
  +nowarnTRAN \
  +nowarnTSCALE \
  +nowarnTFMPC \
  -t ps \
  -voptargs=\"+acc -suppress 2103\" \
  $VSIM_FLAGS"

eval $cmd
