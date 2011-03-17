--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:11:54 02/23/2011
-- Design Name:   
-- Module Name:   C:/nico/perso/hack/hackerspace/fpga/projects/my2_ym2149/tb_top.vhd
-- Project Name:  my2_ym2149
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
USE ieee.numeric_std.ALL;
 
ENTITY tb_top_but IS
END tb_top_but;
 
ARCHITECTURE behavior OF tb_top_but IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aaatop
    PORT(
         rx : IN  std_logic;
         tx : INOUT  std_logic;
         W1A : out  std_logic_vector(15 downto 0);
         W1B : IN  std_logic_vector(15 downto 0);
         W2C : inOUT  std_logic_vector(15 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;

	component uart_tx 
    Port (            data_in : in std_logic_vector(7 downto 0);
                 write_buffer : in std_logic;
                 reset_buffer : in std_logic;
                 en_16_x_baud : in std_logic;
                   serial_out : out std_logic;
                  buffer_full : out std_logic;
             buffer_half_full : out std_logic;
                          clk : in std_logic);
    end component uart_tx;
    
   --Inputs
   signal rx : std_logic := '0';
   signal W1A : std_logic_vector(15 downto 0) := (others => '0');
   signal W1B : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';

	--BiDirs
   signal tx : std_logic;

 	--Outputs
   signal W2C : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 31.25 ns;
	signal reset_ym_in : std_logic := '0';
	signal audio : std_logic_vector(7 downto 0) := (others => '0');
	signal cnt32 : unsigned(2 downto 0) := "000";
	signal ena32_16 : std_logic := '1';
	signal data : std_logic_vector(7 downto 0) := (others => '0');
	signal write_buffer : std_logic := '0';
	signal write_bufferN,write_bufferP : std_logic := '0';
constant a1 : std_logic_vector(7 downto 0) := x"05";
constant d1 : std_logic_vector(7 downto 0) := x"01";
constant a2 : std_logic_vector(7 downto 0) := x"07";
constant d2 : std_logic_vector(7 downto 0) := x"fb";
constant a3 : std_logic_vector(7 downto 0) := x"0a";
constant d3 : std_logic_vector(7 downto 0) := x"0f";
type st_t is (s_reset,s_wait,s_a1,s2_a1,s_d1,s2_d1,s_a2,s2_a2,s_d2,s2_d2,s_a3,s2_a3,s_d3,s2_d3);
signal stP,stN : st_t := s_reset;
signal but_in : std_logic_vector(3 downto 0);
signal dataP,dataN : std_logic_vector(7 downto 0) := (others => '0');
BEGIN
 
	w2c(15) <= but_in(0);
	w2c(13) <= but_in(1);
	w2c(11) <= but_in(2);
	w2c(9) <= but_in(3);
	data <= dataP;
	write_buffer <= write_bufferP;
--	audio <= w2c(7 downto 0);
	w1b(14) <= reset_ym_in;

	-- Instantiate the Unit Under Test (UUT)
   uut: aaatop PORT MAP (
          rx => rx,
          tx => tx,
          W1A => W1A,
          W1B => W1B,
          W2C => W2C,
          clk => clk
        );

	uart_tx0 : uart_tx Port map(
		data_in => data,
		write_buffer => write_buffer,
		reset_buffer => '0',
		en_16_x_baud => ena32_16,
		serial_out => rx,
		buffer_full => open,
		buffer_half_full => open,
		clk => clk
		);

	ena32_16 <= cnt32(0);
	pena32 : process( clk)
	begin
		if rising_edge( clk) then
			cnt32 <= cnt32 + 1;
		end if;
	end process;

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	process(stP,write_bufferP,dataP,but_in)
	begin
		stN <= stP;
		write_bufferN <= write_bufferP;
		dataN <= dataP;
		case stP is
			when s_reset =>
				if but_in(0)='1' then
					stN <= s_wait;
				end if;
			when s_wait =>
				if but_in(2 downto 0)/="000" then
					stN <= s_a1;
				elsif but_in(3)='1' then
					stN <= s_reset;
				end if;

			when s_a1 =>
				dataN <= a1;
				write_bufferN <= '1';
				stN <= s2_a1;
			when s2_a1 =>
				write_bufferN <= '0';
				stN <= s_d1;
			when s_d1 =>
				dataN <= d1;
				write_bufferN <= '1';
				stN <= s2_d1;
			when s2_d1 =>
				write_bufferN <= '0';
				stN <= s_a2;
			when s_a2 =>
				dataN <= a2;
				write_bufferN <= '1';
				stN <= s2_a2;
			when s2_a2 =>
				write_bufferN <= '0';
				stN <= s_d2;
			when s_d2 =>
				dataN <= d2;
				write_bufferN <= '1';
				stN <= s2_d2;
			when s2_d2 =>
				write_bufferN <= '0';
				stN <= s_a3;
			when s_a3 =>
				dataN <= a3;
				write_bufferN <= '1';
				stN <= s2_a3;
			when s2_a3 =>
				write_bufferN <= '0';
				stN <= s_d3;
			when s_d3 =>
				dataN <= d3;
				write_bufferN <= '1';
				stN <= s2_d3;
			when s2_d3 =>
				dataN <= (others => '0');
				write_bufferN <= '0';
				if but_in(2 downto 0)="000" then
					stN <= s_wait;
				elsif but_in(3)='1' then
					stN <= s_reset;
				end if;
		end case;
	end process;
	process(clk)
	begin
		if rising_edge(clk) then
			stP <= stN;
			write_bufferP <= write_bufferN;
			dataP <= dataN;
		end if;
	end process;
	
   -- Stimulus process
   stim_proc: process
   begin
		but_in(0) <= '0';
		but_in(1) <= '0';
		but_in(2) <= '0';
		but_in(3) <= '0';
		reset_ym_in <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset_ym_in <= '0';

      wait for 1 ms;

--		wait until rising_edge(clk);
      -- insert stimulus here

		but_in(0) <= '1';
--		wait for clk_period*15;
		wait for 15 ms;
		but_in(0) <= '0';
--		wait for clk_period*55;

--		w1a(7) <= '1';
--		wait for clk_period*25;
--		w1a(7) <= '0';
--		wait for clk_period*95;
--
--		w1a(7) <= '1';
--		wait for clk_period*100;
--		w1a(7) <= '0';
--		wait for clk_period*120;
--
--		w1a(7) <= '1';
--		wait for clk_period*15;
--		w1a(7) <= '0';
--		wait for clk_period*35;
		
      wait;
   end process;

END;
