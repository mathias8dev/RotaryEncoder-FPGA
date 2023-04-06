vcom -reportprogress 300 -work work C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/simulation/modelsim/FrequencyDivider_tb.vhd
vsim -gui -l msim_transcript work.FrequencyDivider_tb
add wave FrequencyDivider_tb/areset
add wave FrequencyDivider_tb/clk_in
add wave FrequencyDivider_tb/clk_out
add wave FrequencyDivider_tb/FrequencyDivider_inst/state
add wave FrequencyDivider_tb/FrequencyDivider_inst/next_state
add wave FrequencyDivider_tb/FrequencyDivider_inst/counter
add wave FrequencyDivider_tb/FrequencyDivider_inst/counter_next


run 8us