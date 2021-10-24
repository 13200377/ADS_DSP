transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}

vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {./test_filter_types.vhd}
vcom -2008 -work work {./test_filterDef.vhd}
vcom -2008 -work work {./../src/sumArr.vhd}
vcom -2008 -work work {./../src/PISO_arr.vhd}
vcom -2008 -work work {./../src/PFB3.vhd}
vcom -2008 -work work {./../src/deserializer.vhd}
vcom -2008 -work work {./../src/serial_PFB.vhd}
vcom -2008 -work work {./serial_PFB_tb.vhd}

vsim -voptargs=+acc work.serial_PFB_tb


radix -decimal


add wave -position end  sim:/serial_pfb_tb/clk	
add wave -position end  sim:/serial_pfb_tb/n_rst

add wave -position end  sim:/serial_pfb_tb/y_k
add wave -position end  sim:/serial_pfb_tb/x_n

add wave -position end  sim:/serial_pfb_tb/write_ready
add wave -position end  sim:/serial_pfb_tb/write_en
add wave -position end  sim:/serial_pfb_tb/read_ready
add wave -position end  sim:/serial_pfb_tb/read_en

run -all