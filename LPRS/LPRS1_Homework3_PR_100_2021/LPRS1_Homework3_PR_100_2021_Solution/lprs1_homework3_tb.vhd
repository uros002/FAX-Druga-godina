
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

entity lprs1_homework3_tb is
end entity;

architecture arch of lprs1_homework3_tb is
	-- Constants.
	constant A : std_logic_vector(1 downto 0) := "00";
	constant C : std_logic_vector(1 downto 0) := "01";
	constant G : std_logic_vector(1 downto 0) := "10";
	constant T : std_logic_vector(1 downto 0) := "11";
	
	
	constant i_clk_period : time := 10 ns;
	
	signal i_clk            : std_logic;
	signal i_rst            : std_logic;
	signal i_base           : std_logic_vector(1 downto 0);
	signal i_sequence       : std_logic_vector(63 downto 0);
	signal i_load_sequence  : std_logic;
	signal i_base_src_sel   : std_logic;
	signal i_cnt_subseq_sel : std_logic_vector(1 downto 0);
	signal o_cnt_subseq     : std_logic_vector(3 downto 0);
	
begin
	
	uut: entity work.lprs1_homework3
	port map(
		i_clk            => i_clk,
		i_rst            => i_rst,
		i_base           => i_base,
		i_sequence       => i_sequence,
		i_load_sequence  => i_load_sequence,
		i_base_src_sel   => i_base_src_sel,
		i_cnt_subseq_sel => i_cnt_subseq_sel,
		o_cnt_subseq     => o_cnt_subseq
	);
	
	clk_p: process
	begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
	end process;
	
	stim_p: process
	begin
		-- Test cases:
			
			
			i_rst <= '1';
			wait for 14 * i_clk_period;
			i_rst <= '0';
			i_base_src_sel <= '0';
			wait for i_clk_period;
			i_cnt_subseq_sel <= "01";
			wait for i_clk_period;
			
			i_base <= C;
			wait for i_clk_period;
			i_base <= G;
			wait for i_clk_period;
			i_base <= T;
			wait for i_clk_period;
			i_base <= C;
			wait for i_clk_period;
			
			i_base <= A;
			wait for i_clk_period;
			i_base <= C;
			wait for i_clk_period;
			i_base <= G;
			wait for i_clk_period;
			i_base <= T;
			wait for i_clk_period;
			
			i_base <= C;
			wait for i_clk_period;
			i_base <= G;
			wait for i_clk_period;
			i_base <= G;
			wait for i_clk_period;
			i_base <= C;
			wait for i_clk_period;
			
			i_base <= G;
			wait for i_clk_period;
			i_base <= C;
			wait for i_clk_period;
			i_base <= T;
			wait for i_clk_period;
			i_base <= A;
			wait for i_clk_period;
			
			i_base <= T;
			wait for i_clk_period;
			i_base <= T;
			wait for i_clk_period;
			i_base <= A;
			wait for i_clk_period;
			i_base <= T;
			wait for i_clk_period;
			
			i_base_src_sel <= '1';
			i_cnt_subseq_sel <= "11";
			wait for i_clk_period;
			
			--DRUGA SEKVENCA
			
			i_sequence <= "1101011001001101010010001100110001011010111011110011001110111000";
			
			i_rst <= '1';
			wait for 14 * i_clk_period;
			i_rst <= '0';
			wait for i_clk_period;
			i_cnt_subseq_sel <= "01";
			wait for 3*i_clk_period;
			
						--PRVA PODSEKVENCA
			--prvo ucitavanje sekvence i uzimanje prve baze
			i_load_sequence <= '1';
			wait for 3*i_clk_period;
			i_base_src_sel <= '1';
			wait for 3*i_clk_period;
			
			--siftovanje u desno 
			i_load_sequence <= '0';
			wait for 32*i_clk_period;
			

			i_rst <= '1';
			
			
		
		wait;
	end process;
	
	
end architecture;
