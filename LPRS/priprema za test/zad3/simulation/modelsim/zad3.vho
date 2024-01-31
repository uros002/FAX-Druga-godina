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

-- DATE "12/10/2022 19:37:07"

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

ENTITY 	zad3 IS
    PORT (
	iCLK : IN std_logic;
	iRST : IN std_logic;
	iEN : IN std_logic;
	iA : IN std_logic_vector(7 DOWNTO 0);
	iB : IN std_logic_vector(4 DOWNTO 0);
	iC : IN std_logic_vector(6 DOWNTO 0);
	iD : IN std_logic_vector(6 DOWNTO 0);
	oRESULT : BUFFER std_logic_vector(7 DOWNTO 0);
	oCOMP : BUFFER std_logic
	);
END zad3;

-- Design Ports Information
-- oRESULT[0]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[1]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[2]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[4]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[5]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[6]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[7]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oCOMP	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[4]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[0]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[0]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[5]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[1]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[1]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[6]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[2]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[2]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[3]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[7]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[3]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[3]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[4]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[4]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[4]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[5]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[5]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[6]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[6]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRST	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iEN	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF zad3 IS
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
SIGNAL ww_iA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iB : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_iC : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_iD : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_oRESULT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_oCOMP : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oRESULT[0]~output_o\ : std_logic;
SIGNAL \oRESULT[1]~output_o\ : std_logic;
SIGNAL \oRESULT[2]~output_o\ : std_logic;
SIGNAL \oRESULT[3]~output_o\ : std_logic;
SIGNAL \oRESULT[4]~output_o\ : std_logic;
SIGNAL \oRESULT[5]~output_o\ : std_logic;
SIGNAL \oRESULT[6]~output_o\ : std_logic;
SIGNAL \oRESULT[7]~output_o\ : std_logic;
SIGNAL \oCOMP~output_o\ : std_logic;
SIGNAL \iCLK~input_o\ : std_logic;
SIGNAL \iCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \Add6~3\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \iRST~input_o\ : std_logic;
SIGNAL \iRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \iEN~input_o\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add6~5\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL \sCOUNT~2_combout\ : std_logic;
SIGNAL \Add6~7\ : std_logic;
SIGNAL \Add6~8_combout\ : std_logic;
SIGNAL \sCOUNT~1_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add6~0_combout\ : std_logic;
SIGNAL \sCOUNT~0_combout\ : std_logic;
SIGNAL \Add6~1\ : std_logic;
SIGNAL \Add6~2_combout\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \iA[4]~input_o\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \Add0~1_cout\ : std_logic;
SIGNAL \Add0~3_cout\ : std_logic;
SIGNAL \Add0~5_cout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \sRESULT~4_combout\ : std_logic;
SIGNAL \iC[0]~input_o\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \iD[0]~input_o\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \sSUM[0]~0_combout\ : std_logic;
SIGNAL \sRESULT~16_combout\ : std_logic;
SIGNAL \iD[1]~input_o\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \iC[1]~input_o\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \sSUM[0]~1\ : std_logic;
SIGNAL \sSUM[1]~2_combout\ : std_logic;
SIGNAL \iA[5]~input_o\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \sRESULT~6_combout\ : std_logic;
SIGNAL \sRESULT~7_combout\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \iA[6]~input_o\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \sRESULT~8_combout\ : std_logic;
SIGNAL \iC[2]~input_o\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \iD[2]~input_o\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \sSUM[1]~3\ : std_logic;
SIGNAL \sSUM[2]~4_combout\ : std_logic;
SIGNAL \sRESULT~17_combout\ : std_logic;
SIGNAL \iB[3]~input_o\ : std_logic;
SIGNAL \iA[7]~input_o\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \sRESULT~9_combout\ : std_logic;
SIGNAL \iD[3]~input_o\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \iC[3]~input_o\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \sSUM[2]~5\ : std_logic;
SIGNAL \sSUM[3]~6_combout\ : std_logic;
SIGNAL \sRESULT~10_combout\ : std_logic;
SIGNAL \iD[4]~input_o\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \iC[4]~input_o\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \sSUM[3]~7\ : std_logic;
SIGNAL \sSUM[4]~8_combout\ : std_logic;
SIGNAL \iB[4]~input_o\ : std_logic;
SIGNAL \sFUN[3]~1_cout\ : std_logic;
SIGNAL \sFUN[4]~2_combout\ : std_logic;
SIGNAL \sRESULT~11_combout\ : std_logic;
SIGNAL \sRESULT~12_combout\ : std_logic;
SIGNAL \iC[5]~input_o\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \iD[5]~input_o\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \sSUM[4]~9\ : std_logic;
SIGNAL \sSUM[5]~10_combout\ : std_logic;
SIGNAL \sRESULT~13_combout\ : std_logic;
SIGNAL \sRESULT~5_combout\ : std_logic;
SIGNAL \iC[6]~input_o\ : std_logic;
SIGNAL \iD[6]~input_o\ : std_logic;
SIGNAL \sSUM[5]~11\ : std_logic;
SIGNAL \sSUM[6]~12_combout\ : std_logic;
SIGNAL \sRESULT~14_combout\ : std_logic;
SIGNAL \sSUM[6]~13\ : std_logic;
SIGNAL \sSUM[7]~14_combout\ : std_logic;
SIGNAL \sRESULT~15_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL sCOUNT : std_logic_vector(4 DOWNTO 0);
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
ww_iA <= iA;
ww_iB <= iB;
ww_iC <= iC;
ww_iD <= iD;
oRESULT <= ww_oRESULT;
oCOMP <= ww_oCOMP;
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

-- Location: LCCOMB_X26_Y20_N16
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

-- Location: IOOBUF_X50_Y14_N23
\oRESULT[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~16_combout\,
	devoe => ww_devoe,
	o => \oRESULT[0]~output_o\);

-- Location: IOOBUF_X10_Y17_N2
\oRESULT[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~7_combout\,
	devoe => ww_devoe,
	o => \oRESULT[1]~output_o\);

-- Location: IOOBUF_X21_Y17_N30
\oRESULT[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~17_combout\,
	devoe => ww_devoe,
	o => \oRESULT[2]~output_o\);

-- Location: IOOBUF_X12_Y17_N2
\oRESULT[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~10_combout\,
	devoe => ww_devoe,
	o => \oRESULT[3]~output_o\);

-- Location: IOOBUF_X16_Y17_N23
\oRESULT[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~12_combout\,
	devoe => ww_devoe,
	o => \oRESULT[4]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\oRESULT[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~13_combout\,
	devoe => ww_devoe,
	o => \oRESULT[5]~output_o\);

-- Location: IOOBUF_X10_Y17_N9
\oRESULT[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~14_combout\,
	devoe => ww_devoe,
	o => \oRESULT[6]~output_o\);

-- Location: IOOBUF_X10_Y17_N16
\oRESULT[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sRESULT~15_combout\,
	devoe => ww_devoe,
	o => \oRESULT[7]~output_o\);

-- Location: IOOBUF_X25_Y22_N16
\oCOMP~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~3_combout\,
	devoe => ww_devoe,
	o => \oCOMP~output_o\);

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

-- Location: LCCOMB_X13_Y13_N14
\Add6~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add6~2_combout\ = (sCOUNT(1) & (!\Add6~1\)) # (!sCOUNT(1) & ((\Add6~1\) # (GND)))
-- \Add6~3\ = CARRY((!\Add6~1\) # (!sCOUNT(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => sCOUNT(1),
	datad => VCC,
	cin => \Add6~1\,
	combout => \Add6~2_combout\,
	cout => \Add6~3\);

-- Location: LCCOMB_X13_Y13_N16
\Add6~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = (sCOUNT(2) & (\Add6~3\ $ (GND))) # (!sCOUNT(2) & (!\Add6~3\ & VCC))
-- \Add6~5\ = CARRY((sCOUNT(2) & !\Add6~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => sCOUNT(2),
	datad => VCC,
	cin => \Add6~3\,
	combout => \Add6~4_combout\,
	cout => \Add6~5\);

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

-- Location: IOIBUF_X12_Y17_N29
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

-- Location: FF_X13_Y13_N17
\sCOUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Add6~4_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(2));

-- Location: LCCOMB_X13_Y13_N28
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!sCOUNT(0) & !sCOUNT(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(0),
	datad => sCOUNT(1),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X13_Y13_N18
\Add6~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = (sCOUNT(3) & (!\Add6~5\)) # (!sCOUNT(3) & ((\Add6~5\) # (GND)))
-- \Add6~7\ = CARRY((!\Add6~5\) # (!sCOUNT(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => sCOUNT(3),
	datad => VCC,
	cin => \Add6~5\,
	combout => \Add6~6_combout\,
	cout => \Add6~7\);

-- Location: LCCOMB_X13_Y13_N24
\sCOUNT~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT~2_combout\ = \Add6~6_combout\ $ (((!sCOUNT(2) & (\Equal0~0_combout\ & \Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(2),
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Add6~6_combout\,
	combout => \sCOUNT~2_combout\);

-- Location: FF_X13_Y13_N25
\sCOUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT~2_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(3));

-- Location: LCCOMB_X13_Y13_N20
\Add6~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add6~8_combout\ = \Add6~7\ $ (!sCOUNT(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => sCOUNT(4),
	cin => \Add6~7\,
	combout => \Add6~8_combout\);

-- Location: LCCOMB_X13_Y13_N6
\sCOUNT~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT~1_combout\ = \Add6~8_combout\ $ (((!sCOUNT(2) & (\Equal0~0_combout\ & \Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(2),
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Add6~8_combout\,
	combout => \sCOUNT~1_combout\);

-- Location: FF_X13_Y13_N7
\sCOUNT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(4));

-- Location: LCCOMB_X13_Y13_N22
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (sCOUNT(3) & sCOUNT(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sCOUNT(3),
	datad => sCOUNT(4),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X13_Y13_N12
\Add6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add6~0_combout\ = sCOUNT(0) $ (VCC)
-- \Add6~1\ = CARRY(sCOUNT(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sCOUNT(0),
	datad => VCC,
	combout => \Add6~0_combout\,
	cout => \Add6~1\);

-- Location: LCCOMB_X13_Y13_N8
\sCOUNT~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCOUNT~0_combout\ = \Add6~0_combout\ $ (((!sCOUNT(2) & (\Equal0~0_combout\ & \Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(2),
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Add6~0_combout\,
	combout => \sCOUNT~0_combout\);

-- Location: FF_X13_Y13_N9
\sCOUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sCOUNT~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(0));

-- Location: FF_X13_Y13_N15
\sCOUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Add6~2_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sCOUNT(1));

-- Location: IOIBUF_X14_Y17_N1
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

-- Location: IOIBUF_X14_Y17_N22
\iA[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(4),
	o => \iA[4]~input_o\);

-- Location: IOIBUF_X19_Y17_N8
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

-- Location: IOIBUF_X14_Y0_N1
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

-- Location: IOIBUF_X19_Y17_N15
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

-- Location: IOIBUF_X19_Y17_N22
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

-- Location: LCCOMB_X14_Y13_N16
\Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~1_cout\ = CARRY((!\iA[1]~input_o\ & !\iA[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datab => \iA[0]~input_o\,
	datad => VCC,
	cout => \Add0~1_cout\);

-- Location: LCCOMB_X14_Y13_N18
\Add0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~3_cout\ = CARRY((\iA[2]~input_o\) # (!\Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[2]~input_o\,
	datad => VCC,
	cin => \Add0~1_cout\,
	cout => \Add0~3_cout\);

-- Location: LCCOMB_X14_Y13_N20
\Add0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~5_cout\ = CARRY((!\iA[3]~input_o\ & !\Add0~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[3]~input_o\,
	datad => VCC,
	cin => \Add0~3_cout\,
	cout => \Add0~5_cout\);

-- Location: LCCOMB_X14_Y13_N22
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\iA[4]~input_o\ & ((\Add0~5_cout\) # (GND))) # (!\iA[4]~input_o\ & (!\Add0~5_cout\))
-- \Add0~7\ = CARRY((\iA[4]~input_o\) # (!\Add0~5_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[4]~input_o\,
	datad => VCC,
	cin => \Add0~5_cout\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X14_Y13_N12
\sRESULT~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~4_combout\ = (!sCOUNT(1) & ((sCOUNT(0) & (!\iB[0]~input_o\)) # (!sCOUNT(0) & ((\Add0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(0),
	datab => \iB[0]~input_o\,
	datac => \Add0~6_combout\,
	datad => sCOUNT(1),
	combout => \sRESULT~4_combout\);

-- Location: IOIBUF_X8_Y17_N1
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

-- Location: LCCOMB_X9_Y13_N0
\Add2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = \iC[0]~input_o\ $ (VCC)
-- \Add2~1\ = CARRY(\iC[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iC[0]~input_o\,
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: IOIBUF_X19_Y17_N29
\iD[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(0),
	o => \iD[0]~input_o\);

-- Location: LCCOMB_X12_Y13_N4
\Add3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = \iD[0]~input_o\ $ (VCC)
-- \Add3~1\ = CARRY(\iD[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iD[0]~input_o\,
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X12_Y13_N16
\sSUM[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[0]~0_combout\ = (\Add2~0_combout\ & (!\Add3~0_combout\ & VCC)) # (!\Add2~0_combout\ & (\Add3~0_combout\ $ (GND)))
-- \sSUM[0]~1\ = CARRY((!\Add2~0_combout\ & !\Add3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datab => \Add3~0_combout\,
	datad => VCC,
	combout => \sSUM[0]~0_combout\,
	cout => \sSUM[0]~1\);

-- Location: LCCOMB_X14_Y13_N30
\sRESULT~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~16_combout\ = (\sRESULT~4_combout\) # ((sCOUNT(1) & (\sSUM[0]~0_combout\ & !sCOUNT(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datab => \sRESULT~4_combout\,
	datac => \sSUM[0]~0_combout\,
	datad => sCOUNT(0),
	combout => \sRESULT~16_combout\);

-- Location: IOIBUF_X12_Y17_N15
\iD[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(1),
	o => \iD[1]~input_o\);

-- Location: LCCOMB_X12_Y13_N6
\Add3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\iD[1]~input_o\ & (!\Add3~1\)) # (!\iD[1]~input_o\ & ((\Add3~1\) # (GND)))
-- \Add3~3\ = CARRY((!\Add3~1\) # (!\iD[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iD[1]~input_o\,
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: IOIBUF_X8_Y17_N15
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

-- Location: LCCOMB_X9_Y13_N2
\Add2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (\iC[1]~input_o\ & (!\Add2~1\)) # (!\iC[1]~input_o\ & ((\Add2~1\) # (GND)))
-- \Add2~3\ = CARRY((!\Add2~1\) # (!\iC[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iC[1]~input_o\,
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X12_Y13_N18
\sSUM[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[1]~2_combout\ = (\Add3~2_combout\ & ((\Add2~2_combout\ & ((\sSUM[0]~1\) # (GND))) # (!\Add2~2_combout\ & (!\sSUM[0]~1\)))) # (!\Add3~2_combout\ & ((\Add2~2_combout\ & (!\sSUM[0]~1\)) # (!\Add2~2_combout\ & (\sSUM[0]~1\ & VCC))))
-- \sSUM[1]~3\ = CARRY((\Add3~2_combout\ & ((\Add2~2_combout\) # (!\sSUM[0]~1\))) # (!\Add3~2_combout\ & (\Add2~2_combout\ & !\sSUM[0]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~2_combout\,
	datab => \Add2~2_combout\,
	datad => VCC,
	cin => \sSUM[0]~1\,
	combout => \sSUM[1]~2_combout\,
	cout => \sSUM[1]~3\);

-- Location: IOIBUF_X14_Y0_N22
\iA[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(5),
	o => \iA[5]~input_o\);

-- Location: LCCOMB_X14_Y13_N24
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\iA[5]~input_o\ & (!\Add0~7\ & VCC)) # (!\iA[5]~input_o\ & (\Add0~7\ $ (GND)))
-- \Add0~9\ = CARRY((!\iA[5]~input_o\ & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[5]~input_o\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: IOIBUF_X19_Y17_N1
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

-- Location: LCCOMB_X14_Y13_N2
\sRESULT~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~6_combout\ = (sCOUNT(0) & (((sCOUNT(1)) # (!\iB[1]~input_o\)))) # (!sCOUNT(0) & (\Add0~8_combout\ & ((!sCOUNT(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(0),
	datab => \Add0~8_combout\,
	datac => \iB[1]~input_o\,
	datad => sCOUNT(1),
	combout => \sRESULT~6_combout\);

-- Location: LCCOMB_X12_Y13_N0
\sRESULT~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~7_combout\ = (\sRESULT~6_combout\) # ((\sSUM[1]~2_combout\ & sCOUNT(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sSUM[1]~2_combout\,
	datac => sCOUNT(1),
	datad => \sRESULT~6_combout\,
	combout => \sRESULT~7_combout\);

-- Location: IOIBUF_X14_Y17_N29
\iB[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(2),
	o => \iB[2]~input_o\);

-- Location: IOIBUF_X16_Y17_N8
\iA[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(6),
	o => \iA[6]~input_o\);

-- Location: LCCOMB_X14_Y13_N26
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\iA[6]~input_o\ & ((\Add0~9\) # (GND))) # (!\iA[6]~input_o\ & (!\Add0~9\))
-- \Add0~11\ = CARRY((\iA[6]~input_o\) # (!\Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[6]~input_o\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X14_Y13_N0
\sRESULT~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~8_combout\ = (!sCOUNT(1) & ((sCOUNT(0) & (!\iB[2]~input_o\)) # (!sCOUNT(0) & ((\Add0~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(0),
	datab => \iB[2]~input_o\,
	datac => \Add0~10_combout\,
	datad => sCOUNT(1),
	combout => \sRESULT~8_combout\);

-- Location: IOIBUF_X8_Y17_N22
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

-- Location: LCCOMB_X9_Y13_N4
\Add2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (\iC[2]~input_o\ & (\Add2~3\ $ (GND))) # (!\iC[2]~input_o\ & (!\Add2~3\ & VCC))
-- \Add2~5\ = CARRY((\iC[2]~input_o\ & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iC[2]~input_o\,
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: IOIBUF_X12_Y17_N22
\iD[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(2),
	o => \iD[2]~input_o\);

-- Location: LCCOMB_X12_Y13_N8
\Add3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (\iD[2]~input_o\ & (\Add3~3\ $ (GND))) # (!\iD[2]~input_o\ & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((\iD[2]~input_o\ & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iD[2]~input_o\,
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X12_Y13_N20
\sSUM[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[2]~4_combout\ = ((\Add2~4_combout\ $ (\Add3~4_combout\ $ (!\sSUM[1]~3\)))) # (GND)
-- \sSUM[2]~5\ = CARRY((\Add2~4_combout\ & (!\Add3~4_combout\ & !\sSUM[1]~3\)) # (!\Add2~4_combout\ & ((!\sSUM[1]~3\) # (!\Add3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~4_combout\,
	datab => \Add3~4_combout\,
	datad => VCC,
	cin => \sSUM[1]~3\,
	combout => \sSUM[2]~4_combout\,
	cout => \sSUM[2]~5\);

-- Location: LCCOMB_X14_Y13_N14
\sRESULT~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~17_combout\ = (\sRESULT~8_combout\) # ((sCOUNT(1) & (\sSUM[2]~4_combout\ & !sCOUNT(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datab => \sRESULT~8_combout\,
	datac => \sSUM[2]~4_combout\,
	datad => sCOUNT(0),
	combout => \sRESULT~17_combout\);

-- Location: IOIBUF_X0_Y12_N22
\iB[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(3),
	o => \iB[3]~input_o\);

-- Location: IOIBUF_X16_Y17_N15
\iA[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(7),
	o => \iA[7]~input_o\);

-- Location: LCCOMB_X14_Y13_N28
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = \Add0~11\ $ (\iA[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \iA[7]~input_o\,
	cin => \Add0~11\,
	combout => \Add0~12_combout\);

-- Location: LCCOMB_X13_Y13_N10
\sRESULT~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~9_combout\ = (!sCOUNT(1) & ((sCOUNT(0) & (\iB[3]~input_o\)) # (!sCOUNT(0) & ((\Add0~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => sCOUNT(0),
	datac => \Add0~12_combout\,
	datad => sCOUNT(1),
	combout => \sRESULT~9_combout\);

-- Location: IOIBUF_X12_Y17_N8
\iD[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(3),
	o => \iD[3]~input_o\);

-- Location: LCCOMB_X12_Y13_N10
\Add3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\iD[3]~input_o\ & (!\Add3~5\)) # (!\iD[3]~input_o\ & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!\iD[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iD[3]~input_o\,
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: IOIBUF_X0_Y11_N22
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

-- Location: LCCOMB_X9_Y13_N6
\Add2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (\iC[3]~input_o\ & (!\Add2~5\)) # (!\iC[3]~input_o\ & ((\Add2~5\) # (GND)))
-- \Add2~7\ = CARRY((!\Add2~5\) # (!\iC[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iC[3]~input_o\,
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X12_Y13_N22
\sSUM[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[3]~6_combout\ = (\Add3~6_combout\ & ((\Add2~6_combout\ & ((\sSUM[2]~5\) # (GND))) # (!\Add2~6_combout\ & (!\sSUM[2]~5\)))) # (!\Add3~6_combout\ & ((\Add2~6_combout\ & (!\sSUM[2]~5\)) # (!\Add2~6_combout\ & (\sSUM[2]~5\ & VCC))))
-- \sSUM[3]~7\ = CARRY((\Add3~6_combout\ & ((\Add2~6_combout\) # (!\sSUM[2]~5\))) # (!\Add3~6_combout\ & (\Add2~6_combout\ & !\sSUM[2]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~6_combout\,
	datab => \Add2~6_combout\,
	datad => VCC,
	cin => \sSUM[2]~5\,
	combout => \sSUM[3]~6_combout\,
	cout => \sSUM[3]~7\);

-- Location: LCCOMB_X13_Y13_N4
\sRESULT~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~10_combout\ = (\sRESULT~9_combout\) # ((\sSUM[3]~6_combout\ & (!sCOUNT(0) & sCOUNT(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sRESULT~9_combout\,
	datab => \sSUM[3]~6_combout\,
	datac => sCOUNT(0),
	datad => sCOUNT(1),
	combout => \sRESULT~10_combout\);

-- Location: IOIBUF_X0_Y9_N15
\iD[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(4),
	o => \iD[4]~input_o\);

-- Location: LCCOMB_X12_Y13_N12
\Add3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (\iD[4]~input_o\ & (\Add3~7\ $ (GND))) # (!\iD[4]~input_o\ & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((\iD[4]~input_o\ & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iD[4]~input_o\,
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: IOIBUF_X0_Y14_N1
\iC[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(4),
	o => \iC[4]~input_o\);

-- Location: LCCOMB_X9_Y13_N8
\Add2~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (\iC[4]~input_o\ & (\Add2~7\ $ (GND))) # (!\iC[4]~input_o\ & (!\Add2~7\ & VCC))
-- \Add2~9\ = CARRY((\iC[4]~input_o\ & !\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iC[4]~input_o\,
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X12_Y13_N24
\sSUM[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[4]~8_combout\ = ((\Add3~8_combout\ $ (\Add2~8_combout\ $ (!\sSUM[3]~7\)))) # (GND)
-- \sSUM[4]~9\ = CARRY((\Add3~8_combout\ & (!\Add2~8_combout\ & !\sSUM[3]~7\)) # (!\Add3~8_combout\ & ((!\sSUM[3]~7\) # (!\Add2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~8_combout\,
	datab => \Add2~8_combout\,
	datad => VCC,
	cin => \sSUM[3]~7\,
	combout => \sSUM[4]~8_combout\,
	cout => \sSUM[4]~9\);

-- Location: IOIBUF_X8_Y0_N15
\iB[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(4),
	o => \iB[4]~input_o\);

-- Location: LCCOMB_X7_Y13_N8
\sFUN[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFUN[3]~1_cout\ = CARRY(!\iB[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iB[3]~input_o\,
	datad => VCC,
	cout => \sFUN[3]~1_cout\);

-- Location: LCCOMB_X7_Y13_N10
\sFUN[4]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFUN[4]~2_combout\ = \sFUN[3]~1_cout\ $ (!\iB[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \iB[4]~input_o\,
	cin => \sFUN[3]~1_cout\,
	combout => \sFUN[4]~2_combout\);

-- Location: LCCOMB_X14_Y13_N10
\sRESULT~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~11_combout\ = (sCOUNT(1) & (((sCOUNT(0))))) # (!sCOUNT(1) & ((sCOUNT(0) & ((\sFUN[4]~2_combout\))) # (!sCOUNT(0) & (\Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datab => \Add0~12_combout\,
	datac => \sFUN[4]~2_combout\,
	datad => sCOUNT(0),
	combout => \sRESULT~11_combout\);

-- Location: LCCOMB_X14_Y13_N8
\sRESULT~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~12_combout\ = (\sRESULT~11_combout\) # ((sCOUNT(1) & \sSUM[4]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datac => \sSUM[4]~8_combout\,
	datad => \sRESULT~11_combout\,
	combout => \sRESULT~12_combout\);

-- Location: IOIBUF_X0_Y15_N22
\iC[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(5),
	o => \iC[5]~input_o\);

-- Location: LCCOMB_X9_Y13_N10
\Add2~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = \Add2~9\ $ (\iC[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \iC[5]~input_o\,
	cin => \Add2~9\,
	combout => \Add2~10_combout\);

-- Location: IOIBUF_X0_Y9_N1
\iD[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(5),
	o => \iD[5]~input_o\);

-- Location: LCCOMB_X12_Y13_N14
\Add3~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = \Add3~9\ $ (\iD[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \iD[5]~input_o\,
	cin => \Add3~9\,
	combout => \Add3~10_combout\);

-- Location: LCCOMB_X12_Y13_N26
\sSUM[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[5]~10_combout\ = (\Add2~10_combout\ & ((\Add3~10_combout\ & ((\sSUM[4]~9\) # (GND))) # (!\Add3~10_combout\ & (!\sSUM[4]~9\)))) # (!\Add2~10_combout\ & ((\Add3~10_combout\ & (!\sSUM[4]~9\)) # (!\Add3~10_combout\ & (\sSUM[4]~9\ & VCC))))
-- \sSUM[5]~11\ = CARRY((\Add2~10_combout\ & ((\Add3~10_combout\) # (!\sSUM[4]~9\))) # (!\Add2~10_combout\ & (\Add3~10_combout\ & !\sSUM[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~10_combout\,
	datab => \Add3~10_combout\,
	datad => VCC,
	cin => \sSUM[4]~9\,
	combout => \sSUM[5]~10_combout\,
	cout => \sSUM[5]~11\);

-- Location: LCCOMB_X13_Y13_N30
\sRESULT~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~13_combout\ = (!sCOUNT(0) & ((sCOUNT(1) & (\sSUM[5]~10_combout\)) # (!sCOUNT(1) & ((\Add0~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sSUM[5]~10_combout\,
	datab => sCOUNT(0),
	datac => \Add0~12_combout\,
	datad => sCOUNT(1),
	combout => \sRESULT~13_combout\);

-- Location: LCCOMB_X15_Y13_N28
\sRESULT~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~5_combout\ = (!sCOUNT(0) & sCOUNT(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => sCOUNT(0),
	datad => sCOUNT(1),
	combout => \sRESULT~5_combout\);

-- Location: IOIBUF_X16_Y17_N1
\iC[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(6),
	o => \iC[6]~input_o\);

-- Location: IOIBUF_X0_Y11_N15
\iD[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(6),
	o => \iD[6]~input_o\);

-- Location: LCCOMB_X12_Y13_N28
\sSUM[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[6]~12_combout\ = ((\iC[6]~input_o\ $ (\iD[6]~input_o\ $ (!\sSUM[5]~11\)))) # (GND)
-- \sSUM[6]~13\ = CARRY((\iC[6]~input_o\ & ((\iD[6]~input_o\) # (!\sSUM[5]~11\))) # (!\iC[6]~input_o\ & (\iD[6]~input_o\ & !\sSUM[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iC[6]~input_o\,
	datab => \iD[6]~input_o\,
	datad => VCC,
	cin => \sSUM[5]~11\,
	combout => \sSUM[6]~12_combout\,
	cout => \sSUM[6]~13\);

-- Location: LCCOMB_X13_Y13_N26
\sRESULT~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~14_combout\ = (\sRESULT~5_combout\ & ((\sSUM[6]~12_combout\) # ((\Equal0~0_combout\ & \Add0~12_combout\)))) # (!\sRESULT~5_combout\ & (\Equal0~0_combout\ & (\Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sRESULT~5_combout\,
	datab => \Equal0~0_combout\,
	datac => \Add0~12_combout\,
	datad => \sSUM[6]~12_combout\,
	combout => \sRESULT~14_combout\);

-- Location: LCCOMB_X12_Y13_N30
\sSUM[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sSUM[7]~14_combout\ = \iD[6]~input_o\ $ (\sSUM[6]~13\ $ (\iC[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iD[6]~input_o\,
	datad => \iC[6]~input_o\,
	cin => \sSUM[6]~13\,
	combout => \sSUM[7]~14_combout\);

-- Location: LCCOMB_X12_Y13_N2
\sRESULT~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sRESULT~15_combout\ = (\Add0~12_combout\ & ((\Equal0~0_combout\) # ((\sSUM[7]~14_combout\ & \sRESULT~5_combout\)))) # (!\Add0~12_combout\ & (((\sSUM[7]~14_combout\ & \sRESULT~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~12_combout\,
	datab => \Equal0~0_combout\,
	datac => \sSUM[7]~14_combout\,
	datad => \sRESULT~5_combout\,
	combout => \sRESULT~15_combout\);

-- Location: LCCOMB_X13_Y13_N0
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (sCOUNT(1) & ((\sSUM[7]~14_combout\) # ((\sSUM[6]~12_combout\)))) # (!sCOUNT(1) & (((\Add0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sCOUNT(1),
	datab => \sSUM[7]~14_combout\,
	datac => \Add0~12_combout\,
	datad => \sSUM[6]~12_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X14_Y13_N6
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (\sRESULT~17_combout\) # ((\sRESULT~16_combout\) # ((\LessThan0~1_combout\ & !sCOUNT(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~1_combout\,
	datab => \sRESULT~17_combout\,
	datac => \sRESULT~16_combout\,
	datad => sCOUNT(0),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X13_Y13_N2
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (\sRESULT~9_combout\) # ((\sRESULT~7_combout\) # ((\sSUM[3]~6_combout\ & \sRESULT~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sRESULT~9_combout\,
	datab => \sSUM[3]~6_combout\,
	datac => \sRESULT~5_combout\,
	datad => \sRESULT~7_combout\,
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X14_Y13_N4
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\LessThan0~2_combout\) # ((\sRESULT~13_combout\) # ((\sRESULT~12_combout\) # (\LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~2_combout\,
	datab => \sRESULT~13_combout\,
	datac => \sRESULT~12_combout\,
	datad => \LessThan0~0_combout\,
	combout => \LessThan0~3_combout\);

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

ww_oRESULT(4) <= \oRESULT[4]~output_o\;

ww_oRESULT(5) <= \oRESULT[5]~output_o\;

ww_oRESULT(6) <= \oRESULT[6]~output_o\;

ww_oRESULT(7) <= \oRESULT[7]~output_o\;

ww_oCOMP <= \oCOMP~output_o\;
END structure;


