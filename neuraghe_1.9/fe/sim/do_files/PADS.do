onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group PADS /tb/i_dut/pad_sspi_sio0
add wave -noupdate -expand -group PADS /tb/i_dut/pad_sspi_sio1
add wave -noupdate -expand -group PADS /tb/i_dut/pad_sspi_sio2
add wave -noupdate -expand -group PADS /tb/i_dut/pad_sspi_sio3
add wave -noupdate -expand -group PADS /tb/i_dut/pad_sspi_csn
add wave -noupdate -expand -group PADS /tb/i_dut/pad_sspi_sck
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mspi_sio0
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mspi_sio1
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mspi_sio2
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mspi_sio3
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mspi_csn
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mspi_sck
add wave -noupdate -expand -group PADS /tb/i_dut/pad_uart_tx
add wave -noupdate -expand -group PADS /tb/i_dut/pad_uart_rx
add wave -noupdate -expand -group PADS /tb/i_dut/pad_i2c_sda
add wave -noupdate -expand -group PADS /tb/i_dut/pad_i2c_scl
add wave -noupdate -expand -group PADS /tb/i_dut/pad_audio_i2s_ws
add wave -noupdate -expand -group PADS /tb/i_dut/pad_audio_i2s_sck
add wave -noupdate -expand -group PADS /tb/i_dut/pad_audio_i2s_sdi0
add wave -noupdate -expand -group PADS /tb/i_dut/pad_audio_i2s_sdi1
add wave -noupdate -expand -group PADS /tb/i_dut/pad_cam_i2s_sck
add wave -noupdate -expand -group PADS /tb/i_dut/pad_cam_i2s_ws
add wave -noupdate -expand -group PADS /tb/i_dut/pad_cam_i2s_sdi0
add wave -noupdate -expand -group PADS /tb/i_dut/pad_cam_i2s_sdi1
add wave -noupdate -expand -group PADS /tb/i_dut/pad_power_down
add wave -noupdate -expand -group PADS /tb/i_dut/pad_jtag_tdi
add wave -noupdate -expand -group PADS /tb/i_dut/pad_jtag_tdo
add wave -noupdate -expand -group PADS /tb/i_dut/pad_jtag_tms
add wave -noupdate -expand -group PADS /tb/i_dut/pad_jtag_trst
add wave -noupdate -expand -group PADS /tb/i_dut/pad_jtag_tck
add wave -noupdate -expand -group PADS /tb/i_dut/pad_reset_n
add wave -noupdate -expand -group PADS /tb/i_dut/pad_test_clk
add wave -noupdate -expand -group PADS /tb/i_dut/pad_ref_clk
add wave -noupdate -expand -group PADS /tb/i_dut/pad_out_clk
add wave -noupdate -expand -group PADS /tb/i_dut/pad_mode_select
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 194
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {14268 ps}
