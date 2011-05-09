--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:56:51 05/09/2011
-- Design Name:   
-- Module Name:   D:/Xilinx/projects/audiomixer/tb_mixer.vhd
-- Project Name:  audiomixer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zpuino_audiomixer
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
 
ENTITY tb_mixer IS
END tb_mixer;
 
ARCHITECTURE behavior OF tb_mixer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zpuino_audiomixer
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         data_in1 : IN  std_logic_vector(7 downto 0);
         data_in2 : IN  std_logic_vector(7 downto 0);
         data_in3 : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal data_in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal data_in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal data_in3 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zpuino_audiomixer PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          data_in1 => data_in1,
          data_in2 => data_in2,
          data_in3 => data_in3,
          data_out => data_out
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
      -- hold reset state for 10 ns.
      wait for 10 ns;	
		ena <= '1';

      wait for clk_period*10;

      -- insert stimulus here 
		data_in1 <= x"FF";
		data_in2 <= x"00";
		data_in3 <= x"00";
		
      wait for clk_period*10;

		data_in1 <= x"FF";
		data_in2 <= x"FF";
		data_in3 <= x"00";		
		
      wait for clk_period*10;

		data_in1 <= x"FF";
		data_in2 <= x"FF";
		data_in3 <= x"FF";			

      wait;
   end process;

END;
