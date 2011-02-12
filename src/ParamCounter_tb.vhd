--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:54:58 01/25/2011
-- Design Name:   
-- Module Name:   D:/Xilinx/projects/ParametrizedCounter/ParamCounter_tb.vhd
-- Project Name:  ParametrizedCounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ParamCounter
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
 
ENTITY ParamCounter_tb IS
END ParamCounter_tb;
 
ARCHITECTURE behavior OF ParamCounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ParamCounter
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         cycles : IN  std_logic_vector(7 downto 0);
         done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';
   signal cycles : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ParamCounter PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          cycles => cycles,
          done => done
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		reset <= '1';
		cycles <= x"0F";
      wait for 115 ns;	
		
		reset <= '0';
		wait for clk_period;
		
		enable <= '1';
      wait for clk_period*20;

		reset <= '1';
		cycles <= x"03";
      wait for clk_period;	
		
		reset <= '0';
		wait for clk_period*10;		

      -- insert stimulus here 

      wait;
   end process;

END;
