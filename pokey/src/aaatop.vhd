----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:26 03/12/2011 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aaatop is
    Port ( rx : in  STD_LOGIC;
           tx : inout  STD_LOGIC;
           W1A : inout  STD_LOGIC_VECTOR (15 downto 0);
           W1B : in  STD_LOGIC_VECTOR (15 downto 0);
           W2C : out  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC);
end aaatop;

architecture Behavioral of aaatop is

component POKEY
  port 
  (
  ADDR      : in  std_logic_vector(3 downto 0);
  DIN       : in  std_logic_vector(7 downto 0);
  DOUT      : out std_logic_vector(7 downto 0);
  DOUT_OE_L : out std_logic;
  RW_L      : in  std_logic;
  CS        : in  std_logic; -- used as enable
  CS_L      : in  std_logic;
  --
  AUDIO_OUT : out std_logic_vector(7 downto 0);
  --
  PIN       : in  std_logic_vector(7 downto 0);
  ENA       : in  std_logic;
  CLK       : in  std_logic  -- note 6 Mhz  
  );
end component POKEY;

 signal c_addr               : std_logic_vector(23 downto 0);
 signal c_dout               : std_logic_vector(7 downto 0);
 signal pokey_dout           : std_logic_vector(7 downto 0);
 signal c_rw_l               : std_logic;
 signal pkydcd               : std_logic;
 signal dips_r8_l            : std_logic_vector(7 downto 0);
 signal ena_1_5M             : std_ulogic;
 
begin

POKEYinst : POKEY Port map(
	ADDR      => c_addr(3 downto 0),
	DIN       => c_dout,
	DOUT      => pokey_dout,
	DOUT_OE_L => open,
	RW_L      => c_rw_l,
	CS        => pkydcd,
	CS_L      => '0',
	--
	AUDIO_OUT => open,
	--
	PIN       => dips_r8_l, 
	ENA       => ena_1_5M,	
	CLK       => clk
);
end Behavioral;

