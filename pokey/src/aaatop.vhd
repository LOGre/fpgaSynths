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
           W1a : out  STD_LOGIC_VECTOR (15 downto 0);
           W1b : out  STD_LOGIC_VECTOR (15 downto 0);
           W2C : inout  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
end aaatop;

architecture Behavioral of aaatop is

	-- serialctrl
	signal 		led              			: std_logic_vector(3 downto 0);	
	signal 		serdata              	: std_logic_vector(7 downto 0);
	signal 		buffer_data_present		: std_logic;
	signal 		read_buffer					: std_logic;
	signal 		data_ser              	: std_logic_vector(7 downto 0);
	signal 		latch_in	 					: std_logic;
	signal 		ready_out	 				: std_logic;
	
	-- pokeyctrl
	signal 		addr               		: std_logic_vector(3 downto 0);
	signal 		data               		: std_logic_vector(7 downto 0);
	signal 		rw_l          			   : std_logic;
	signal 		cs              			: std_logic;
	signal 		cs_l             			: std_logic;
	signal 		ena_pokey            	: std_logic;
	
	--
	-- Signals for PWM
	--	
	signal 		pwm_out : std_logic := '0';	
	
	-- signal for audio
	signal 		audio_out : std_logic_vector(7 downto 0) := (others => '0');
	signal 		vumeter : std_logic_vector(3 downto 0) := (others => '0');

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
	--W2C(4 downto 1) <= vumeter;
	--W2C(8 downto 5) <= addr(3 downto 0);
	W2C(7 downto 0) <= data;
	--W2C(6) <= ena_pokey;
	--W2C(7) <= audio_out(0);
	--W2C(8) <= rx;
	W2C(15 downto 8) <= (others => '0');
	tx <= '1';
	
	W1a(15) <= pwm_out;
	--W1a(15) <= '0';
	W1a(14) <= pwm_out;
	w1a(13 downto 0) <= (others => '0');
	w1b <= (others => '0');

	uart_rx0 : entity work.uart_rx Port map(
		serial_in 					=> rx,
		data_out 					=> serdata,
		read_buffer 				=> read_buffer,
		reset_buffer 				=> '0',
		en_16_x_baud 				=> en_16_x_baud,
		buffer_data_present 		=> buffer_data_present,
		buffer_full 				=> open,
		buffer_half_full 			=> open,
		clk						 	=> clk
	);
	
	serctrl0 : entity work.serctrl Port map(
		data_in 						=> serdata,
		buffer_data_present_in 	=> buffer_data_present,
		read_buffer_out 			=> read_buffer,
		dat_out 						=> data_ser,
		latch_out 					=> latch_in,
		ready_in 					=> ready_out,
		led_out 						=> led,
		clk 							=> clk
	);
	
	pokeyctrl0 : entity work.pokeyctrl Port map( 
		addr_out 					=> addr,
		data_out 					=> data,
		rw_l_out						=> rw_l,
		cs_out 						=> cs,
		cs_l_out						=> cs_l,
		enable_out 					=> ena_pokey,
		clk 							=> clock178Mhz,
		data_in 						=> data_ser,
		latch_in 					=> latch_in,
		ready_out 					=> ready_out
	);	

	POKEYinst : entity work.POKEY Port map(
		ADDR      					=> addr,
		DIN       					=> data,
		DOUT      					=> open,
		DOUT_OE_L 					=> open,
		RW_L      					=> rw_l,
		CS        					=> cs,
		CS_L      					=> cs_l,
		--
		AUDIO_OUT 					=> audio_out,
		--
		PIN       					=> (others => '0'), 
		ENA       					=> ena_pokey,
		CLK       					=> clock178Mhz
	);
	
	PWMinst: entity work.pwm Port map(
		input 						=> audio_out,
		output 						=> pwm_out,
		clk 							=> clk
	);	
	
  --
  -- Set baud rate to 115200 for the UART communications
  -- Requires en_16_x_baud to be 1843200Hz which is a single cycle pulse every 17 cycles at 32MHz 

  baud_timer: process(clk)
  begin
    if clk'event and clk='1' then
      if baud_count=16 then
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
  -- Means 32Mhz input clock divided by 

  clock178Mhz_timer: process(clk)
  begin
    if clk'event and clk='1' then
      if clock178Mhz_count=16 then
         clock178Mhz_count <= 0;
       else
         clock178Mhz_count <= clock178Mhz_count + 1;
      end if;
		
		if clock178Mhz_count > 8 then
			clock178Mhz <= '0';
		else
			clock178Mhz <= '1';
		end if;
    end if;
  end process clock178Mhz_timer;	

	--
	-- VU Meter
	--
	
	process(audio_out)
	begin
		if unsigned(audio_out) > x"70" then
			vumeter(0) <= '1';
		else
			vumeter(0) <= '0';
		end if;
		if unsigned(audio_out) > x"50" then
			vumeter(1) <= '1';
		else
			vumeter(1) <= '0';
		end if;
		if unsigned(audio_out) > x"30" then
			vumeter(2) <= '1';
		else
			vumeter(2) <= '0';
		end if;
		if unsigned(audio_out) > x"10" then
			vumeter(3) <= '1';
		else
			vumeter(3) <= '0';
		end if;
	end process;	

end Behavioral;
