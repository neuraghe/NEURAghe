############## post_route_design.tcl ##################
report_timing_summary -file timing_pre_post_route_design.rpt
write_checkpoint -force pre_post_route_design_script.dcp
place_design -post_place_opt
phys_opt_design -directive Explore
route_design -directive Explore

phys_opt_design -directive AggressiveFanoutOpt

#-directive Explore - Increased placer effort in detail placement and post-placement optimization.
#-directive ExtraPostPlacementOpt - Increased placer effort in post-placement optimization.
