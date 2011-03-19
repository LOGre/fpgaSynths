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
           W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
end aaatop;

architecture Behavioral of aaatop is

	-- signal reset 							: std_logic;
	signal 		led              			: std_logic_vector(3 downto 0);
	signal 		serdata              	: std_logic_vector(7 downto 0);
	signal 		buffer_data_present		: std_logic;
	signal 		read_buffer					: std_logic;
	signal 		data_in              	: std_logic_vector(7 downto 0);
	signal 		latch_in	 					: std_logic;
	-- signal reset_in	 					: std_logic;
	signal 		ready_out	 				: std_logic;
	signal 		addr               		: std_logic_vector(3 downto 0);
	signal 		data               		: std_logic_vector(7 downto 0);
	signal 		rw_l          			   : std_logic;
	signal 		cs              			: std_logic;
	signal 		cs_l             			: std_logic;
	signal 		ena_pokey            	: std_logic;
	
	-- signal for audio
	signal audio_out : std_logic_vector(7 downto 0) := (others => '0');

	--
	-- Signals for UART connections
	--
	signal      baud_count 					: integer range 0 to 26 :=0;
	signal     	en_16_x_baud 				: std_logic;

	--
	-- Signals for Poket 1.78Mhz clock
	--	
	signal		clock178Mhz_count 		: integer range 0 to 27 :=0;
	signal     	clock178Mhz 				: std_logic;


begin
	W2C(4 downto 1) <= led;
	W2C(5) <= ready_out;
	W2C(6) <= ena_pokey;
	W2C(0) <= audio_out(7);

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
		ENA       => ena_pokey,
		CLK       => clock178Mhz
	);
	
	pokeyctrl0 : entity work.pokeyctrl Port map( 
		addr_out => addr,
		data_out => data,
		rw_l_out	=> rw_l,
		cs_out => cs,
		cs_l_out	=> cs_l,
		enable_out => ena_pokey,
		clk => clock178Mhz,
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
		en_16_x_baud => en_16_x_baud,
		buffer_data_present => buffer_data_present,
		buffer_full => open,
		buffer_half_full => open,
		clk => clk
	);
	
  --
  -- Set baud rate to 115200 for the UART communications
  -- Requires en_16_x_baud to be 1843200Hz which is a single cycle pulse every 27 cycles at 50MHz 

  baud_timer: process(clk)
  begin
    if clk'event and clk='1' then
      if baud_count=26 then
         baud_count <= 0;
         en_16_x_baud <= '1';
       else
         baud_count <= baud_count + 1;
         en_16_x_baud <= '0';
      end if;
    end if;
  end process baud_timer;
	
  --
  -- Set clock to 1.78Mhz for Pokey
  -- Means 50Mhz input clock divided by 28

  clock178Mhz_timer: process(clk)
  begin
    if clk'event and clk='1' then
      if clock178Mhz_count=27 then
         clock178Mhz_count <= 0;
         clock178Mhz <= '1';
       else
         clock178Mhz_count <= clock178Mhz_count + 1;
         clock178Mhz <= '0';
      end if;
    end if;
  end process clock178Mhz_timer;	

end Behavioral;
