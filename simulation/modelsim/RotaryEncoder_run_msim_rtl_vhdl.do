transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/SynRotaryEncoderCounter.vhd}
vcom -93 -work work {C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/RotaryEncoderCounter.vhd}
vcom -93 -work work {C:/Users/pret/Documents/Code/Electronics/RotaryEncoder/DFlipFlop.vhd}

