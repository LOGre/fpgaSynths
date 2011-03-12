--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:56 03/12/2011
-- Design Name:   
-- Module Name:   D:/Xilinx/projects/my_pokey/tb_pokey.vhd
-- Project Name:  my_pokey
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: POKEY
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

use std.textio.ALL;
LIBRARY ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_arith.all;
  use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_pokey IS
END tb_pokey;
 
ARCHITECTURE behavior OF tb_pokey IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT POKEY
    PORT(
         ADDR : IN  std_logic_vector(3 downto 0);
         DIN : IN  std_logic_vector(7 downto 0);
         DOUT : OUT  std_logic_vector(7 downto 0);
         DOUT_OE_L : OUT  std_logic;
         RW_L : IN  std_logic;
         CS : IN  std_logic;
         CS_L : IN  std_logic;
         AUDIO_OUT : OUT  std_logic_vector(7 downto 0);
         PIN : IN  std_logic_vector(7 downto 0);
         ENA : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal ADDR : std_logic_vector(3 downto 0) := (others => '0');
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');
   signal RW_L : std_logic := '0';
   signal CS : std_logic := '0';
   signal CS_L : std_logic := '0';
   signal PIN : std_logic_vector(7 downto 0) := (others => '0');
   signal ENA : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal DOUT : std_logic_vector(7 downto 0);
   signal DOUT_OE_L : std_logic;
   signal AUDIO_OUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 564 ns; -- 1.77MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: POKEY PORT MAP (
          ADDR => ADDR,
          DIN => DIN,
          DOUT => DOUT,
          DOUT_OE_L => DOUT_OE_L,
          RW_L => RW_L,
          CS => CS,
          CS_L => CS_L,
          AUDIO_OUT => AUDIO_OUT,
          PIN => PIN,
          ENA => ENA,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	
	procedure write
	(
		v_addr : in bit_vector(3 downto 0);
		v_data : in bit_vector(7 downto 0)
	) is
	begin
		wait until rising_edge(clk);
		-- addr
		ADDR <= to_stdlogicvector(v_addr);
		wait for 120 ns;
		-- write
		DIN <= to_stdlogicvector(v_data);
	end write;		
	
   begin		

      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		-- we <= (not CS_L) and CS and (not RW_L) and ENA;
		
		-- not real :)
		ENA	<= '1';
		-- set R/W select control
		RW_L 	<= '0';
		-- set chip seelct
		CS_L 	<= '0';
		CS 	<= '1';

		-- set AUDF1 : middle A
		write(x"0",x"90");
		-- set AUDC1 : pure tone high vol
		write(x"1",b"10101111");
		-- set AUDF2 : middle A
		write(x"2",x"90");
		-- set AUDC2 : pure tone, off
		write(x"3",b"10100000");
		-- set AUDF3 : middle A
		write(x"4",x"90");
		-- set AUDC3 : pure tone, off
		write(x"5",b"10100000");
		-- set AUDF4 : middle A
		write(x"6",x"90");
		-- set AUDC4 : pure tone, off
		write(x"7",b"10100000");
		-- set AUDCTL : 0
		write(x"8",b"00000000");
		
			

      wait;
   end process;

END;
