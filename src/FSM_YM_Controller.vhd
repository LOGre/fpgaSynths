----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:01 01/25/2011 
-- Design Name: 
-- Module Name:    FSM_int_ym_Controller - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_YM_Controller is
	generic(
		cycles_size : positive := 7 --default 7
		);
		port(
			clk					: in std_logic;
			reset 				: in std_logic;
			delay_out			: out std_logic_vector(cycles_size downto 0);
			delay_in				: in std_logic;
			delay_en				: out std_logic;
			
		   int_ym_reset		: out std_logic;
			int_ym_bdir			: out std_logic;
			int_ym_bc1			: out std_logic;
			int_ym_bc2			: out std_logic;
			int_ym_da_in 		: out std_logic_vector(7 downto 0);
			int_ym_store		: out std_logic
		);
end FSM_YM_Controller;

architecture Behavioral of FSM_YM_Controller is

	type state_type is (s_reset, s_tRW, s_finishReset, s_tRB, 
	s_setAddress, s_tAS, s_inactive1, s_tAH, s_setZ1, s_tDS, s_write, s_tDW, s_inactive2, s_tDH, s_setZ2, s_t100,
	s2_setAddress, s2_tAS, s2_inactive1, s2_tAH, s2_setZ1, s2_tDS, s2_write, s2_tDW, s2_inactive2, s2_tDH, s2_setZ2, s2_t100,
	s3_setAddress, s3_tAS, s3_inactive1, s3_tAH, s3_setZ1, s3_tDS, s3_write, s3_tDW, s3_inactive2, s3_tDH, s3_setZ2, s3_t100
	);  
	signal state, next_state : state_type;
	
begin

	-- state register
	process(clk, reset)
	begin
		if reset = '1' then
			state <= s_reset;
			int_ym_da_in <= "ZZZZZZZZ";
		elsif rising_edge(clk) then
			state <= next_state;
		end if;
	end process;
	
	-- state transition
	process(state, delay_in)
	begin
		if delay_in = '1' then
			case (state) is
				when s_reset =>
					next_state <= s_tRW;
				when s_tRW =>
					next_state <= s_finishReset;			
				when s_finishReset =>
					next_state <= s_tRB;		
				when s_tRB =>
					next_state <= s_setAddress;	

				when s_setAddress =>
					next_state <= s_tAS;	
				when s_tAS =>
					next_state <= s_inactive1;	
				when s_inactive1 =>
					next_state <=s_tAH;	
				when s_tAH =>
					next_state <= s_setZ1;			
				when s_setZ1 =>
					next_state <= s_tDS;			
				when s_tDS =>
					next_state <= s_write;		
				when s_write =>
					next_state <= s_tDW;		
				when s_tDW =>
					next_state <= s_inactive2;		
				when s_inactive2 =>
					next_state <= s_tDH;			
				when s_tDH =>
					next_state <= s_setZ2;	
				when s_setZ2 =>
					next_state <= s_t100;		
				when s_t100 =>
					next_state <= s2_setAddress;						

				when s2_setAddress =>
					next_state <= s2_tAS;	
				when s2_tAS =>
					next_state <= s2_inactive1;	
				when s2_inactive1 =>
					next_state <= s2_tAH;	
				when s2_tAH =>
					next_state <= s2_setZ1;			
				when s2_setZ1 =>
					next_state <= s2_tDS;			
				when s2_tDS =>
					next_state <= s2_write;		
				when s2_write =>
					next_state <= s2_tDW;		
				when s2_tDW =>
					next_state <= s2_inactive2;		
				when s2_inactive2 =>
					next_state <= s2_tDH;			
				when s2_tDH =>
					next_state <= s2_setZ2;	
				when s2_setZ2 =>
					next_state <= s2_t100;		
				when s2_t100 =>
					next_state <= s3_setAddress;						

				when s3_setAddress =>
					next_state <= s3_tAS;	
				when s3_tAS =>
					next_state <= s3_inactive1;	
				when s3_inactive1 =>
					next_state <= s3_tAH;	
				when s3_tAH =>
					next_state <= s3_setZ1;			
				when s3_setZ1 =>
					next_state <= s3_tDS;			
				when s3_tDS =>
					next_state <= s3_write;		
				when s3_write =>
					next_state <= s3_tDW;		
				when s3_tDW =>
					next_state <= s3_inactive2;		
				when s3_inactive2 =>
					next_state <= s3_tDH;			
				when s3_tDH =>
					next_state <= s3_setZ2;	
				when s3_setZ2 =>
					next_state <= s3_t100;		
				when s3_t100 =>
					next_state <= s3_t100;						
			end case;
		else
			next_state <= state;
      end if;				
				  
	end process;
	
	process (state)
	begin
	  case (state) is
	    when s_reset =>
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';	
		 when s_tRW => 	-- wait 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"05";
			delay_en <= '1';		
		 when s_finishReset => 	-- set reset high
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s_tRB => 	-- wait RB = 4 clk
		   int_ym_reset <= '0';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"2C";
			delay_en <= '1';			

		 when s_setAddress => 	-- set address (5 = set channel C freq rough)
		   int_ym_reset <= '0';
			int_ym_da_in <= x"05";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '1';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';		
		 when s_tAS => 	-- wait tAS = 300ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"05";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '1';
			int_ym_store <= '0'; 
			delay_out <= x"06";
			delay_en <= '1';			
		 when s_inactive1 => 	-- set Inactive1
		   int_ym_reset <= '1';
			int_ym_da_in <= x"05";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s_tAH => 	-- wait tAH = 80ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"05";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';		
		 when s_setZ1 => 	-- set ZZZZZZZ
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';
		 when s_tDS => 	-- set tDS = 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';		
		 when s_write=> 	-- set write (freq C rough)
		   int_ym_reset <= '1';
			int_ym_da_in <= x"01";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';		
		 when s_tDW => 	-- set tDW = 300ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"01";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"06";
			delay_en <= '1';	
		 when s_inactive2 => 	-- set Inactive2
		   int_ym_reset <= '1';
			int_ym_da_in <= x"01";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s_tDH => 	-- set tDH = 80ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"01";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';	
		 when s_setZ2 => 	-- set ZZZZZZZ
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s_t100 => 	-- set t?? = 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"0F";
			delay_en <= '1';				

		 when s2_setAddress => 	-- set address (7 = mixer)
		   int_ym_reset <= '1';
			int_ym_da_in <= x"07";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '1';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';		
		 when s2_tAS => 	-- wait tAS = 300ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"07";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '1';
			int_ym_store <= '0'; 
			delay_out <= x"06";
			delay_en <= '1';			
		 when s2_inactive1 => 	-- set Inactive1
		   int_ym_reset <= '1';
			int_ym_da_in <= x"07";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s2_tAH => 	-- wait tAS = 80ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"07";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';		
		 when s2_setZ1 => 	-- set ZZZZZZZ
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';
		 when s2_tDS => 	-- set tDS = 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';		
		 when s2_write=> 	-- set write (enable channel C )
		   int_ym_reset <= '1';
			int_ym_da_in <= x"fb";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';		
		 when s2_tDW => 	-- set tDW = 300ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"fb";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"06";
			delay_en <= '1';	
		 when s2_inactive2 => 	-- set Inactive2
		   int_ym_reset <= '1';
			int_ym_da_in <= x"fb";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s2_tDH => 	-- set tDH = 80ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"fb";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';	
		 when s2_setZ2 => 	-- set ZZZZZZZ
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s2_t100 => 	-- set t?? = 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"0F";
			delay_en <= '1';				

		 when s3_setAddress => 	-- set address (a = volume C)
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0a";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '1';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';		
		 when s3_tAS => 	-- wait tAS = 300ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0a";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '1';
			int_ym_store <= '0'; 
			delay_out <= x"06";
			delay_en <= '1';			
		 when s3_inactive1 => 	-- set Inactive1
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0a";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s3_tAH => 	-- wait tAS = 80ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0a";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';		
		 when s3_setZ1 => 	-- set ZZZZZZZ
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';
		 when s3_tDS => 	-- set tDS = 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';		
		 when s3_write=> 	-- set write (set max volume C )
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0f";
			int_ym_bdir <= '1';
			int_ym_bc2 <= '1';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';		
		 when s3_tDW => 	-- set tDW = 300ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0f";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"06";
			delay_en <= '1';	
		 when s3_inactive2 => 	-- set Inactive2
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0f";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s3_tDH => 	-- set tDH = 80ns
		   int_ym_reset <= '1';
			int_ym_da_in <= x"0f";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';	
		 when s3_setZ2 => 	-- set ZZZZZZZ
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '1'; 
			delay_out <= x"00";
			delay_en <= '0';			
		 when s3_t100 => 	-- set t?? = 100ns
		   int_ym_reset <= '1';
			int_ym_da_in <= "ZZZZZZZZ";
			int_ym_bdir <= '0';
			int_ym_bc2 <= '0';
			int_ym_bc1 <= '0';
			int_ym_store <= '0'; 
			delay_out <= x"01";
			delay_en <= '1';				
		end case;
			
	end process;

end Behavioral;

