vcom -work work ../shift_register.vhd
vcom -work work ../shift_register_tb.vhd
vsim -c -onfinish stop -l msim_transcript work.shift_register_tb -do "run -all" -do "exit"