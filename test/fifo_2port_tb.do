transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}

vlib rtl_work
vmap work rtl_work


vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filter_types.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/filterDef.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/src/fifo_2port.vhd}
vcom -2008 -work work {F:/intelFPGA_lite/ADS_project/test/fifo_2port_tb.vhd}

vsim -voptargs=+acc work.fifo_2port_tb

add wave -position end  sim:/fifo_2port_tb/wr_enable
add wave -position end  sim:/fifo_2port_tb/wr_data
add wave -position end  sim:/fifo_2port_tb/wr_clk
add wave -position end  sim:/fifo_2port_tb/rd_enable
add wave -position end  sim:/fifo_2port_tb/rd_data
add wave -position end  sim:/fifo_2port_tb/rd_clk
add wave -position end  sim:/fifo_2port_tb/full
add wave -position end  sim:/fifo_2port_tb/fifo_depth
add wave -position end  sim:/fifo_2port_tb/empty
add wave -position end  sim:/fifo_2port_tb/data_width
add wave -position end  sim:/fifo_2port_tb/almost_full
add wave -position end  sim:/fifo_2port_tb/almost_empty


add wave -position end  sim:/fifo_2port_tb/fifo/tail
add wave -position end  sim:/fifo_2port_tb/fifo/head
add wave -position end  sim:/fifo_2port_tb/fifo/rd_clk_vals
add wave -position end  sim:/fifo_2port_tb/fifo/mem_count
add wave -position end  sim:/fifo_2port_tb/fifo/mem_available
run -all