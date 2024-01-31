
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Libraries.

entity lprs1_homework2 is
	port(
		i_clk    :  in std_logic;
		i_rst    :  in std_logic;
		i_run    :  in std_logic;
		i_pause  :  in std_logic;
		o_digit0 : out std_logic_vector(3 downto 0);
		o_digit1 : out std_logic_vector(3 downto 0);
		o_digit2 : out std_logic_vector(3 downto 0);
		o_digit3 : out std_logic_vector(3 downto 0)
	);
end entity;


architecture arch of lprs1_homework2 is
	-- Signals.
	signal s_en_1us,s_tc_1us,s_en0,s_tc0,s_en1,s_tc1: std_logic;
	signal s_digit2,s_digit3,s_cnt0,s_cnt1: std_logic_vector(3 downto 0);
	signal s_cnt_1us: std_logic_vector(7 downto 0);
	
	--konstante
	constant najveci_moduo: std_logic_vector(7 downto 0) := "11000111"; --199;
	constant modul2: std_logic_vector(3 downto 0) := "1001"; --9
	constant modul3: std_logic_vector(3 downto 0) := "0100";--4
	
begin
	-- Body.
	
	--KONTROLA DOZVOLE BROJANJA
	process( i_clk, i_rst) begin
		if( i_rst = '1') then 
			s_en_1us <= '0';
		elsif( i_clk' event and i_clk ='1') then
			if(i_rst = '1' ) then 
				s_en_1us <= '0';
				elsif( i_run = '1') then 
					s_en_1us <= '1';
				elsif(i_pause ='1') then 
					s_en_1us <= '0';
				elsif(i_pause = '1' and i_run = '1') then
					s_en_1us <= '1';
			end if;
		end if;
	
	end process;
	
	--brojac jedne mikrosekunde
	process(i_clk,i_rst) begin
		if(i_rst = '1') then
			s_cnt_1us <= "00000000";
		elsif(i_clk 'event and i_clk = '1') then
			if(s_en_1us = '1') then
				if(s_cnt_1us < najveci_moduo) then
					s_cnt_1us <= s_cnt_1us + 1;
				elsif(s_cnt_1us >= najveci_moduo) then
					s_cnt_1us <= "00000000";
				end if;
			end if;
		end if;
	end process;
	
	--kombinaciono da li treba aktivirati signal s_tc_1us
	s_tc_1us <= '1' when s_cnt_1us <= "00000000" else
					'0';
					
	s_en0 <= s_tc_1us and s_en_1us;

	--brojac jedne nulte cifre
	process(i_clk,i_rst) begin
		if(i_rst= '1') then
			s_cnt0 <= "0000";
		elsif(i_clk 'event and i_clk = '1') then
			if(s_en0 = '1') then
				if(s_cnt0 < modul2) then
					s_cnt0 <= s_cnt0 + 1;
				else
					s_cnt0 <= "0000";
				end if;
			end if;
		end if;
	end process;
	
	s_tc0 <= '1' when s_cnt0 <= "0000" else
				'0';
				
	s_en1 <= s_tc0 and s_en_1us;
	
	o_digit0 <= s_cnt0;
	
	
	--brojac jedne prve cifre
	process(i_clk,i_rst) begin
		if(i_rst = '1') then
			s_cnt1 <= "0000";
		elsif(i_clk ' event and i_clk = '1') then
			if(s_en1 = '1') then
				if(s_cnt1 < modul3) then
					s_cnt1 <= s_cnt1 + 1;
				else
					s_cnt1 <= "0000";
				end if;
			end if;
		end if;
	end process;
	
	s_tc1 <= '1' when s_cnt1 <= "0000" else
				'0';
	
	o_digit1 <= s_cnt1;
	
	
	
	o_digit2 <= "0001"; --1
	o_digit3 <= "1101"; --13
	
	
	
	
end architecture;
