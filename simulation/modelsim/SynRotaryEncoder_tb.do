vcom -reportprogress 300 -work work C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/simulation/modelsim/SynRotaryEncoder_tb.vhd
vsim -gui -l msim_transcript work.SynRotaryEncoder_tb
add wave SynRotaryEncoder_tb/ar
add wave SynRotaryEncoder_tb/clk
add wave SynRotaryEncoder_tb/re_clk
add wave SynRotaryEncoder_tb/SynRotaryEncoder_inst/noiseless_re_clk
add wave SynRotaryEncoder_tb/dt
add wave SynRotaryEncoder_tb/dir
add wave SynRotaryEncoder_tb/sw
add wave SynRotaryEncoder_tb/sw_pressed
add wave SynRotaryEncoder_tb/SynRotaryEncoder_inst/state
add wave SynRotaryEncoder_tb/SynRotaryEncoder_inst/next_state
add wave SynRotaryEncoder_tb/SynRotaryEncoder_inst/RotaryEncoderCounter_inst/CLK
add wave SynRotaryEncoder_tb/SynRotaryEncoder_inst/RotaryEncoderCounter_inst/DT
add wave SynRotaryEncoder_tb/SynRotaryEncoder_inst/RotaryEncoderCounter_inst/counter

run 8us
