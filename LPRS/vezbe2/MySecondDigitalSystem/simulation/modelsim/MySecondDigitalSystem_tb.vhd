library ieee;
use ieee.std_logic_1164.all;

entity MySecondDigitalSystem_tb is
end entity;

architecture Test of MySecondDigitalSystem_tb is

signal sB3 : std_logic;
signal sB2 : std_logic;
signal sB1 : std_logic;
signal sB0 : std_logic;
signal sY  : std_logic;

component MySecondDigitalSystem is
port (
	iB3 : in std_logic;
	iB2 : in std_logic;
	iB1 : in std_logic;
	iB0 : in std_logic;
	oY : out std_logic
);
end component;

begin 
uut: MySecondDigitalSystem port map (
	iB3 => sB3,
	iB2 => sB2,
	iB1 => sB1,
	iB0 => sB0,
	oY => sY
);

stimulus : process
begin 
	sB3 <= '0';
	sB2 <= '0';
	sB1 <= '0';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '0';
	sB1 <= '0';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '0';
	sB1 <= '1';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '0';
	sB1 <= '1';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '1';
	sB1 <= '0';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '1';
	sB1 <= '0';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '1';
	sB1 <= '1';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '0';
	sB2 <= '1';
	sB1 <= '1';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '0';
	sB1 <= '0';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '0';
	sB1 <= '0';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '0';
	sB1 <= '1';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '0';
	sB1 <= '1';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '1';
	sB1 <= '0';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '1';
	sB1 <= '0';
	sB0 <= '1';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '1';
	sB1 <= '1';
	sB0 <= '0';
	wait for 100 ns;
	sB3 <= '1';
	sB2 <= '1';
	sB1 <= '1';
	sB0 <= '1';
	wait;
	
end process;
end architecture;