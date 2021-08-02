onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /fifo_tb/mem/fifo_data
add wave -noupdate /fifo_tb/mem/clk
add wave -noupdate /fifo_tb/mem/fifo_data
add wave -noupdate /fifo_tb/mem/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29424 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {29050 ps} {30050 ps}
