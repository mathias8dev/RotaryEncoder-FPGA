vcom -reportprogress 300 -work work C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/simulation/modelsim/DFlipFlop_tb.vhd
vsim -gui -l msim_transcript work.DFlipFlop_tb
add wave DFlipFlop_tb/ar
add wave DFlipFlop_tb/clk
add wave DFlipFlop_tb/d
add wave DFlipFlop_tb/q

run 8us