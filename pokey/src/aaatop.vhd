----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:45:19 12/19/2010 
-- Design Name: 
-- Module Name:    aaatop - Behavioral 
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
entity aaatop is
    Port ( rx : in  STD_LOGIC;
           tx : inout  STD_LOGIC;
           W1A : inout  STD_LOGIC_VECTOR (15 downto 0);
           W1B : inout  STD_LOGIC_VECTOR (15 downto 0);
           W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
end aaatop;

architecture Behavioral of aaatop is
-- signal reset 					: std_logic;
 signal led               : std_logic_vector(3 downto 0);
 signal serdata               : std_logic_vector(7 downto 0);
 signal buffer_data_present	: std_logic;
 signal read_buffer				: std_logic;
 signal data_in               : std_logic_vector(7 downto 0);
 signal latch_in	 			: std_logic;
-- signal reset_in	 			: std_logic;
 signal ready_out	 			: std_logic;
 signal addr               : std_logic_vector(3 downto 0);
 signal data               : std_logic_vector(7 downto 0);
 signal rw_l               : std_logic;
 signal cs               : std_logic;
 signal cs_l              : std_logic;
 signal ena_1_5M             : std_logic;
 signal audio_out : std_logic_vector(7 downto 0) := (others => '0');
	signal cnt32 : unsigned(3 downto 0) := "0000";
	signal ena32_2 : std_logic := '1';
	signal ena32_4 : std_logic := '1';
	signal ena32_8 : std_logic := '1';
	signal ena32_16 : std_logic := '1';
begin
	w2c(7 downto 0) <= data;
	w2c(11 downto 8) <= addr;
	w2c(15 downto 12) <= led;
	
	w1b(0) <= ready_out;
	w1b(1) <= ena_1_5M;
	w1b(4 downto 2) <= cs_l & cs & rw_l;
	
	w1a(7 downto 0) <= audio_out;

	ena32_2 <= cnt32(3);
	ena32_4 <= cnt32(2);
	ena32_8 <= cnt32(1);
	ena32_16 <= cnt32(0);
	pena32_4 : process( clk)
	begin
		if rising_edge( clk) then
			cnt32 <= cnt32 + 1;
		end if;
	end process;

	POKEYinst : entity work.POKEY Port map(
		ADDR      => addr,
		DIN       => data,
		DOUT      => open,
		DOUT_OE_L => open,
		RW_L      => rw_l,
		CS        => cs,
		CS_L      => cs_l,
		--
		AUDIO_OUT => audio_out,
		--
		PIN       => (others => '0'), 
		ENA       => ena_1_5M,	
--		CLK       => ena32_2
		CLK       => clk
	);
	
	pokeyctrl0 : entity work.pokeyctrl Port map( 
		-- YM in signals
		addr_out => addr,
		data_out => data,
		rw_l_out	=> rw_l,
		cs_out => cs,
		cs_l_out	=> cs_l,
		enable_out => ena_1_5M,
--		clk => ena32_2,
		clk => clk,
		data_in => data_in,
		latch_in => latch_in,
--		reset_in => reset_in,
		ready_out => ready_out
	);
	serctrl0 : entity work.serctrl Port map(
		data_in => serdata,
		buffer_data_present_in => buffer_data_present,
		read_buffer_out => read_buffer,
--		reset_in => reset,
		dat_out => data_in,
		latch_out => latch_in,
		ready_in => ready_out,
--		reset_out => reset_in,
		led_out => led,
		clk => clk
	);
	uart_rx0 : entity work.uart_rx Port map(
		serial_in => rx,
		data_out => serdata,
		read_buffer => read_buffer,
		reset_buffer => '0',
		en_16_x_baud => '1',
		buffer_data_present => buffer_data_present,
		buffer_full => open,
		buffer_half_full => open,
		clk => clk
	);

end Behavioral;
