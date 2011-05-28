--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:14:51 05/27/2011
-- Design Name:   
-- Module Name:   D:/shared/ym303/tb/tb.vhd
-- Project Name:  ym303
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: zpuino_SN76489
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
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zpuino_SN76489
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         read : OUT  std_logic_vector(31 downto 0);
         write : IN  std_logic_vector(31 downto 0);
         address : IN  std_logic_vector(10 downto 2);
         we : IN  std_logic;
         re : IN  std_logic;
         busy : OUT  std_logic;
         interrupt : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal write : std_logic_vector(31 downto 0) := (others => '0');
   signal address : std_logic_vector(10 downto 2) := (others => '0');
   signal we : std_logic := '0';
   signal re : std_logic := '0';

 	--Outputs
   signal read : std_logic_vector(31 downto 0);
   signal busy : std_logic;
   signal interrupt : std_logic;
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10.41 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zpuino_SN76489 PORT MAP (
          clk => clk,
          rst => rst,
          read => read,
          write => write,
          address => address,
          we => we,
          re => re,
          busy => busy,
          interrupt => interrupt,
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
      -- hold reset state for 100 ns.
		rst <= '1';
      wait for 20 ns;	
		rst <= '0';

      wait for clk_period*10;
		we <= '1';
		address <= "000000010";
		write <= x"00000312";
		
		wait for clk_period*10;
		loopBusy: WHILE (busy = '1') LOOP 
		WAIT FOR clk_period;
		END LOOP loopBusy;
		we <= '0';
		
      wait for clk_period*10;
		we <= '1';
		address <= "000000001";
		write <= x"00000006";		

		wait for clk_period*10;
		loopBusy2: WHILE (busy = '1') LOOP 
		WAIT FOR clk_period;
		END LOOP loopBusy2;
		we <= '0';

      wait;
   end process;

END;
