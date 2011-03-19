----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:43:14 02/25/2011 
-- Design Name: 
-- Module Name:    serctrl - Behavioral 
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
entity serctrl is
Port (
	data_in : in  STD_LOGIC_VECTOR (7 downto 0);
	buffer_data_present_in : in std_logic;
	read_buffer_out : out std_logic;
--	reset_in : in  STD_LOGIC;
	
	dat_out : out  STD_LOGIC_VECTOR (7 downto 0);
	latch_out : out  STD_LOGIC;
	ready_in : in  STD_LOGIC;
--	reset_out : out  STD_LOGIC;
	led_out : out std_logic_vector(3 downto 0);

	clk : in  STD_LOGIC
);
end serctrl;


----this arch waits receiver is ready before reading incoming bytes (eg: ready_in=1)
architecture Behavioral of serctrl is
type st_t is (s_wait,s_read,s_write
--,s_skip
);
signal stP,stN : st_t := s_wait;
signal read_bufferP,read_bufferN : std_logic := '0';
signal datP,datN : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal latchP,latchN : std_logic := '0';
signal ledP,ledN : std_logic_vector(3 downto 0) := (others => '0');
signal cntP,cntN : unsigned(3 downto 0) := to_unsigned(0,4);
begin
	read_buffer_out <= read_bufferP;
--	reset_out <= reset_in;
	dat_out <= datP;
	latch_out <= latchP;
	led_out <= ledP;
--	led_out <= std_logic_vector(cnt);

	process(
	cntP,
	data_in,ledP,buffer_data_present_in,ready_in,stP,latchP,datP,read_bufferP)
	begin
		read_bufferN <= read_bufferP;
		datN <= datP;
		latchN <= latchP;
		stN <= stP;
		ledN <= ledP;
		cntN <= cntP;
		case stP is
			when s_wait =>
				read_bufferN <= '0';
				datN <= (others => '0');
				latchN <= '0';
				if buffer_data_present_in='1' then
					stN <= s_read;
					cntN <= cntP+1;
					datN <= data_in;
					read_bufferN <= '1';
				end if;
			when s_read =>
				read_bufferN <= '0';
				if ready_in='1' then
					latchN <= '1';
					stN <= s_write;
				end if;
			when s_write =>
				read_bufferN <= '0';
				if ready_in='1' then
--					latchN <= '1';
				else
					latchN <= '0';
					stN <= s_wait;
				end if;
--			when s_skip =>
--				read_bufferN <= '1';
--				stN <= s_wait;
		end case;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			read_bufferP <= read_bufferN;
			datP <= datN;
			latchP <= latchN;
			stP <= stN;
			ledP <= ledN;
			cntP <= cntN;
		end if;
	end process;

end Behavioral;
