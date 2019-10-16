# Avoid useless warnings on std_logic_arith
set severity_pack_assert_off {warning note}
set pack_assert_off {ieee.STD_LOGIC_ARITH}
set assert_report_level error

# Set database
database -open -shm test

# Create probes
probe -create -depth all -tasks -functions -all

# Run test
# run
# exit

