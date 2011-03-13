----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:07:25 02/19/2011 
-- Design Name: 
-- Module Name:    pokeyctrl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pokeyctrl is
Port ( 
	-- YM in signals
   addr_out 	: out  STD_LOGIC_VECTOR (3 downto 0); 
	data_out 	: out  STD_LOGIC_VECTOR (7 downto 0);
 	rw_l_out		: out STD_LOGIC;
 	cs_out		: out STD_LOGIC;
 	cs_l_out		: out STD_LOGIC;
 	enable_out  : out STD_LOGIC;
	
	-- clk
	clk 			: in  STD_LOGIC	-- should be 1.77MHz
			
	-- input signals	
	data_in 		: in  STD_LOGIC_VECTOR (7 downto 0);
	latch_in 	: in  STD_LOGIC;
	reset_in 	: in  STD_LOGIC;
	ready_out 	: out  STD_LOGIC;
	);
end pokeyctrl ;

architecture Behavioral of pokeyctrl is

	constant CNTLEN : integer := 3;
	
	-- 1 cycle@1.77 Mhz => 565ns
	constant TRWS : integer := 1; -- min 130 ns
	constant TRWH : integer := 1; -- min 30 ns
	constant TADS : integer := 1; -- min 130 ns
	constant TADH : integer := 1; -- min 30 ns
	constant TCSS : integer := 1; -- min 50 ns
	constant TCSH : integer := 1; -- min 30 ns
	constant TDSW : integer := 1; -- min 130 ns
	constant TDHW : integer := 1; -- min 10 ns
	constant TDS  : integer := 1; -- min 150 ns
	
	type s_t is
	(
		s_reset,s_raddr,s_saddr
		,s_saddr2
		,s_rdata,s_sdata
		,s_sdata2
	);
	
	signal stP,stN : s_t := s_reset;
	signal bdirP,bdirN : std_logic := '0';
	signal bc1P,bc1N : std_logic := '0';
	signal resetP,resetN : std_logic := '1';
	signal readyP,readyN : std_logic := '0';
	signal daP,daN : std_logic_vector(7 downto 0) := (others => '0');
	signal cnt : unsigned(CNTLEN-1 downto 0) := to_unsigned(0,CNTLEN);
	
begin
	ready_out <= readyP;
	reset_out <= resetP;
	bdir_out <= bdirP;
	bc1_out <= bc1P;
	da_out <= daP;

	process (stP,latch_in,reset_in,data_in,cnt,readyP,resetP,bdirP,bc1P,daP)
	begin
		resetN <= resetP;
		readyN <= readyP;
		bdirN <= bdirP;
		bc1N <= bc1P;
		daN <= daP;
		stN <= stP;
		case stP is
			when s_reset =>
				if cnt=TRW+TRB then
					stN <= s_raddr;
					resetN <= '1';
					readyN <= '0';
				elsif cnt=TRW then
					stN <= s_reset;
					resetN <= '1';
					readyN <= '0';
				else
					bdirN <= '0';
					bc1N <= '0';
					stN <= s_reset;
					resetN <= '0';
					readyN <= '0';
				end if;
			when s_raddr =>
				if reset_in='1' then
					stN <= s_reset;
					readyN <= '0';
				else
					if latch_in='0' then
						stN <= s_raddr;
						daN <= (others => '0');
						readyN <= '1';
					else
						stN <= s_saddr;
						daN <= data_in;
						bdirN <= '1';
						bc1N <= '1';
						readyN <= '0';
					end if;
				end if;
			when s_saddr =>
				if cnt=TAS then
					stN <= s_saddr2;
					bdirN <= '0';
					bc1N <= '0';
					readyN <= '1';
				else
					stN <= s_saddr;
					readyN <= '0';
				end if;
			when s_saddr2 =>
				if cnt=TAS+TAH then
					stN <= s_rdata;
					readyN <= '1';
				else
					stN <= s_saddr2;
					readyN <= '1';
				end if;
			when s_rdata =>
				if latch_in='0' then
					stN <= s_rdata;
					readyN <= '1';
				else
					stN <= s_sdata;
					bdirN <= '1';
					bc1N <= '0';
					daN <= data_in;
					readyN <= '0';
				end if;
			when s_sdata =>
				if cnt=TDW then
					stN <= s_sdata2;
					bdirN <= '0';
					bc1N <= '0';
					readyN <= '1';
				else
					stN <= s_sdata;
					readyN <= '0';
				end if;
			when s_sdata2 =>
				if cnt=TDW+TDH then
					stN <= s_raddr;
					readyN <= '1';
				else
					stN <= s_sdata2;
					readyN <= '1';
				end if;
		end case;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			case stN is
				when s_reset =>
					if cnt=TRW+TRB then
						cnt <= (others => '0');
					elsif clk_enable='1' then
						cnt <= cnt + 1;
					end if;
				when s_raddr =>
					cnt <= (others => '0');
				when s_saddr =>
					if cnt=TAS then
						cnt <= (others => '0');
					else
						cnt <= cnt + 1;
					end if;
				when s_saddr2 =>
					if cnt=TAH then
						cnt <= (others => '0');
					else
						cnt <= cnt + 1;
					end if;
				when s_rdata =>
					cnt <= (others => '0');
				when s_sdata =>
					if cnt=TDW then
						cnt <= (others => '0');
					else
						cnt <= cnt + 1;
					end if;
				when s_sdata2 =>
					if cnt=TDH then
						cnt <= (others => '0');
					else
						cnt <= cnt + 1;
					end if;
			end case;
		end if;
	end process;
	
	process (clk)
	begin
		if rising_edge( clk) then
			resetP <= resetN;
			readyP <= readyN;
			bdirP <= bdirN;
			bc1P <= bc1N;
			daP <= daN;
			stP <= stN;
		end if;
	end process;
end Behavioral;
