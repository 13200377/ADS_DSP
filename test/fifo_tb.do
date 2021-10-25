transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}

vlib rtl_work
vmap work rtl_work


vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filter_types.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filterDef.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/fifo.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/test/fifo_tb.vhd}

vsim -voptargs=+acc work.fifo_tb

add wave -position end  sim:/fifo_tb/clk
add wave -position end  sim:/fifo_tb/wr_enable
add wave -position end  sim:/fifo_tb/wr_data
								 
add wave -position end  sim:/fifo_tb/rd_enable
add wave -position end  sim:/fifo_tb/rd_data
add wave -position end  sim:/fifo_tb/full
add wave -position end  sim:/fifo_tb/fifo_depth
add wave -position end  sim:/fifo_tb/empty
add wave -position end  sim:/fifo_tb/data_width
add wave -position end  sim:/fifo_tb/almost_full
add wave -position end  sim:/fifo_tb/almost_empty
								 
								 
add wave -position end  sim:/fifo_tb/fifo_module/tail
add wave -position end  sim:/fifo_tb/fifo_module/head
add wave -position end  sim:/fifo_tb/fifo_module/fifo_buffer
add wave -position end  sim:/fifo_tb/fifo_module/rd_clk_vals
add wave -position end  sim:/fifo_tb/fifo_module/mem_count
add wave -position end  sim:/fifo_tb/fifo_module/mem_available
run -all