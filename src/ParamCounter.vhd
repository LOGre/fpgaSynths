----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:32 01/25/2011 
-- Design Name: 
-- Module Name:    ParamCounter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataPath is
	generic(
		cycles_size : positive := 7 --default 7
		);
	port(
		clk				: in std_logic;
		reset 			: in std_logic;
		enable 			: in std_logic;
		cycles			: in std_logic_vector(cycles_size downto 0);
		done				: out std_logic;
		
		int_ym_reset	: in std_logic;
		int_ym_bdir		: in std_logic;
		int_ym_bc1		: in std_logic;
		int_ym_bc2		: in std_logic;
		int_ym_da_in 	: in std_logic_vector(7 downto 0);
		int_ym_store	: in std_logic;
	
		ym_reset			: out std_logic;
		ym_bdir			: out std_logic;
		ym_bc1			: out std_logic;
		ym_bc2			: out std_logic;
		ym_da_in 		: out std_logic_vector(7 downto 0)		
		
		);
end DataPath;

architecture Behavioral of DataPath is

	signal counter 	: std_logic_vector(cycles_size downto 0);	
	signal wasenabled : std_logic;
	
begin

	-- counter to implement delay
--	process(clk, reset)
--	begin
--		if reset = '1' then
--			counter <= cycles;
--			done <= '1';
--			wasenabled <= '0';
--		elsif enable = '1' and unsigned(counter) = 0 and wasenabled = '0' then --pb ne doit arriver que si enable etait a 0 avant :(
--				done <= '0';
--				counter <= cycles;
--		elsif rising_edge(clk) and enable = '1' then
--				wasenabled <= '1';	
--				if unsigned(counter) /= 0 then		
--					counter <=  std_logic_vector(unsigned(counter) - 1);
--					done <= '0';
--				else 
--					done <= '1'; -- ne doit pas revenir à 0 sans switch de enable
--				end if;
--		elsif rising_edge(clk) and enable = '0' then
--			wasenabled <= '0';	
--		end if;
--	end process;
	
	-- counter to implement delay
	process(clk, reset)
	begin
		if reset = '1' then
			counter <= (others => '0');
			done <= '1';
			wasenabled <= '0';
		elsif rising_edge(clk) then
			if unsigned(counter) /= 0 then
				counter <= std_logic_vector(unsigned(counter) - 1);
			else
				counter <= cycles;
			end if;
		end if;
	end process;
	
	-- registry to implement YM wrapper with memory
	process(clk, reset)
	begin
		if reset = '1' then
			ym_bdir <= '0';
			ym_bc2 <= '0';
			ym_bc1 <= '0';
			ym_da_in <= (others => '0');
			ym_reset <= '1';
		elsif rising_edge(clk) and int_ym_store = '1' then
			ym_bdir <= int_ym_bdir;
			ym_bc2 <= int_ym_bc2;
			ym_bc1 <= int_ym_bc1;
			ym_da_in <= int_ym_da_in;
			ym_reset <= int_ym_reset;		
		end if;	
	end process;
	
end Behavioral;

