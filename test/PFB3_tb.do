transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}

vlib rtl_work
vmap work rtl_work


vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filter_types.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filterDef.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/sumArr.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/PFB3.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/test/PFB3_tb.vhd}

vsim -voptargs=+acc work.PFB3_tb


add wave -position end  sim:/pfb3_tb/clk
add wave -position end  sim:/pfb3_tb/n_rst

add wave -position end  sim:/pfb3_tb/x_n
add wave -position end  sim:/pfb3_tb/write_ready
add wave -position end  sim:/pfb3_tb/write_en

add wave -position end  sim:/pfb3_tb/y_k
add wave -position end  sim:/pfb3_tb/read_ready
add wave -position end  sim:/pfb3_tb/read_en

run -all