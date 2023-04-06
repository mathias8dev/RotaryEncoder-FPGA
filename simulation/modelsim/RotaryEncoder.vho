-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "04/06/2023 12:21:00"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SynRotaryEncoderCounter IS
    PORT (
	AR : IN std_logic;
	CLK : IN std_logic;
	RE_CLK : IN std_logic;
	DT : IN std_logic;
	SW : IN std_logic;
	Q : OUT std_logic_vector(1 DOWNTO 0)
	);
END SynRotaryEncoderCounter;

-- Design Ports Information
-- SW	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[0]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AR	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DT	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RE_CLK	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SynRotaryEncoderCounter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_AR : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RE_CLK : std_logic;
SIGNAL ww_DT : std_logic;
SIGNAL ww_SW : std_logic;
SIGNAL ww_Q : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \RO_CLK_cleaned|Q~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \RE_CLK~input_o\ : std_logic;
SIGNAL \AR~input_o\ : std_logic;
SIGNAL \RO_CLK_cleaned|Q~q\ : std_logic;
SIGNAL \RO_CLK_cleaned|Q~clkctrl_outclk\ : std_logic;
SIGNAL \DT~input_o\ : std_logic;
SIGNAL \DT_cleaned|Q~feeder_combout\ : std_logic;
SIGNAL \DT_cleaned|Q~q\ : std_logic;
SIGNAL \RotaryEncoderCounter_inst|counter[1]~1_combout\ : std_logic;
SIGNAL \RotaryEncoderCounter_inst|counter[1]~feeder_combout\ : std_logic;
SIGNAL \RotaryEncoderCounter_inst|counter[0]~0_combout\ : std_logic;
SIGNAL \RotaryEncoderCounter_inst|counter[0]~feeder_combout\ : std_logic;
SIGNAL \Q[0]~reg0feeder_combout\ : std_logic;
SIGNAL \Q[0]~reg0_q\ : std_logic;
SIGNAL \Q[1]~reg0feeder_combout\ : std_logic;
SIGNAL \Q[1]~reg0_q\ : std_logic;
SIGNAL \RotaryEncoderCounter_inst|counter\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \RO_CLK_cleaned|ALT_INV_Q~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_AR~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_AR <= AR;
ww_CLK <= CLK;
ww_RE_CLK <= RE_CLK;
ww_DT <= DT;
ww_SW <= SW;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\RO_CLK_cleaned|Q~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RO_CLK_cleaned|Q~q\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
\RO_CLK_cleaned|ALT_INV_Q~clkctrl_outclk\ <= NOT \RO_CLK_cleaned|Q~clkctrl_outclk\;
\ALT_INV_AR~input_o\ <= NOT \AR~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X46_Y54_N23
\Q[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[0]~reg0_q\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X46_Y54_N30
\Q[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q[1]~reg0_q\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G19
\CLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X31_Y0_N22
\RE_CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RE_CLK,
	o => \RE_CLK~input_o\);

-- Location: IOIBUF_X51_Y54_N29
\AR~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_AR,
	o => \AR~input_o\);

-- Location: FF_X45_Y50_N13
\RO_CLK_cleaned|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \RE_CLK~input_o\,
	clrn => \ALT_INV_AR~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RO_CLK_cleaned|Q~q\);

-- Location: CLKCTRL_G13
\RO_CLK_cleaned|Q~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RO_CLK_cleaned|Q~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RO_CLK_cleaned|Q~clkctrl_outclk\);

-- Location: IOIBUF_X24_Y0_N29
\DT~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DT,
	o => \DT~input_o\);

-- Location: LCCOMB_X45_Y50_N30
\DT_cleaned|Q~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DT_cleaned|Q~feeder_combout\ = \DT~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DT~input_o\,
	combout => \DT_cleaned|Q~feeder_combout\);

-- Location: FF_X45_Y50_N31
\DT_cleaned|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DT_cleaned|Q~feeder_combout\,
	clrn => \ALT_INV_AR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DT_cleaned|Q~q\);

-- Location: LCCOMB_X45_Y50_N16
\RotaryEncoderCounter_inst|counter[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RotaryEncoderCounter_inst|counter[1]~1_combout\ = (\RotaryEncoderCounter_inst|counter\(1) & ((\DT_cleaned|Q~q\) # (\RotaryEncoderCounter_inst|counter\(0)))) # (!\RotaryEncoderCounter_inst|counter\(1) & (\DT_cleaned|Q~q\ & 
-- \RotaryEncoderCounter_inst|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RotaryEncoderCounter_inst|counter\(1),
	datac => \DT_cleaned|Q~q\,
	datad => \RotaryEncoderCounter_inst|counter\(0),
	combout => \RotaryEncoderCounter_inst|counter[1]~1_combout\);

-- Location: LCCOMB_X45_Y50_N26
\RotaryEncoderCounter_inst|counter[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RotaryEncoderCounter_inst|counter[1]~feeder_combout\ = \RotaryEncoderCounter_inst|counter[1]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RotaryEncoderCounter_inst|counter[1]~1_combout\,
	combout => \RotaryEncoderCounter_inst|counter[1]~feeder_combout\);

-- Location: FF_X45_Y50_N27
\RotaryEncoderCounter_inst|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \RO_CLK_cleaned|ALT_INV_Q~clkctrl_outclk\,
	d => \RotaryEncoderCounter_inst|counter[1]~feeder_combout\,
	clrn => \ALT_INV_AR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RotaryEncoderCounter_inst|counter\(1));

-- Location: LCCOMB_X45_Y50_N28
\RotaryEncoderCounter_inst|counter[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RotaryEncoderCounter_inst|counter[0]~0_combout\ = (\DT_cleaned|Q~q\ & ((\RotaryEncoderCounter_inst|counter\(1)) # (!\RotaryEncoderCounter_inst|counter\(0)))) # (!\DT_cleaned|Q~q\ & (\RotaryEncoderCounter_inst|counter\(1) & 
-- !\RotaryEncoderCounter_inst|counter\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DT_cleaned|Q~q\,
	datac => \RotaryEncoderCounter_inst|counter\(1),
	datad => \RotaryEncoderCounter_inst|counter\(0),
	combout => \RotaryEncoderCounter_inst|counter[0]~0_combout\);

-- Location: LCCOMB_X45_Y50_N24
\RotaryEncoderCounter_inst|counter[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \RotaryEncoderCounter_inst|counter[0]~feeder_combout\ = \RotaryEncoderCounter_inst|counter[0]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RotaryEncoderCounter_inst|counter[0]~0_combout\,
	combout => \RotaryEncoderCounter_inst|counter[0]~feeder_combout\);

-- Location: FF_X45_Y50_N25
\RotaryEncoderCounter_inst|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \RO_CLK_cleaned|ALT_INV_Q~clkctrl_outclk\,
	d => \RotaryEncoderCounter_inst|counter[0]~feeder_combout\,
	clrn => \ALT_INV_AR~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RotaryEncoderCounter_inst|counter\(0));

-- Location: LCCOMB_X45_Y50_N10
\Q[0]~reg0feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q[0]~reg0feeder_combout\ = \RotaryEncoderCounter_inst|counter\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RotaryEncoderCounter_inst|counter\(0),
	combout => \Q[0]~reg0feeder_combout\);

-- Location: FF_X45_Y50_N11
\Q[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Q[0]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q[0]~reg0_q\);

-- Location: LCCOMB_X45_Y50_N18
\Q[1]~reg0feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Q[1]~reg0feeder_combout\ = \RotaryEncoderCounter_inst|counter\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RotaryEncoderCounter_inst|counter\(1),
	combout => \Q[1]~reg0feeder_combout\);

-- Location: FF_X45_Y50_N19
\Q[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \Q[1]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Q[1]~reg0_q\);

-- Location: IOIBUF_X31_Y0_N29
\SW~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW,
	o => \SW~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;
END structure;


