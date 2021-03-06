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
	clk 			: in  STD_LOGIC;	-- should be 1.77MHz
			
	-- input signals	
	data_in 		: in  STD_LOGIC_VECTOR (7 downto 0);
	latch_in 	: in  STD_LOGIC;
	ready_out 	: out  STD_LOGIC
	);
end pokeyctrl ;

architecture Behavioral of pokeyctrl is

	constant CNTLEN : integer := 1;
	
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
		s_waitaddr, 
		s_setaddr,
		s_waitdata,
		s_setdata,
		s_write
	);
	
	-- ctrl signals
	signal stP,stN 		: s_t := s_waitaddr;
	signal readyP,readyN : std_logic := '0';
	signal cnt : unsigned(CNTLEN-1 downto 0) := to_unsigned(0,CNTLEN);
	
	-- Pokey signals
	signal csP,csN 		: std_logic := '0';
	signal cslP,cslN 		: std_logic := '1';	
	signal enaP,enaN 		: std_logic := '0';	
	signal rwlP,rwlN		: std_logic := '0';
	signal daP,daN 		: std_logic_vector(7 downto 0) := (others => '0');	
	signal addrP,addrN 	: std_logic_vector(3 downto 0) := (others => '0');	

begin
	ready_out 	<= readyP;
	cs_out 		<= csP;
	cs_l_out 	<= cslP;
	rw_l_out 	<= rwlP;
	enable_out	<= enaP;
	data_out 	<= daP;
	addr_out		<= addrP;

	process (stP,latch_in,data_in,cnt,readyP,csP,cslP,rwlP,enaP,daP,addrP)
	begin
		readyN 	<= readyP;
		csN 		<= csP;
		cslN 		<= cslP;
		rwlN 		<= rwlP;
		daN 		<= daP;
		addrN		<=	addrP;
		enaN		<=	enaP;
		stN 		<= stP;
		case stP is
			when s_waitaddr =>
				enaN <= '1';
				rwlN <= '0';
				cslN <= '1';
				csN <= '0';
				--addrN <= x"0";
				--daN <= x"ff";
				readyN <= '1';
				if latch_in='1' then
					addrN <= data_in(3 downto 0);
					stN <= s_setaddr;
					readyN <= '0';
				end if;
			when s_setaddr =>
				if latch_in='0' then
					stN <= s_waitdata;
					readyN <= '1';
				end if;
			when s_waitdata =>
				if latch_in='1' then
					daN <= data_in;
					stN <= s_setdata;
					readyN <= '0';
				end if;
			when s_setdata =>
				if latch_in='0' then
					cslN <= '0';
					csN <= '1';
					stN <= s_write;
				end if;
			when s_write =>
				if cnt=TDHW then
					cslN <= '1';
					csN <= '0';
					stN <= s_waitaddr;
				end if;
		end case;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			cnt <= (others => '0');
			case stN is
				when s_waitaddr =>
				when s_setaddr =>
				when s_waitdata =>
				when s_setdata =>
				when s_write =>
					if cnt=TDHW then
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
			readyP 	<= readyN;
			csP 		<= csN;
			cslP 		<= cslN;
			rwlP 		<= rwlN;
			enaP		<= enaN;
			addrP		<= addrN;
			daP 		<= daN;
			stP 		<= stN;
		end if;
	end process;
end Behavioral;
