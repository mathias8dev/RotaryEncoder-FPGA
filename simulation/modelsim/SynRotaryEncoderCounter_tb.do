vcom -reportprogress 300 -work work C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/simulation/modelsim/SynRotaryEncoderCounter_tb.vhd
vsim -gui -l msim_transcript work.SynRotaryEncoderCounter_tb
add wave SynRotaryEncoderCounter_tb/ar
add wave SynRotaryEncoderCounter_tb/clk
add wave SynRotaryEncoderCounter_tb/re_clk
add wave SynRotaryEncoderCounter_tb/dt
add wave SynRotaryEncoderCounter_tb/counter

run 8us
