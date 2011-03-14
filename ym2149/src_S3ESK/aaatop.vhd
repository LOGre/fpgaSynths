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
Port ( 
		rx 						: in  STD_LOGIC;
      tx 						: inout  STD_LOGIC;
      W1A 						: out  STD_LOGIC_VECTOR (15 downto 0);
      W1B 						: in  STD_LOGIC_VECTOR (15 downto 0);
      W2C 						: inout  STD_LOGIC_VECTOR (15 downto 0);
      clk 						: in  STD_LOGIC);
end aaatop;

architecture Behavioral of aaatop is

component YM2149
port (
		-- data bus
		I_DA                : in  std_logic_vector(7 downto 0);
		O_DA                : out std_logic_vector(7 downto 0);
		O_DA_OE_L           : out std_logic;
		-- control
		I_A9_L              : in  std_logic;
		I_A8                : in  std_logic;
		I_BDIR              : in  std_logic;
		I_BC2               : in  std_logic;
		I_BC1               : in  std_logic;
		I_SEL_L             : in  std_logic;

		O_AUDIO             : out std_logic_vector(7 downto 0);
		-- port a
		I_IOA               : in  std_logic_vector(7 downto 0);
		O_IOA               : out std_logic_vector(7 downto 0);
		O_IOA_OE_L          : out std_logic;
		-- port b
		I_IOB               : in  std_logic_vector(7 downto 0);
		O_IOB               : out std_logic_vector(7 downto 0);
		O_IOB_OE_L          : out std_logic;

		ENA                 : in  std_logic; -- clock enable for higher speed operation
		RESET_L             : in  std_logic;
		CLK                 : in  std_logic  -- note 6 Mhz
  );
end component YM2149;

component wingbutled
Port (
		io 							: inout  STD_LOGIC_VECTOR (7 downto 0);
		buttons 						: out  STD_LOGIC_VECTOR (3 downto 0);
		leds 							: in  STD_LOGIC_VECTOR (3 downto 0)
);
end component wingbutled;

component ymctrl
Port (
		data_in 						: in  STD_LOGIC_VECTOR (7 downto 0);
		latch_in 					: in  STD_LOGIC;
		reset_in 					: in  STD_LOGIC;
		ready_out 					: out  STD_LOGIC;
		da_out 						: out  STD_LOGIC_VECTOR (7 downto 0);
		bdir_out 					: out  STD_LOGIC;
		bc1_out 						: out  STD_LOGIC;
		reset_out 					: out  STD_LOGIC;

		clk_enable 					: in std_logic;		-- should be 4MHz
		clk 							: in  STD_LOGIC
);
end component ymctrl;

component serctrl
Port (
		data_in 						: in  STD_LOGIC_VECTOR (7 downto 0);
		buffer_data_present_in 	: in std_logic;
		read_buffer_out 			: out std_logic;
		reset_in 					: in  STD_LOGIC;

		dat_out 						: out  STD_LOGIC_VECTOR (7 downto 0);
		latch_out 					: out  STD_LOGIC;
		ready_in 					: in  STD_LOGIC;
		reset_out 					: out  STD_LOGIC;
		led_out 						: out std_logic_vector(3 downto 0);
		clk 							: in  STD_LOGIC
	);
end component serctrl;

component butctrl
Port (
		but_in 						: in  STD_LOGIC_VECTOR (3 downto 0);
		data_out 					: out std_logic_vector(7 downto 0);
		read_buffer 				: in std_logic;
		buffer_data_present 		: out std_logic;
		clk 							: in  STD_LOGIC
);
end component butctrl;

component uart_rx
Port (            
		serial_in 					: in std_logic;
		data_out 					: out std_logic_vector(7 downto 0);
		read_buffer 				: in std_logic;
		reset_buffer 				: in std_logic;
		en_16_x_baud 				: in std_logic;
		buffer_data_present 		: out std_logic;
		buffer_full 				: out std_logic;
		buffer_half_full 			: out std_logic;
		clk 							: in std_logic
);
end component uart_rx;

component pwm
Port (
		input 						: in  STD_LOGIC_VECTOR (7 downto 0);
		output 						: out STD_LOGIC;
		clk 							: in  STD_LOGIC
);
end component pwm;

	
	--
	-- Signals for YM2149
	--
	signal bdir : std_logic := '0';
	signal bc1 : std_logic := '0';
	signal reset_ym_loc,reset_ym_serctrl,reset_ym_ymctrl : std_logic := '0';
	signal da : std_logic_vector(7 downto 0) := (others => '0');
	signal audio : std_logic_vector(7 downto 0);
	signal ready : std_logic;
	signal latch : std_logic;
	signal data : std_logic_vector(7 downto 0) := (others => '0');

	signal dat : std_logic_vector(7 downto 0) := (others => '0');
	signal buffer_data_present : std_logic := '0';
	signal read_buffer : std_logic := '0';

	signal buthi,butlo : std_logic_vector(3 downto 0) := (others => '0');
	signal ledhi,ledlo : std_logic_vector(3 downto 0) := (others => '0');
	signal buffer_half_full : std_logic;
	signal buffer_full : std_logic;
	
	--
	-- Signals for PWL
	--	
	signal pwm_out : std_logic := '0';
	
	--
	-- Signals for UART connections
	--
	signal      baud_count : integer range 0 to 26 :=0;
	signal     	en_16_x_baud : std_logic;
	
	--
	-- Signals for yM Clock diviser
	--	
	signal		clock2Mhz_count : integer range 0 to 24 :=0;
	signal     	clock2Mhz : std_logic;

	
begin
	w2c(0) <= pwm_out;
	w1a(15) <= pwm_out;
	w1a(14) <= pwm_out;
	w1a(13 downto 0) <= (others => '0');

	wingbutled0 : wingbutled Port map (
		io => w2c(15 downto 8),
		buttons => buthi,
		leds => ledhi
	);

	reset_ym_loc <= buthi(3);

	pwm0: pwm Port map (
		input => audio,
		output => pwm_out,
		clk => clk
	);

	YM2149inst : YM2149 Port map(
		I_DA => da,
		O_DA => open,
		O_DA_OE_L => open,
		-- control
		I_A9_L => '0',
		I_A8 => '1',
		I_BDIR => bdir,
		I_BC2 => '1',
		I_BC1 => bc1,
		I_SEL_L => '1',		-- don't divide the clock / 2
		O_AUDIO => audio,
		-- port a
		I_IOA => (others => '0'),
		O_IOA => open,
		O_IOA_OE_L => open,
		-- port b
		I_IOB => (others => '0'),
		O_IOB => open,
		O_IOB_OE_L => open,
		ENA => '1',
		RESET_L => reset_ym_ymctrl,
		CLK => clock2Mhz
	);

ymctrl0 : ymctrl 
Port map
(
	data_in => dat,
	latch_in => latch,
	reset_in => reset_ym_serctrl,
	ready_out => ready,
	da_out => da,
	bdir_out => bdir,
	bc1_out => bc1,
	reset_out => reset_ym_ymctrl,
	clk_enable => '1',
	clk => clock2Mhz
);

serctrl0 : serctrl   
Port map
(
	data_in => data,
	buffer_data_present_in => buffer_data_present,
	read_buffer_out => read_buffer,
	reset_in => reset_ym_loc,
	
	dat_out => dat,
	latch_out => latch,
	ready_in => ready,
	reset_out => reset_ym_serctrl,
	led_out => ledlo,

	clk => clk
);

	process(audio)
	begin
		if unsigned(audio) > x"70" then
			ledhi(0) <= '1';
		else
			ledhi(0) <= '0';
		end if;
		if unsigned(audio) > x"50" then
			ledhi(1) <= '1';
		else
			ledhi(1) <= '0';
		end if;
		if unsigned(audio) > x"30" then
			ledhi(2) <= '1';
		else
			ledhi(2) <= '0';
		end if;
		if unsigned(audio) > x"10" then
			ledhi(3) <= '1';
		else
			ledhi(3) <= '0';
		end if;
	end process;
	
	--
	-- Uart to receive data
	--
	
	uart_rx0 : uart_rx    
	Port map(
		serial_in => rx,
		data_out => data,
		read_buffer => read_buffer,
		reset_buffer => '0',
		en_16_x_baud => en_16_x_baud,
		buffer_data_present => buffer_data_present,
		buffer_full => buffer_full,
		buffer_half_full => buffer_half_full,
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
  -- Set clock to 2Mhz for YM
  -- Means 50Mhz input clock divided by 25

  clock2Mhz_timer: process(clk)
  begin
    if clk'event and clk='1' then
      if clock2Mhz_count=24 then
         clock2Mhz_count <= 0;
         clock2Mhz <= '1';
       else
         clock2Mhz_count <= clock2Mhz_count + 1;
         clock2Mhz <= '0';
      end if;
    end if;
  end process clock2Mhz_timer;

end Behavioral;
