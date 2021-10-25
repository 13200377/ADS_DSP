transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}

vlib rtl_work
vmap work rtl_work


vcom -2008 -work work {../src/filter_types.vhd}
vcom -2008 -work work {../src/filterDef.vhd}
vcom -2008 -work work {../src/sumArr.vhd}
vcom -2008 -work work {../src/PISO_arr.vhd}
vcom -2008 -work work {../src/PFB3.vhd}
vcom -2008 -work work {../src/fifo.vhd}
vcom -2008 -work work {../src/deserializer.vhd}
vcom -2008 -work work {../src/serial_PFB.vhd}

do compile_FFT.do

vcom -2008 -work work {../src/channelizer.vhd}
vcom -2008 -work work {../test/channelizer_tb.vhd}

vsim -voptargs=+acc work.channelizer_tb





add wave -position end  sim:/channelizer_tb/clk	
add wave -position end  sim:/channelizer_tb/n_rst

add wave -position end  sim:/channelizer_tb/x_re
add wave -position end  sim:/channelizer_tb/x_im							 
add wave -position end  sim:/channelizer_tb/y_re
add wave -position end  sim:/channelizer_tb/y_im

							 
add wave -position end  sim:/channelizer_tb/write_ready
add wave -position end  sim:/channelizer_tb/write_en
add wave -position end  sim:/channelizer_tb/read_ready
add wave -position end  sim:/channelizer_tb/read_en


add wave -position end  sim:/channelizer_tb/chan/y_k_re
add wave -position end  sim:/channelizer_tb/chan/y_k_im

add wave -position end  sim:/channelizer_tb/chan/write_ready
add wave -position end  sim:/channelizer_tb/chan/write_en
add wave -position end  sim:/channelizer_tb/chan/reset
add wave -position end  sim:/channelizer_tb/chan/read_ready
add wave -position end  sim:/channelizer_tb/chan/read_en
add wave -position end  sim:/channelizer_tb/chan/PFB_write_en
add wave -position end  sim:/channelizer_tb/chan/PFB_read_en
add wave -position end  sim:/channelizer_tb/chan/PFB_re_write_ready
add wave -position end  sim:/channelizer_tb/chan/PFB_re_read_ready
add wave -position end  sim:/channelizer_tb/chan/PFB_im_write_ready
add wave -position end  sim:/channelizer_tb/chan/PFB_im_read_ready
add wave -position end  sim:/channelizer_tb/chan/n_rst
add wave -position end  sim:/channelizer_tb/chan/FIFO_wr_enable
add wave -position end  sim:/channelizer_tb/chan/FIFO_wr_data
add wave -position end  sim:/channelizer_tb/chan/FIFO_re_vec
add wave -position end  sim:/channelizer_tb/chan/FIFO_rd_enable
add wave -position end  sim:/channelizer_tb/chan/FIFO_rd_data
add wave -position end  sim:/channelizer_tb/chan/FIFO_im_vec
add wave -position end  sim:/channelizer_tb/chan/FIFO_full
add wave -position end  sim:/channelizer_tb/chan/FIFO_empty
add wave -position end  sim:/channelizer_tb/chan/FIFO_almost_full
add wave -position end  sim:/channelizer_tb/chan/FIFO_almost_empty
add wave -position end  sim:/channelizer_tb/chan/fftValidOut
add wave -position end  sim:/channelizer_tb/chan/fftValidIn
add wave -position end  sim:/channelizer_tb/chan/fftOut_re
add wave -position end  sim:/channelizer_tb/chan/fftOut_im
add wave -position end  sim:/channelizer_tb/chan/fftIn_re
add wave -position end  sim:/channelizer_tb/chan/fftIn_im
add wave -position end  sim:/channelizer_tb/chan/clk_enable
add wave -position end  sim:/channelizer_tb/chan/clk
add wave -position end  sim:/channelizer_tb/chan/ce_out


add wave -position end  sim:/channelizer_tb/chan/pfb_re/y_k_phases
add wave -position end  sim:/channelizer_tb/chan/pfb_re/y_k
add wave -position end  sim:/channelizer_tb/chan/pfb_re/x_n_delay_line
add wave -position end  sim:/channelizer_tb/chan/pfb_re/x_n
add wave -position end  sim:/channelizer_tb/chan/pfb_re/write_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/write_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/ser_write_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/ser_write_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/ser_read_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/ser_read_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/read_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/read_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/PFB_write_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/PFB_write_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/PFB_read_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/PFB_read_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/n_rst
add wave -position end  sim:/channelizer_tb/chan/pfb_re/des_write_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/des_read_ready
add wave -position end  sim:/channelizer_tb/chan/pfb_re/des_read_en
add wave -position end  sim:/channelizer_tb/chan/pfb_re/des_full
add wave -position end  sim:/channelizer_tb/chan/pfb_re/des_empty
add wave -position end  sim:/channelizer_tb/chan/pfb_re/clk

radix -decimal

run -all