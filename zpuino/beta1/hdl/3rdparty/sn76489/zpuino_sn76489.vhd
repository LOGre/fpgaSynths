-- SN76489 interface IO module for ZPUino

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

use work.papiliochip_config.all;
use work.papiliochippkg.all;
use work.sn76489_comp_pack.sn76489_top;  

entity zpuino_io_SN76489 is
  port (
	wb_clk_i:    	in std_logic;
	wb_rst_i:    	in std_logic;
	wb_dat_i:  		in std_logic_vector(wordSize-1 downto 0);
	wb_dat_o:   	out std_logic_vector(wordSize-1 downto 0);
	wb_adr_i:   	in std_logic_vector(maxIOBit downto minIOBit);
	wb_we_i:     	in std_logic;
	wb_cyc_i:     	in std_logic;
	wb_stb_i:		in std_logic;
	wb_ack_o:   	out std_logic;
	wb_inta_o:   	out std_logic;
	
	data_out: 		out std_logic_vector(7 downto 0)
  );
end entity zpuino_io_SN76489;

architecture behave of zpuino_io_SN76489 is

  	-- internal
  	signal d_i1						: std_logic_vector(7 downto 0) := (others => '0');
  	signal d_i2						: std_logic_vector(7 downto 0) := (others => '0');  
  	signal signed_output 			: signed(7 downto 0);
  	signal clk_4M_en  				: std_logic := '0';
  	signal predivcnt				: integer;
  	constant PRE_CLOCK_DIVIDER		: integer := 24;
  
  	-- in
  	signal ready 					: std_logic;
  
  	-- out
  	signal d   						: std_logic_vector(7 downto 0) := (others => '0');
  	signal we_n						: std_logic := '0';
	signal ce_n						: std_logic := '1';
	signal sn_reset					: std_logic := '1';
 
 	-- define the states of FSM model
  	type state_type is (st_idle, st_writeReg, st_dataRead, st_writeReg2, st_dataRead2);
  	signal next_state, current_state: state_type;  
  
begin

	-- Tie wb_inta_o to '0', wb_we_i never wb_inta_o
	wb_inta_o <= '0';
	
	--sn_reset <= NOT wb_rst_i;
	
	-- doesn't work for unknown reason... libs ? 
	--data_out <= conv_std_logic_vector(signed_output,8);

	-- manage reset
	reset_propagation: process(wb_clk_i) 
	begin 
		if rising_edge(wb_clk_i) then 
			sn_reset <= NOT wb_rst_i; 
		end if; 
	end process reset_propagation;	

	-- generate 4MHz clock
	predivider: process(wb_clk_i)
	begin
		if rising_edge(wb_clk_i) then
			if wb_rst_i='1' then
				clk_4M_en <= '0';
				predivcnt <= PRE_CLOCK_DIVIDER;
			else
				clk_4M_en<='0';
				if predivcnt=0 then
					clk_4M_en<='1';
					predivcnt <= PRE_CLOCK_DIVIDER;
				else
					predivcnt <= predivcnt -1 ;
				end if;
			end if;
		end if;
	end process;

	-- FSM : set current state with synchronous reset
	state_reg: process(wb_clk_i, wb_rst_i)
	begin
		if rising_edge(wb_clk_i) then
			if (wb_rst_i='1') then
				current_state <= st_idle;
			else
				current_state <= next_state;
			end if;
		end if;
   	end process;	

    	-- FSM : combinational logic
    	next_state_logic: process(current_state, ready, wb_we_i, wb_adr_i)
    	begin
		next_state <= st_idle;
		
		-- use case statement to show the state transistion
		case current_state is	 
			 when st_idle =>				-- nothing to latch
				if wb_we_i='0' then 
					 next_state <= st_idle;
				else
					 next_state <= st_writeReg;
				end if;	        
			 when st_writeReg =>			-- wb_we_i is high, data not yet wb_clk_o by sn76489
				if ready='0' then 		-- if ready low, SN76489 is busy so databus is wb_clk_o
					 next_state <= st_dataRead;
				else							-- else... databus not yet wb_clk_o
					 next_state <= st_writeReg;
				end if;
			 when st_dataRead => 		-- the SN is ready to latch data	
				if ready='0' then			-- if ready low, SN76489 is busy so data not yet latched
					 next_state <= st_dataRead;
				else							-- not busy anymore, send 2nd byte if needed
					case wb_adr_i(10 downto minIOBit) is
					  when "000000000" => 
						next_state <= st_writeReg2;				
					  when "000000010" => 
						next_state <= st_writeReg2;
					  when "000000100" =>
						next_state <= st_writeReg2;                                    
					  when others =>		-- no 2nd byte needed, goto idle
						next_state <= st_idle;
					end case;			
				end if;	
			 when st_writeReg2 =>	-- wb_we_i is high
				if ready='0' then 	-- if ready low, SN76489 is busy so databus is wb_clk_o
					 next_state <= st_dataRead2;
				else					 	-- else... databus not yet wb_clk_o
					 next_state <= st_writeReg2;
				end if;
			 when st_dataRead2 =>	-- the SN is ready to latch data	
				if ready='0' then		-- if ready low, SN76489 is busy so data not yet latched
					 next_state <= st_dataRead2;
				else						-- not busy anymore, finish ! goto idle
					 next_state <= st_idle;
				end if;				
			 when others => null;
		end case;
    	end process next_state_logic;
    
    	--FSM : output logic based onstate
    	output_logic: process (current_state, d_i1, d_i2)
		begin
		 
			-- default value is don't care
			d <= (others => 'X');
			we_n <= '1';
			ce_n <= '1';
			wb_ack_o <= '1';	

			case current_state is
				when st_idle => 		-- nothing to do, ce and wb_we_i high
					d <= (others => '0');
					we_n <= '1';
					ce_n <= '1';
					wb_ack_o <= '1';	
				when st_writeReg =>	-- tell the SN76489 wb_we_i want to send data : wb_we_i low, ce low
					d <= d_i1;
					we_n <= '0';
					ce_n <= '0';
					wb_ack_o <= '0';  
				when st_dataRead =>	-- the data is being latched, tell the SN76489 wb_we_i have finished: ce high
					d <= d_i1;
					we_n <= '1';
					ce_n <= '1';
					wb_ack_o <= '0';	
				when st_writeReg2 =>	-- tell the SN76489 wb_we_i want to send data : wb_we_i low, ce low
					d <= d_i2;
					we_n <= '0';
					ce_n <= '0';
					wb_ack_o <= '0'; 
				 when st_dataRead2 => -- the data is being latched, tell the SN76489 wb_we_i have finished: ce high
					d <= d_i2;
					we_n <= '1';
					ce_n <= '1';
					wb_ack_o <= '0';
			end case;
		
    	end process output_logic;


	-- Main process

	process(wb_clk_i)

	-- procedure to wb_dat_i a frequency register
--	procedure wr_freq ( ch : in integer range 0 to 2; n  : in std_logic_vector(9 downto 0)) is
--		variable n_s : std_logic_vector(9 downto 0);
--	begin
--		d_i1 <= '1' & conv_std_logic_vector(ch, 2) & '0' & n(3 downto 0);
--		d_i2 <= '0' & '0' & n(9 downto 4);
--	end procedure wr_freq;

	-- procedure to wb_dat_i an attenuation register
--	procedure wr_attn ( ch : in integer range 0 to 7; a : in std_logic_vector(3 downto 0)) is
--		variable a_s : std_logic_vector(3 downto 0);
--	begin
--		d_i1 <= '1' & conv_std_logic_vector(ch, 2) & '1' & a;
--	end procedure wr_attn;

	begin
		if rising_edge(wb_clk_i) then
			if wb_rst_i='1' then
				d_i1 <= (others => DontCareValue);
				d_i2 <= (others => DontCareValue);
			else
				if wb_we_i='1' then
					case wb_adr_i(10 downto minIOBit) is
						when "000000000" => -- Tone 1 Frequency Register (6+4bits)
							d_i1 <= '1' & "000" & wb_dat_i(3 downto 0);
							d_i2 <= '0' & '0' & wb_dat_i(9 downto 4);
						when "000000001" => -- Tone 1 Attenuation Register (4bits)
							d_i1 <= '1' & "001" & wb_dat_i(3 downto 0);
							d_i2 <= (others => '0');
						when "000000010" => -- Tone 2 Frequency Register (6+4bits)
							d_i1 <= '1' & "010" & wb_dat_i(3 downto 0);
							d_i2 <= '0' & '0' & wb_dat_i(9 downto 4);
						when "000000011" => -- Tone 2 Attenuation Register (4bits)
							d_i1 <= '1' & "011" & wb_dat_i(3 downto 0);
							d_i2 <= (others => '0');
						when "000000100" => -- Tone 3 Frequency Register (6+4bits)
							d_i1 <= '1' & "100" & wb_dat_i(3 downto 0);
							d_i2 <= '0' & '0' & wb_dat_i(9 downto 4);
						when "000000101" => -- Tone 3 Attenuation Register (4bits)
							d_i1 <= '1' & "101" & wb_dat_i(3 downto 0);
							d_i2 <= (others => '0');    
						when "000000110" => -- Noise Register (1+2bits)
							d_i1 <= '1' & "110" & '1' & wb_dat_i(2 downto 0);
							d_i2 <= (others => '0');	
						when "000000111" => -- Noise Attenuation Register (4bits)
							d_i1 <= '1' & "111" & wb_dat_i(3 downto 0);
							d_i2 <= (others => '0');                                         
						when others =>
							d_i1 <= (others => DontCareValue);
							d_i2 <= (others => DontCareValue);		
					end case;
				--else
				--	d_i1 <= (others => DontCareValue);
				--	d_i2 <= (others => DontCareValue);
				end if;
			end if;
		end if;
	end process;

	sn76489_inst : sn76489_top
	generic map (
		clock_div_16_g => 1
	)
	port map (
		clock_i    	=> wb_clk_i,
		clock_en_i 	=> clk_4M_en,
		res_n_i    	=> sn_reset,
		ce_n_i     	=> ce_n,
		we_n_i     	=> we_n,
		ready_o    	=> ready,
		d_i        	=> d,
		aout_o     	=> signed_output
	);
	
	convert : entity work.conv_signed
	port map (
	  in_signed  	=> signed_output,
	  out_stdlogic  => data_out
	);	


--	sn76489_inst : entity work.sn76489
--	generic map
--	(
--	  AUDIO_RES   => 8
--	)
--	port map
--	(
--		wb_clk_i				=> wb_clk_i,
--		clk_en			=> clk_4M_en,
--		reset			=> wb_rst_i,
				
--		d				=> d,
--		ready			=> ready,
--		we_n			=> we_n,
--		ce_n			=> ce_n,
--	  
--		audio_out		=> data_out
--	);
  	
end behave;
