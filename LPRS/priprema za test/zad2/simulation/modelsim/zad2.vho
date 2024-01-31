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

-- DATE "12/10/2022 17:29:57"

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

ENTITY 	zad2 IS
    PORT (
	iCLK : IN std_logic;
	iRST : IN std_logic;
	iEN : IN std_logic;
	iLOAD : IN std_logic;
	iDATA : IN std_logic_vector(7 DOWNTO 0);
	oCODE : OUT std_logic_vector(2 DOWNTO 0);
	oGREAT : OUT std_logic;
	oZERO : OUT std_logic
	);
END zad2;

-- Design Ports Information
-- oCODE[0]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oCODE[1]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oCODE[2]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oGREAT	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oZERO	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[2]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iLOAD	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRST	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[5]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[6]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[4]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iEN	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iDATA[7]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF zad2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iCLK : std_logic;
SIGNAL ww_iRST : std_logic;
SIGNAL ww_iEN : std_logic;
SIGNAL ww_iLOAD : std_logic;
SIGNAL ww_iDATA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_oCODE : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_oGREAT : std_logic;
SIGNAL ww_oZERO : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oCODE[0]~output_o\ : std_logic;
SIGNAL \oCODE[1]~output_o\ : std_logic;
SIGNAL \oCODE[2]~output_o\ : std_logic;
SIGNAL \oGREAT~output_o\ : std_logic;
SIGNAL \oZERO~output_o\ : std_logic;
SIGNAL \iCLK~input_o\ : std_logic;
SIGNAL \iCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \iDATA[0]~input_o\ : std_logic;
SIGNAL \iLOAD~input_o\ : std_logic;
SIGNAL \iDATA[1]~input_o\ : std_logic;
SIGNAL \iDATA[2]~input_o\ : std_logic;
SIGNAL \iDATA[3]~input_o\ : std_logic;
SIGNAL \iDATA[4]~input_o\ : std_logic;
SIGNAL \iDATA[5]~input_o\ : std_logic;
SIGNAL \iDATA[6]~input_o\ : std_logic;
SIGNAL \iDATA[7]~input_o\ : std_logic;
SIGNAL \iEN~input_o\ : std_logic;
SIGNAL \sCOUNT[0]~4_combout\ : std_logic;
SIGNAL \iRST~input_o\ : std_logic;
SIGNAL \iRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \sSHR~8_combout\ : std_logic;
SIGNAL \sSHR~5_combout\ : std_logic;
SIGNAL \sSHR[0]~1_combout\ : std_logic;
SIGNAL \sSHR~4_combout\ : std_logic;
SIGNAL \sSHR~6_combout\ : std_logic;
SIGNAL \sSHR~7_combout\ : std_logic;
SIGNAL \sSHR~0_combout\ : std_logic;
SIGNAL \sSHR~2_combout\ : std_logic;
SIGNAL \sSHR~3_combout\ : std_logic;
SIGNAL \oCODE~0_combout\ : std_logic;
SIGNAL \oCODE~1_combout\ : std_logic;
SIGNAL \oCODE~2_combout\ : std_logic;
SIGNAL \oCODE~3_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \sCOUNT[1]~3_combout\ : std_logic;
SIGNAL \sCOUNT[2]~2_combout\ : std_logic;
SIGNAL \sCOUNT[3]~0_combout\ : std_logic;
SIGNAL \sCOUNT[3]~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL sSHR : std_logic_vector(7 DOWNTO 0);
SIGNAL sCOUNT : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_iRST~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iCLK <= iCLK;
ww_iRST <= iRST;
ww_iEN <= iEN;
ww_iLOAD <= iLOAD;
ww_iDATA <= iDATA;
oCODE <= ww_oCODE;
oGREAT <= ww_oGREAT;
oZERO <= ww_oZERO;
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

-- Location: LCCOMB_X26_Y19_N12
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

-- Location: IOOBUF_X10_Y17_N9
\oCODE[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oCODE~1_combout\,
	devoe => ww_devoe,
	o => \oCODE[0]~output_o\);

-- Location: IOOBUF_X10_Y17_N2
\oCODE[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oCODE~3_combout\,
	devoe => ww_devoe,
	o => \oCODE[1]~output_o\);

-- Location: IOOBUF_X8_Y17_N2
\oCODE[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~0_combout\,
	devoe => ww_devoe,
	o => \oCODE[2]~output_o\);

-- Location: IOOBUF_X10_Y17_N16
\oGREAT~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~0_combout\,
	devoe => ww_devoe,
	o => \oGREAT~output_o\);

-- Location: IOOBUF_X8_Y17_N23
\oZERO~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~2_combout\,
	devoe => ww_devoe,
	o => \oZERO~output_o\);

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

-- Location: IOIBUF_X14_Y17_N29
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

-- Location: IOIBUF_X14_Y17_N22
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

-- Location: IOIBUF_X16_Y17_N15
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

-- Location: IOIBUF_X12_Y17_N1
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

-- Location: IOIBUF_X12_Y17_N22
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

-- Location: IOIBUF_X8_Y17_N15
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

-- Location: IOIBUF_X12_Y17_N29
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

-- Location: IOIBUF_X12_Y17_N15
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

-- Location: IOIBUF_X14_Y17_N1
\iEN~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iEN,
	o => \iEN~input_o\);

-- Location: LCCOMB_X12_Y13_N2
\sCOUNT[0]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT[0]~4_combout\ = sCOUNT(0) $ (\iEN~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => sCOUNT(0),
	datad => \iEN~input_o\,
	combout => \sCOUNT[0]~4_combout\);

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

-- Location: FF_X12_Y13_N3
\sCOUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT[0]~4_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(0));

-- Location: LCCOMB_X12_Y13_N8
\sSHR~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~8_combout\ = (\iLOAD~input_o\ & (\iDATA[7]~input_o\)) # (!\iLOAD~input_o\ & (((sSHR(7) & sCOUNT(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iDATA[7]~input_o\,
	datab => \iLOAD~input_o\,
	datac => sSHR(7),
	datad => sCOUNT(0),
	combout => \sSHR~8_combout\);

-- Location: FF_X12_Y13_N9
\sSHR[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~8_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(7));

-- Location: LCCOMB_X12_Y13_N12
\sSHR~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~5_combout\ = (\iLOAD~input_o\ & (\iDATA[6]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iDATA[6]~input_o\,
	datac => sSHR(7),
	datad => \iLOAD~input_o\,
	combout => \sSHR~5_combout\);

-- Location: LCCOMB_X12_Y13_N30
\sSHR[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR[0]~1_combout\ = (\iLOAD~input_o\) # (!sCOUNT(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iLOAD~input_o\,
	datad => sCOUNT(0),
	combout => \sSHR[0]~1_combout\);

-- Location: FF_X12_Y13_N13
\sSHR[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~5_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(6));

-- Location: LCCOMB_X12_Y13_N6
\sSHR~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~4_combout\ = (\iLOAD~input_o\ & (\iDATA[5]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iLOAD~input_o\,
	datac => \iDATA[5]~input_o\,
	datad => sSHR(6),
	combout => \sSHR~4_combout\);

-- Location: FF_X12_Y13_N7
\sSHR[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~4_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(5));

-- Location: LCCOMB_X12_Y13_N14
\sSHR~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~6_combout\ = (\iLOAD~input_o\ & (\iDATA[4]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iLOAD~input_o\,
	datac => \iDATA[4]~input_o\,
	datad => sSHR(5),
	combout => \sSHR~6_combout\);

-- Location: FF_X12_Y13_N15
\sSHR[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~6_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(4));

-- Location: LCCOMB_X12_Y13_N24
\sSHR~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~7_combout\ = (\iLOAD~input_o\ & (\iDATA[3]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iDATA[3]~input_o\,
	datac => sSHR(4),
	datad => \iLOAD~input_o\,
	combout => \sSHR~7_combout\);

-- Location: FF_X12_Y13_N25
\sSHR[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~7_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(3));

-- Location: LCCOMB_X12_Y13_N16
\sSHR~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~0_combout\ = (\iLOAD~input_o\ & (\iDATA[2]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iLOAD~input_o\,
	datac => \iDATA[2]~input_o\,
	datad => sSHR(3),
	combout => \sSHR~0_combout\);

-- Location: FF_X12_Y13_N17
\sSHR[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(2));

-- Location: LCCOMB_X12_Y13_N26
\sSHR~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~2_combout\ = (\iLOAD~input_o\ & (\iDATA[1]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iLOAD~input_o\,
	datac => \iDATA[1]~input_o\,
	datad => sSHR(2),
	combout => \sSHR~2_combout\);

-- Location: FF_X12_Y13_N27
\sSHR[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~2_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(1));

-- Location: LCCOMB_X12_Y13_N4
\sSHR~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSHR~3_combout\ = (\iLOAD~input_o\ & (\iDATA[0]~input_o\)) # (!\iLOAD~input_o\ & ((sSHR(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iDATA[0]~input_o\,
	datac => sSHR(1),
	datad => \iLOAD~input_o\,
	combout => \sSHR~3_combout\);

-- Location: FF_X12_Y13_N5
\sSHR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sSHR~3_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \sSHR[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sSHR(0));

-- Location: LCCOMB_X12_Y13_N10
\oCODE~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oCODE~0_combout\ = (!sSHR(3) & ((sSHR(4)) # ((sSHR(6) & !sSHR(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sSHR(6),
	datab => sSHR(3),
	datac => sSHR(4),
	datad => sSHR(5),
	combout => \oCODE~0_combout\);

-- Location: LCCOMB_X11_Y13_N12
\oCODE~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oCODE~1_combout\ = (!sSHR(0) & ((sSHR(1)) # ((!sSHR(2) & !\oCODE~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sSHR(0),
	datab => sSHR(2),
	datac => \oCODE~0_combout\,
	datad => sSHR(1),
	combout => \oCODE~1_combout\);

-- Location: LCCOMB_X12_Y13_N20
\oCODE~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oCODE~2_combout\ = (sSHR(3)) # ((sSHR(2)) # ((!sSHR(5) & !sSHR(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sSHR(5),
	datab => sSHR(3),
	datac => sSHR(4),
	datad => sSHR(2),
	combout => \oCODE~2_combout\);

-- Location: LCCOMB_X12_Y13_N18
\oCODE~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oCODE~3_combout\ = (!sSHR(1) & (\oCODE~2_combout\ & !sSHR(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sSHR(1),
	datab => \oCODE~2_combout\,
	datac => sSHR(0),
	combout => \oCODE~3_combout\);

-- Location: LCCOMB_X12_Y13_N28
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!sSHR(1) & (!sSHR(2) & (!sSHR(0) & !sSHR(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sSHR(1),
	datab => sSHR(2),
	datac => sSHR(0),
	datad => sSHR(3),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X11_Y13_N26
\sCOUNT[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT[1]~3_combout\ = sCOUNT(1) $ (((\iEN~input_o\ & sCOUNT(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iEN~input_o\,
	datac => sCOUNT(1),
	datad => sCOUNT(0),
	combout => \sCOUNT[1]~3_combout\);

-- Location: FF_X11_Y13_N27
\sCOUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT[1]~3_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(1));

-- Location: LCCOMB_X11_Y13_N8
\sCOUNT[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT[2]~2_combout\ = sCOUNT(2) $ (((sCOUNT(1) & (\iEN~input_o\ & sCOUNT(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datab => \iEN~input_o\,
	datac => sCOUNT(2),
	datad => sCOUNT(0),
	combout => \sCOUNT[2]~2_combout\);

-- Location: FF_X11_Y13_N9
\sCOUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT[2]~2_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(2));

-- Location: LCCOMB_X11_Y13_N10
\sCOUNT[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT[3]~0_combout\ = (\iEN~input_o\ & (sCOUNT(2) & (sCOUNT(1) & sCOUNT(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iEN~input_o\,
	datab => sCOUNT(2),
	datac => sCOUNT(1),
	datad => sCOUNT(0),
	combout => \sCOUNT[3]~0_combout\);

-- Location: LCCOMB_X11_Y13_N18
\sCOUNT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT[3]~1_combout\ = sCOUNT(3) $ (\sCOUNT[3]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => sCOUNT(3),
	datad => \sCOUNT[3]~0_combout\,
	combout => \sCOUNT[3]~1_combout\);

-- Location: FF_X11_Y13_N19
\sCOUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT[3]~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(3));

-- Location: LCCOMB_X11_Y13_N24
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (sCOUNT(3)) # ((sCOUNT(2) & ((sCOUNT(1)) # (sCOUNT(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datab => sCOUNT(3),
	datac => sCOUNT(2),
	datad => sCOUNT(0),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X12_Y13_N22
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!sSHR(6) & (!sSHR(7) & (!sSHR(4) & !sSHR(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sSHR(6),
	datab => sSHR(7),
	datac => sSHR(4),
	datad => sSHR(5),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X12_Y13_N0
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Equal0~1_combout\ & \Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~2_combout\);

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

ww_oCODE(0) <= \oCODE[0]~output_o\;

ww_oCODE(1) <= \oCODE[1]~output_o\;

ww_oCODE(2) <= \oCODE[2]~output_o\;

ww_oGREAT <= \oGREAT~output_o\;

ww_oZERO <= \oZERO~output_o\;
END structure;


