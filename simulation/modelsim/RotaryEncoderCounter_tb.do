vcom -reportprogress 300 -work work C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/simulation/modelsim/RotaryEncoderCounter_tb.vhd
vsim -gui -l msim_transcript work.RotaryEncoderCounter_tb
add wave RotaryEncoderCounter_tb/clk
add wave RotaryEncoderCounter_tb/dt
add wave RotaryEncoderCounter_tb/sw
add wave RotaryEncoderCounter_tb/q
add wave RotaryEncoderCounter_tb/sw_pressed

run 8us
