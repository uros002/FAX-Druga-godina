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

-- DATE "12/10/2022 15:15:39"

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


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	zad1 IS
    PORT (
	iA : IN std_logic_vector(3 DOWNTO 0);
	iB : IN std_logic_vector(1 DOWNTO 0);
	iC : IN std_logic_vector(3 DOWNTO 0);
	iSEL : IN std_logic_vector(2 DOWNTO 0);
	oRESULT : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END zad1;

-- Design Ports Information
-- oRESULT[0]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[1]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[2]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[3]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[0]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[2]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[0]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[3]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[2]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[0]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[1]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF zad1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iA : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iB : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_iC : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iSEL : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_oRESULT : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oRESULT[0]~output_o\ : std_logic;
SIGNAL \oRESULT[1]~output_o\ : std_logic;
SIGNAL \oRESULT[2]~output_o\ : std_logic;
SIGNAL \oRESULT[3]~output_o\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \iSEL[2]~input_o\ : std_logic;
SIGNAL \iC[2]~input_o\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \sMUX1[0]~1_combout\ : std_logic;
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \iC[3]~input_o\ : std_logic;
SIGNAL \sMUX1[0]~0_combout\ : std_logic;
SIGNAL \sMUX1[0]~2_combout\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \sMUX1[1]~3_combout\ : std_logic;
SIGNAL \iC[0]~input_o\ : std_logic;
SIGNAL \sMUX1[1]~4_combout\ : std_logic;
SIGNAL \sMUX1[1]~5_combout\ : std_logic;
SIGNAL \sMUX1[1]~6_combout\ : std_logic;
SIGNAL \iC[1]~input_o\ : std_logic;
SIGNAL \sMUX2~0_combout\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \sMUX2~1_combout\ : std_logic;
SIGNAL \sMUX2~2_combout\ : std_logic;
SIGNAL \sMUX2~3_combout\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \sMUX2~4_combout\ : std_logic;
SIGNAL \sMUX2~5_combout\ : std_logic;
SIGNAL \sMUX2~6_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iA <= iA;
ww_iB <= iB;
ww_iC <= iC;
ww_iSEL <= iSEL;
oRESULT <= ww_oRESULT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y27_N24
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

-- Location: IOOBUF_X0_Y9_N9
\oRESULT[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX1[0]~2_combout\,
	devoe => ww_devoe,
	o => \oRESULT[0]~output_o\);

-- Location: IOOBUF_X0_Y11_N23
\oRESULT[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX1[1]~6_combout\,
	devoe => ww_devoe,
	o => \oRESULT[1]~output_o\);

-- Location: IOOBUF_X0_Y8_N9
\oRESULT[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX2~3_combout\,
	devoe => ww_devoe,
	o => \oRESULT[2]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\oRESULT[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX2~6_combout\,
	devoe => ww_devoe,
	o => \oRESULT[3]~output_o\);

-- Location: IOIBUF_X0_Y9_N22
\iSEL[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(1),
	o => \iSEL[1]~input_o\);

-- Location: IOIBUF_X0_Y7_N22
\iB[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(1),
	o => \iB[1]~input_o\);

-- Location: IOIBUF_X0_Y7_N8
\iSEL[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(2),
	o => \iSEL[2]~input_o\);

-- Location: IOIBUF_X0_Y8_N1
\iC[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(2),
	o => \iC[2]~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\iB[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(0),
	o => \iB[0]~input_o\);

-- Location: LCCOMB_X1_Y7_N2
\sMUX1[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[0]~1_combout\ = (\iSEL[2]~input_o\ & (((!\iC[2]~input_o\)))) # (!\iSEL[2]~input_o\ & ((\iB[1]~input_o\) # ((\iB[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[1]~input_o\,
	datab => \iSEL[2]~input_o\,
	datac => \iC[2]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \sMUX1[0]~1_combout\);

-- Location: IOIBUF_X0_Y8_N22
\iSEL[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(0),
	o => \iSEL[0]~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\iA[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(0),
	o => \iA[0]~input_o\);

-- Location: IOIBUF_X3_Y0_N8
\iC[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(3),
	o => \iC[3]~input_o\);

-- Location: LCCOMB_X1_Y7_N24
\sMUX1[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[0]~0_combout\ = (\iSEL[2]~input_o\ & ((\iC[3]~input_o\))) # (!\iSEL[2]~input_o\ & (\iA[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[0]~input_o\,
	datac => \iC[3]~input_o\,
	datad => \iSEL[2]~input_o\,
	combout => \sMUX1[0]~0_combout\);

-- Location: LCCOMB_X1_Y7_N20
\sMUX1[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[0]~2_combout\ = (\iSEL[0]~input_o\) # ((\iSEL[1]~input_o\ & (!\sMUX1[0]~1_combout\)) # (!\iSEL[1]~input_o\ & ((\sMUX1[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sMUX1[0]~1_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \sMUX1[0]~0_combout\,
	combout => \sMUX1[0]~2_combout\);

-- Location: IOIBUF_X0_Y3_N15
\iA[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(1),
	o => \iA[1]~input_o\);

-- Location: LCCOMB_X1_Y7_N30
\sMUX1[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[1]~3_combout\ = (\iSEL[1]~input_o\ & (((\iC[3]~input_o\)))) # (!\iSEL[1]~input_o\ & (\iA[1]~input_o\ $ (((\iA[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \iA[1]~input_o\,
	datac => \iC[3]~input_o\,
	datad => \iA[0]~input_o\,
	combout => \sMUX1[1]~3_combout\);

-- Location: IOIBUF_X0_Y8_N15
\iC[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(0),
	o => \iC[0]~input_o\);

-- Location: LCCOMB_X1_Y7_N8
\sMUX1[1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[1]~4_combout\ = (\iSEL[1]~input_o\ & (((!\iB[1]~input_o\ & \iB[0]~input_o\)))) # (!\iSEL[1]~input_o\ & (\iC[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iC[0]~input_o\,
	datab => \iB[1]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \sMUX1[1]~4_combout\);

-- Location: LCCOMB_X1_Y7_N26
\sMUX1[1]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[1]~5_combout\ = \iSEL[2]~input_o\ $ (\iSEL[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datac => \iSEL[1]~input_o\,
	combout => \sMUX1[1]~5_combout\);

-- Location: LCCOMB_X1_Y7_N4
\sMUX1[1]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX1[1]~6_combout\ = (!\iSEL[0]~input_o\ & ((\sMUX1[1]~5_combout\ & ((\sMUX1[1]~4_combout\))) # (!\sMUX1[1]~5_combout\ & (\sMUX1[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX1[1]~3_combout\,
	datab => \sMUX1[1]~4_combout\,
	datac => \sMUX1[1]~5_combout\,
	datad => \iSEL[0]~input_o\,
	combout => \sMUX1[1]~6_combout\);

-- Location: IOIBUF_X0_Y7_N15
\iC[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(1),
	o => \iC[1]~input_o\);

-- Location: LCCOMB_X1_Y7_N10
\sMUX2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~0_combout\ = (!\iSEL[2]~input_o\ & ((\iB[1]~input_o\) # (!\iSEL[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[1]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \iSEL[2]~input_o\,
	combout => \sMUX2~0_combout\);

-- Location: IOIBUF_X0_Y3_N1
\iA[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(2),
	o => \iA[2]~input_o\);

-- Location: LCCOMB_X1_Y7_N16
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \iA[2]~input_o\ $ (((\iA[1]~input_o\) # (\iA[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[1]~input_o\,
	datac => \iA[2]~input_o\,
	datad => \iA[0]~input_o\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X1_Y7_N6
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\iB[1]~input_o\ & !\iB[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iB[1]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y7_N28
\sMUX2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~1_combout\ = (\sMUX2~0_combout\ & ((\iSEL[1]~input_o\ & ((\Equal0~0_combout\))) # (!\iSEL[1]~input_o\ & (\Add0~0_combout\)))) # (!\sMUX2~0_combout\ & (((!\iSEL[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX2~0_combout\,
	datab => \Add0~0_combout\,
	datac => \iSEL[1]~input_o\,
	datad => \Equal0~0_combout\,
	combout => \sMUX2~1_combout\);

-- Location: LCCOMB_X1_Y7_N14
\sMUX2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~2_combout\ = (\iSEL[2]~input_o\ & ((\sMUX2~1_combout\ & (\iC[1]~input_o\)) # (!\sMUX2~1_combout\ & ((\iC[3]~input_o\))))) # (!\iSEL[2]~input_o\ & (((\sMUX2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \iC[1]~input_o\,
	datac => \iC[3]~input_o\,
	datad => \sMUX2~1_combout\,
	combout => \sMUX2~2_combout\);

-- Location: LCCOMB_X1_Y7_N0
\sMUX2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~3_combout\ = (\sMUX2~2_combout\) # (\iSEL[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sMUX2~2_combout\,
	datac => \iSEL[0]~input_o\,
	combout => \sMUX2~3_combout\);

-- Location: IOIBUF_X0_Y9_N1
\iA[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(3),
	o => \iA[3]~input_o\);

-- Location: LCCOMB_X1_Y7_N18
\sMUX2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~4_combout\ = (\sMUX2~0_combout\ & ((\iSEL[1]~input_o\ & ((!\Equal0~0_combout\))) # (!\iSEL[1]~input_o\ & (\iA[3]~input_o\)))) # (!\sMUX2~0_combout\ & (((!\iSEL[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110110101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX2~0_combout\,
	datab => \iA[3]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \Equal0~0_combout\,
	combout => \sMUX2~4_combout\);

-- Location: LCCOMB_X1_Y7_N12
\sMUX2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~5_combout\ = (\iSEL[2]~input_o\ & ((\sMUX2~4_combout\ & ((\iC[2]~input_o\))) # (!\sMUX2~4_combout\ & (\iC[3]~input_o\)))) # (!\iSEL[2]~input_o\ & (((\sMUX2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \iC[3]~input_o\,
	datac => \iC[2]~input_o\,
	datad => \sMUX2~4_combout\,
	combout => \sMUX2~5_combout\);

-- Location: LCCOMB_X1_Y7_N22
\sMUX2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX2~6_combout\ = (!\iSEL[0]~input_o\ & \sMUX2~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iSEL[0]~input_o\,
	datad => \sMUX2~5_combout\,
	combout => \sMUX2~6_combout\);

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

ww_oRESULT(0) <= \oRESULT[0]~output_o\;

ww_oRESULT(1) <= \oRESULT[1]~output_o\;

ww_oRESULT(2) <= \oRESULT[2]~output_o\;

ww_oRESULT(3) <= \oRESULT[3]~output_o\;
END structure;


