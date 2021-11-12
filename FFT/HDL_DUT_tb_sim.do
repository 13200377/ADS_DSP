onbreak resume
onerror resume
vsim -voptargs=+acc work.HDL_DUT_tb

add wave sim:/HDL_DUT_tb/u_HDL_DUT/clk
add wave sim:/HDL_DUT_tb/u_HDL_DUT/reset
add wave sim:/HDL_DUT_tb/u_HDL_DUT/clk_enable
add wave sim:/HDL_DUT_tb/u_HDL_DUT/fftIn_re
add wave sim:/HDL_DUT_tb/u_HDL_DUT/fftIn_im
add wave sim:/HDL_DUT_tb/u_HDL_DUT/fftValidIn
add wave sim:/HDL_DUT_tb/u_HDL_DUT/ce_out
add wave sim:/HDL_DUT_tb/u_HDL_DUT/fftOut_re
add wave sim:/HDL_DUT_tb/fftOut_re_ref
add wave sim:/HDL_DUT_tb/u_HDL_DUT/fftOut_im
add wave sim:/HDL_DUT_tb/fftOut_im_ref
add wave sim:/HDL_DUT_tb/u_HDL_DUT/fftValidOut
add wave sim:/HDL_DUT_tb/fftValidOut_ref
run -all
