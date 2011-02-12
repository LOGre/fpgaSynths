--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:18:18 02/08/2011
-- Design Name:   
-- Module Name:   D:/Xilinx/projects/ParametrizedCounter/tb_top.vhd
-- Project Name:  ParametrizedCounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: YMDriver_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT YMDriver_top
    PORT(
         CLK_32MHZ : IN  std_logic;
			W2C : out std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_32MHZ : std_logic := '0';

   -- Clock period definitions
   constant CLK_32MHZ_period : time := 31.25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: YMDriver_top PORT MAP (
          CLK_32MHZ => CLK_32MHZ
        );

   -- Clock process definitions
   CLK_32MHZ_process :process
   begin
		CLK_32MHZ <= '0';
		wait for CLK_32MHZ_period/2;
		CLK_32MHZ <= '1';
		wait for CLK_32MHZ_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      wait for CLK_32MHZ_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
