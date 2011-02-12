--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:02:48 02/01/2011
-- Design Name:   
-- Module Name:   D:/Xilinx/projects/ParametrizedCounter/top_tb.vhd
-- Project Name:  ParametrizedCounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ParamCounter_top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ParamCounter_top
    PORT(
         CLK_50MHZ : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_50MHZ : std_logic := '0';

   -- Clock period definitions
   constant CLK_50MHZ_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ParamCounter_top PORT MAP (
          CLK_50MHZ => CLK_50MHZ
        );

   -- Clock process definitions
   CLK_50MHZ_process :process
   begin
		CLK_50MHZ <= '0';
		wait for CLK_50MHZ_period/2;
		CLK_50MHZ <= '1';
		wait for CLK_50MHZ_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_50MHZ_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
