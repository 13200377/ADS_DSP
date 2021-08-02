vcom -work work ../fifo.vhd
vcom -work work ../fifo_tb.vhd
vsim -c -onfinish stop -l msim_transcript work.fifo_tb -do "run -all" -do "exit"