--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:21:35 03/16/2011
-- Design Name:   
-- Module Name:   C:/nico/hackerspace/fpga/projects/uart/tb_top.vhd
-- Project Name:  uart
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aaatop
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
--USE ieee.numeric_std.ALL;
 
ENTITY tb_top IS
END tb_top;
 
ARCHITECTURE behavior OF tb_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aaatop
    PORT(
         rx : IN  std_logic;
         tx : INOUT  std_logic;
         W2C : INOUT  std_logic_vector(15 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rx : std_logic := '0';
   signal clk : std_logic := '0';
	
	--BiDirs
   signal tx : std_logic;
   signal W2C : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20.0 ns;
	signal clk_tx_count : integer range 0 to 26 :=0;
	signal en_16_x_baud : std_logic;	
 
signal data : std_logic_vector(7 downto 0) := (others => '0');
signal write_buffer : std_logic := '0';
BEGIN
	w2c(0) <= 'Z';
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aaatop PORT MAP (
          rx => rx,
          tx => tx,
          W2C => W2C,
          clk => clk
        );

	uart_tx0 : entity work.uart_tx Port map(
		data_in => data,
		write_buffer => write_buffer,
		reset_buffer => '0',
		en_16_x_baud => en_16_x_baud,
		serial_out => rx,
		buffer_full => open,
		buffer_half_full => open,
		clk => clk
	);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
    -- Clock process definitions
   clk_tx: process(clk)
   begin
    if clk'event and clk='1' then
      if clk_tx_count=26 then
         clk_tx_count <= 0;
         en_16_x_baud <= '1';
       else
         clk_tx_count <= clk_tx_count + 1;
         en_16_x_baud <= '0';
      end if;
    end if;
   end process clk_tx;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		data <= x"00";
		write_buffer <= '1';
		wait for clk_period;
		write_buffer <= '0';
		wait for clk_period;

		data <= x"90";
		write_buffer <= '1';
		wait for clk_period;
		write_buffer <= '0';
		wait for clk_period;

		data <= x"01";
		write_buffer <= '1';
		wait for clk_period;
		write_buffer <= '0';
		wait for clk_period;

		data <= x"AF";
		write_buffer <= '1';
		wait for clk_period;
		write_buffer <= '0';
		wait for clk_period;

		data <= x"08";
		write_buffer <= '1';
		wait for clk_period;
		write_buffer <= '0';
		wait for clk_period;

		data <= x"00";
		write_buffer <= '1';
		wait for clk_period;
		write_buffer <= '0';
		wait for clk_period;

		data <= x"00";
      wait;
   end process;

END;
