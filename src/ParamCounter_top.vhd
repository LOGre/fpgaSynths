----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:17:11 01/25/2011 
-- Design Name: 
-- Module Name:    YMDriver_top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity YMDriver_top is
	port(
		CLK_32MHZ 	: in std_logic;
--		clk 	: in std_logic;
--		audio : out std_logic_vector(7 downto 0)
		W2C : out std_logic_vector(7 downto 0)
	);
end YMDriver_top;

architecture Behavioral of YMDriver_top is

	COMPONENT clk2MHz
	PORT(
		CLKIN_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic
		);
	END COMPONENT;

	component pwm is
	generic(
		NB_BITS : integer := 8
	);
		Port (
			input : in  STD_LOGIC_VECTOR (NB_BITS-1 downto 0);
			output : out  STD_LOGIC;
			clk : in  STD_LOGIC
		);
	end component;

	component DataPath
	generic(
		cycles_size : positive := 7 --default 7
		);
	port(
		clk						: in std_logic;
		reset 					: in std_logic;
		enable 					: in std_logic;
		cycles					: in std_logic_vector(cycles_size downto 0);
		done						: out std_logic;
		
		int_ym_reset			: in std_logic;
		int_ym_bdir				: in std_logic;
		int_ym_bc1				: in std_logic;
		int_ym_bc2				: in std_logic;
		int_ym_da_in 			: in std_logic_vector(7 downto 0);
		int_ym_store			: in std_logic;
	
		ym_reset					: out std_logic;
		ym_bdir					: out std_logic;
		ym_bc1					: out std_logic;
		ym_bc2					: out std_logic;
		ym_da_in 				: out std_logic_vector(7 downto 0)
		
		);
	end component;
	
	component FSM_YM_Controller
	generic(
		cycles_size : positive := 7 --default 7
		);
		port(
			clk					: in std_logic;
			reset 				: in std_logic;
			delay_out			: out std_logic_vector(cycles_size downto 0);
			delay_in				: in std_logic;
			delay_en				: out std_logic;
			
		   int_ym_reset		: out std_logic;
			int_ym_bdir			: out std_logic;
			int_ym_bc1			: out std_logic;
			int_ym_bc2			: out std_logic;
			int_ym_da_in 		: out std_logic_vector(7 downto 0);
			int_ym_store		: out std_logic
		);
	end component;	
	
	component YM2149 is
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
	end component;

	signal clk 					: std_logic;
	signal reset				: std_logic;
	signal enable				: std_logic;
	signal cycles				: std_logic_vector(7 downto 0);
	signal ym_to_counter 	: std_logic;
	
	-- signaux DataPath
	signal int_ym_bdir		: std_logic;
	signal int_ym_bc1			: std_logic;
	signal int_ym_bc2			: std_logic;
	signal int_ym_da_in		: std_logic_vector(7 downto 0);
	signal int_ym_store		: std_logic;
	signal int_ym_reset		: std_logic;
	
	signal delay_en			: std_logic;
	
	-- signaux YM
	signal ym_audio			: std_logic_vector(7 downto 0);
	signal ym_reset			: std_logic;
	signal ym_bdir				: std_logic;
	signal ym_bc1				: std_logic;
	signal ym_bc2				: std_logic;
	signal ym_da_in 			: std_logic_vector(7 downto 0);	
	
	signal clk8					: std_logic;
	signal clk2					: std_logic;
	
	signal counter2			: integer;
	
	signal reset_state : integer := 0;
	signal audio0 : std_logic;
begin

--	clk <= CLK_32MHZ;
	clk <= clk8;
	W2C <= audio0 & ym_audio(6 downto 0);

	process(clk, reset)
--		variable reset_state : natural := 0;
	begin
		if rising_edge(clk) then
			if reset_state < 2 then
				reset <= '1';
--				reset_state := reset_state + 1;
				reset_state <= reset_state + 1;
				enable <= '0';
			else
				reset <= '0';
				enable <= '1';
			end if;
		end if;
	end process;
	
	-- generate 2MHz clock from 8 MHz
	process(clk8, reset)
	begin
		if reset = '1' then
			counter2 <= 0;
			clk2 <= '0';
		elsif rising_edge(clk8) then
			if counter2 = 1 then
				counter2 <= 0;
				clk2 <= not clk2;
			else
				counter2 <= counter2 + 1;
			end if;
		end if;
	end process;	

	DataPath_instance : DataPath
		generic map (
			cycles_size => 7
		)
		port map (
			clk 					=> clk,
			reset 				=> reset,
			enable 				=> delay_en,
			cycles 				=> cycles,
			done					=> ym_to_counter,
			
		   int_ym_reset		=> int_ym_reset,
			int_ym_bdir			=> int_ym_bdir,
			int_ym_bc1			=> int_ym_bc1,
			int_ym_bc2			=> int_ym_bc2,
			int_ym_da_in 		=> int_ym_da_in,
			int_ym_store		=> int_ym_store,
			
			ym_reset				=>	ym_reset,
			ym_bdir				=>	ym_bdir,	
			ym_bc1				=>	ym_bc1,	
			ym_bc2				=>	ym_bc2,	
			ym_da_in 			=>	ym_da_in
		);	
		
	FSM_YM_Controller_instance : FSM_YM_Controller
		port map (
			clk 					=> clk,
			reset 				=> reset,
			delay_out			=> cycles,
			delay_in				=> ym_to_counter,
			delay_en				=> delay_en,
			
		   int_ym_reset		=> int_ym_reset,
			int_ym_bdir			=> int_ym_bdir,
			int_ym_bc1			=> int_ym_bc1,
			int_ym_bc2			=> int_ym_bc2,
			int_ym_da_in 		=> int_ym_da_in,
			int_ym_store		=> int_ym_store	
		);			
		
	pwm_instance : pwm
		generic map (
			NB_BITS => 8
		)
		port map (
			input 				=> ym_audio,
			output 				=> audio0,
			clk 					=> clk
		);	

	YM2149_instance : YM2149
		port map (
		  -- data bus
		  I_DA               => ym_da_in,
		  O_DA               => open,
		  O_DA_OE_L          => open,
		  -- control
		  I_A9_L             => '0',
		  I_A8               => '1',
		  I_BDIR             => ym_bdir,
		  I_BC2              => ym_bc2,
		  I_BC1              => ym_bc1,
		  I_SEL_L            => '1',

		  O_AUDIO            => ym_audio,
		  -- port a
		  I_IOA              => (others=>'0'),
		  O_IOA              => open,
		  O_IOA_OE_L         => open,
		  -- port b
		  I_IOB              => (others=>'0'),
		  O_IOB              => open,
		  O_IOB_OE_L         => open,

		  ENA                => '1',
		  RESET_L            => ym_reset,
		  CLK                => clk2		
		);
		
	Inst_clk2MHz: clk2MHz PORT MAP(
--		CLKIN_IN => clk,
		CLKIN_IN => CLK_32MHZ,
		CLKFX_OUT => clk8,
		CLKIN_IBUFG_OUT => open,
		CLK0_OUT => open
	);
		
		
end Behavioral;

