----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:14:32 01/30/2011 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm is
generic(
	NB_BITS : integer := 8
);
	Port (
		input : in  STD_LOGIC_VECTOR (NB_BITS-1 downto 0);
		output : out  STD_LOGIC;
		clk : in  STD_LOGIC
	);
end pwm;

architecture Behavioral of pwm is
signal acc : std_logic_vector(NB_BITS downto 0) := (others => '0');
begin
	process(clk,input)
	begin
		if rising_edge(clk) then
			acc <= ('0' & acc(NB_BITS-1 downto 0)) + ('0' & input);
		end if;
	end process;
	
	output <= acc(NB_BITS);
end Behavioral;