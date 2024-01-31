
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Libraries.

entity lprs1_homework3 is
	port(
		i_clk            :  in std_logic;
		i_rst            :  in std_logic;
		i_base           :  in std_logic_vector(1 downto 0);
		i_sequence       :  in std_logic_vector(63 downto 0);
		i_load_sequence  :  in std_logic;
		i_base_src_sel   :  in std_logic;
		i_cnt_subseq_sel :  in std_logic_vector(1 downto 0);
		o_cnt_subseq     : out std_logic_vector(3 downto 0)
	);
end entity;


architecture arch of lprs1_homework3 is
	-- Constants.
	constant A : std_logic_vector(1 downto 0) := "00";
	constant C : std_logic_vector(1 downto 0) := "01";
	constant G : std_logic_vector(1 downto 0) := "10";
	constant T : std_logic_vector(1 downto 0) := "11";
	
	-- Signals.
	type t_state is (IDLE,G0S0,G0T0,G0TA,G0TC,G0C0,G0CT);
	signal s_state, s_next_state: t_state;
	signal s_en_subseq0 : std_logic;
	signal s_en_subseq1 : std_logic;
	signal s_en_subseq2 : std_logic;
	signal s_cnt_subseq0 : std_logic_vector(3 downto 0); --5
	signal s_cnt_subseq1: std_logic_vector(3 downto 0); --5
	signal s_cnt_subseq2: std_logic_vector(3 downto 0); --5
	signal s_base: std_logic_vector(1 downto 0);
	signal s_cnt_subseq : std_logic_vector(3 downto 0);
	signal s_sh_base: std_logic_vector(1 downto 0);
	signal s_sh_reg: std_logic_vector(63 downto 0);
	signal s_reg: std_logic_vector(63 downto 0);
	
begin
	-- Body.
	
	--registar za pamcenje stanja
	process(i_clk,i_rst) begin 
		if(i_clk 'event and i_clk = '0') then 
			if(i_rst = '1') then
				s_state <= IDLE;
			else 
				s_state <= s_next_state;
			end if;
		end if;
	end process;
	
	--state
	process(s_state,s_base) begin
		case(s_state) is
		when IDLE =>
			if(s_base = G) then
				s_next_state <= G0S0; 
			else 
				s_next_state <= IDLE;
			end if;
		when G0S0 =>
			if(s_base = T) then
				s_next_state <= G0T0; 
			elsif(s_base = C) then 
				s_next_state <= G0C0;
			else
				s_next_state <= IDLE;
			end if;
		when G0T0 =>
			if(s_base = A) then
				s_next_state <= G0TA; 
			elsif(s_base = C) then
				s_next_state <= G0TC;
			elsif(s_base = G) then
				s_next_state <= G0T0;
			else
				s_next_state <= IDLE;
			end if;
		when G0TA =>
				s_next_state <= IDLE;
		when G0TC =>
				s_next_state <= IDLE;
		when G0C0 =>
			if(s_base = T) then
				s_next_state <= G0CT;
			else 
				s_next_state <= IDLE;
			end if;
		when G0CT =>
				s_next_state <= IDLE;
		when others =>
			s_next_state <= IDLE;
		end case;
	end process;
	--dozvole brojaca
	s_en_subseq0 <= '1' when s_state = G0TA else
						 '0';
	s_en_subseq1 <= '1' when s_state = G0TC else
						 '0';
	s_en_subseq2 <= '1' when s_state = G0CT else
						 '0';
	
	-- brojac 0. podsekvence po modulu 6
	process(i_clk,i_rst) begin 
		if(i_clk 'event and i_clk = '0') then
			if(i_rst = '1') then
				s_cnt_subseq0 <= "0000";
			else
				if(s_en_subseq0 = '1') then
					if(s_cnt_subseq0 = 5) then
						s_cnt_subseq0 <= "0000";
					else
						s_cnt_subseq0 <= s_cnt_subseq0 + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	--brojac 1. podsekvence po modulu 6
		process(i_clk,i_rst) begin
		if(i_clk 'event and i_clk = '0') then
			if(i_rst = '1') then
				s_cnt_subseq1 <= "0000";
			else
				if(s_en_subseq1 = '1') then 
					if(s_cnt_subseq1 = 5) then
						s_cnt_subseq1 <= "0000";
					else
						s_cnt_subseq1 <= s_cnt_subseq1 + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	--brojac 2. podsekvence po modulu 6
	process(i_clk,i_rst) begin
		if(i_clk 'event and i_clk = '0') then
			if(i_rst = '1') then
				s_cnt_subseq2 <= "0000";
			else
				if(s_en_subseq2 = '1') then
					if(s_cnt_subseq2 = 5) then 
						s_cnt_subseq2 <= "0000";
					else
						s_cnt_subseq2 <= s_cnt_subseq2 + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	
	--multiplekser
	process (i_cnt_subseq_sel,s_cnt_subseq0,s_cnt_subseq1,s_cnt_subseq2) begin
		case(i_cnt_subseq_sel) is
			when "00" =>
				s_cnt_subseq <= s_cnt_subseq0;
			when "01" => 
				s_cnt_subseq <= s_cnt_subseq1;
			when "10" =>
				s_cnt_subseq <= s_cnt_subseq2;
			when others => 
				s_cnt_subseq <= (others => '0');
		end case;
	end process;
	
	o_cnt_subseq <= s_cnt_subseq;
	
	--multiplekser
	s_base <= i_base when i_base_src_sel = '0' else
				s_sh_base;
				
	
	--sifter
	
	s_reg <= i_sequence when i_load_sequence = '1' else "00" & s_sh_reg(63 downto 2);
	process(i_clk,i_rst) begin
		if(i_rst = '1') then 
			s_sh_reg <= (others => '0');
		elsif(i_clk 'event and i_clk = '0') then
		s_sh_reg <= s_reg;
		end if;
	end process;
	s_sh_base <= s_sh_reg(1 downto 0);
					 
	
	
end architecture;
