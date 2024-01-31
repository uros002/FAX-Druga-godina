-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

-- DATE "11/19/2022 11:09:43"

-- 
-- Device: Altera 10M16SAU169C8G Package UFBGA169
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
-- ~ALTERA_TMS~	=>  Location: PIN_G1,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_F5,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_E7,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_C4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_C5,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


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

ENTITY 	PomReg IS
    PORT (
	iRST : IN std_logic;
	iCLK : IN std_logic;
	iLOAD : IN std_logic;
	iARITH : IN std_logic;
	iSHR : IN std_logic;
	iSHL : IN std_logic;
	iDATA : IN std_logic_vector(7 DOWNTO 0);
	oSHREG : OUT std_logic_vector(7 DOWNTO 0)
	);
END PomReg;

-- Design Ports Information
-- iARITH	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSHR	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSHL	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[0]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[2]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[4]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[5]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[6]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oSHREG[7]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRST	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iLOAD	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[1]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[2]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[3]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[4]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[5]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[6]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[7]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PomReg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iRST : std_logic;
SIGNAL ww_iCLK : std_logic;
SIGNAL ww_iLOAD : std_logic;
SIGNAL ww_iARITH : std_logic;
SIGNAL ww_iSHR : std_logic;
SIGNAL ww_iSHL : std_logic;
SIGNAL ww_iDATA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_oSHREG : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iARITH~input_o\ : std_logic;
SIGNAL \iSHR~input_o\ : std_logic;
SIGNAL \iSHL~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oSHREG[0]~output_o\ : std_logic;
SIGNAL \oSHREG[1]~output_o\ : std_logic;
SIGNAL \oSHREG[2]~output_o\ : std_logic;
SIGNAL \oSHREG[3]~output_o\ : std_logic;
SIGNAL \oSHREG[4]~output_o\ : std_logic;
SIGNAL \oSHREG[5]~output_o\ : std_logic;
SIGNAL \oSHREG[6]~output_o\ : std_logic;
SIGNAL \oSHREG[7]~output_o\ : std_logic;
SIGNAL \iCLK~input_o\ : std_logic;
SIGNAL \iCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \iDATA[0]~input_o\ : std_logic;
SIGNAL \sSHREG[0]~feeder_combout\ : std_logic;
SIGNAL \iRST~input_o\ : std_logic;
SIGNAL \iRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \iLOAD~input_o\ : std_logic;
SIGNAL \iDATA[1]~input_o\ : std_logic;
SIGNAL \iDATA[2]~input_o\ : std_logic;
SIGNAL \sSHREG[2]~feeder_combout\ : std_logic;
SIGNAL \iDATA[3]~input_o\ : std_logic;
SIGNAL \iDATA[4]~input_o\ : std_logic;
SIGNAL \iDATA[5]~input_o\ : std_logic;
SIGNAL \sSHREG[5]~feeder_combout\ : std_logic;
SIGNAL \iDATA[6]~input_o\ : std_logic;
SIGNAL \sSHREG[6]~feeder_combout\ : std_logic;
SIGNAL \iDATA[7]~input_o\ : std_logic;
SIGNAL sSHREG : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_iRST~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iRST <= iRST;
ww_iCLK <= iCLK;
ww_iLOAD <= iLOAD;
ww_iARITH <= iARITH;
ww_iSHR <= iSHR;
ww_iSHL <= iSHL;
ww_iDATA <= iDATA;
oSHREG <= ww_oSHREG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\iRST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iRST~input_o\);

\iCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iCLK~input_o\);
\ALT_INV_iRST~inputclkctrl_outclk\ <= NOT \iRST~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y19_N16
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

-- Location: IOOBUF_X8_Y17_N23
\oSHREG[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(0),
	devoe => ww_devoe,
	o => \oSHREG[0]~output_o\);

-- Location: IOOBUF_X8_Y17_N2
\oSHREG[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(1),
	devoe => ww_devoe,
	o => \oSHREG[1]~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\oSHREG[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(2),
	devoe => ww_devoe,
	o => \oSHREG[2]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\oSHREG[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(3),
	devoe => ww_devoe,
	o => \oSHREG[3]~output_o\);

-- Location: IOOBUF_X8_Y17_N16
\oSHREG[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(4),
	devoe => ww_devoe,
	o => \oSHREG[4]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\oSHREG[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(5),
	devoe => ww_devoe,
	o => \oSHREG[5]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\oSHREG[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(6),
	devoe => ww_devoe,
	o => \oSHREG[6]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\oSHREG[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sSHREG(7),
	devoe => ww_devoe,
	o => \oSHREG[7]~output_o\);

-- Location: IOIBUF_X0_Y8_N15
\iCLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iCLK,
	o => \iCLK~input_o\);

-- Location: CLKCTRL_G3
\iCLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iCLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iCLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X12_Y17_N8
\iDATA[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(0),
	o => \iDATA[0]~input_o\);

-- Location: LCCOMB_X6_Y13_N8
\sSHREG[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHREG[0]~feeder_combout\ = \iDATA[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \iDATA[0]~input_o\,
	combout => \sSHREG[0]~feeder_combout\);

-- Location: IOIBUF_X0_Y8_N22
\iRST~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iRST,
	o => \iRST~input_o\);

-- Location: CLKCTRL_G4
\iRST~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iRST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iRST~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y9_N8
\iLOAD~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iLOAD,
	o => \iLOAD~input_o\);

-- Location: FF_X6_Y13_N9
\sSHREG[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHREG[0]~feeder_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(0));

-- Location: IOIBUF_X12_Y17_N1
\iDATA[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(1),
	o => \iDATA[1]~input_o\);

-- Location: FF_X6_Y13_N27
\sSHREG[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \iDATA[1]~input_o\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(1));

-- Location: IOIBUF_X0_Y9_N22
\iDATA[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(2),
	o => \iDATA[2]~input_o\);

-- Location: LCCOMB_X6_Y13_N4
\sSHREG[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHREG[2]~feeder_combout\ = \iDATA[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \iDATA[2]~input_o\,
	combout => \sSHREG[2]~feeder_combout\);

-- Location: FF_X6_Y13_N5
\sSHREG[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHREG[2]~feeder_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(2));

-- Location: IOIBUF_X10_Y17_N8
\iDATA[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(3),
	o => \iDATA[3]~input_o\);

-- Location: FF_X6_Y13_N31
\sSHREG[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \iDATA[3]~input_o\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(3));

-- Location: IOIBUF_X10_Y17_N1
\iDATA[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(4),
	o => \iDATA[4]~input_o\);

-- Location: FF_X6_Y13_N1
\sSHREG[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \iDATA[4]~input_o\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(4));

-- Location: IOIBUF_X0_Y11_N22
\iDATA[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(5),
	o => \iDATA[5]~input_o\);

-- Location: LCCOMB_X6_Y13_N10
\sSHREG[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHREG[5]~feeder_combout\ = \iDATA[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \iDATA[5]~input_o\,
	combout => \sSHREG[5]~feeder_combout\);

-- Location: FF_X6_Y13_N11
\sSHREG[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHREG[5]~feeder_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(5));

-- Location: IOIBUF_X10_Y17_N15
\iDATA[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(6),
	o => \iDATA[6]~input_o\);

-- Location: LCCOMB_X6_Y13_N20
\sSHREG[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHREG[6]~feeder_combout\ = \iDATA[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \iDATA[6]~input_o\,
	combout => \sSHREG[6]~feeder_combout\);

-- Location: FF_X6_Y13_N21
\sSHREG[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHREG[6]~feeder_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(6));

-- Location: IOIBUF_X0_Y9_N1
\iDATA[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iDATA(7),
	o => \iDATA[7]~input_o\);

-- Location: FF_X6_Y13_N7
\sSHREG[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \iDATA[7]~input_o\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iLOAD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHREG(7));

-- Location: IOIBUF_X50_Y22_N15
\iARITH~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iARITH,
	o => \iARITH~input_o\);

-- Location: IOIBUF_X50_Y16_N15
\iSHR~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSHR,
	o => \iSHR~input_o\);

-- Location: IOIBUF_X14_Y17_N22
\iSHL~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSHL,
	o => \iSHL~input_o\);

-- Location: UNVM_X0_Y18_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
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

-- Location: ADCBLOCK_X25_Y28_N0
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

ww_oSHREG(0) <= \oSHREG[0]~output_o\;

ww_oSHREG(1) <= \oSHREG[1]~output_o\;

ww_oSHREG(2) <= \oSHREG[2]~output_o\;

ww_oSHREG(3) <= \oSHREG[3]~output_o\;

ww_oSHREG(4) <= \oSHREG[4]~output_o\;

ww_oSHREG(5) <= \oSHREG[5]~output_o\;

ww_oSHREG(6) <= \oSHREG[6]~output_o\;

ww_oSHREG(7) <= \oSHREG[7]~output_o\;
END structure;


