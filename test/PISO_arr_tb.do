transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filter_types.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/PISO_arr.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/test/PISO_arr_tb.vhd}

vsim -voptargs=+acc work.PISO_arr_tb

add wave sim:/PISO_arr_tb/clk
add wave sim:/PISO_arr_tb/n_rst
add wave sim:/PISO_arr_tb/parallel_in
add wave sim:/PISO_arr_tb/write_en
add wave sim:/PISO_arr_tb/write_ready
add wave sim:/PISO_arr_tb/serial_out
add wave sim:/PISO_arr_tb/read_en
add wave sim:/PISO_arr_tb/read_ready
add wave sim:/PISO_arr_tb/write_ready2
add wave sim:/PISO_arr_tb/read_ready2
add wave sim:/PISO_arr_tb/serial_out2

run -all
