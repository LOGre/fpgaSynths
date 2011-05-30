-- SN76489 interface IO module for ZPUino

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.sn76489_comp_pack.sn76489_top;

entity zpuino_SN76489 is
  port (
    clk:      in std_logic;
    rst:      in std_logic;
    read:     out std_logic_vector(32-1 downto 0);
    write:    in std_logic_vector(32-1 downto 0);
    address:  in std_logic_vector(10 downto 2);
    we:       in std_logic;
    re:       in std_logic;
    busy:     out std_logic;
    interrupt:out std_logic;
    data_out: out std_logic_vector(7 downto 0)
  );
end entity zpuino_SN76489;

architecture behave of zpuino_SN76489 is

  	-- internal
  	signal d_i1						: std_logic_vector(7 downto 0) := (others => '0');
  	signal d_i2						: std_logic_vector(7 downto 0) := (others => '0');  
  	signal signed_output 		: signed(7 downto 0);
  	signal clk_4M_en  			: std_logic := '0';
  	signal predivcnt				: integer;
  	constant PRE_CLOCK_DIVIDER	: integer := 24;
  
  	-- in
  	signal ready 					: std_logic;
  
  	-- out
  	signal d   						: std_logic_vector(7 downto 0) := (others => '0');
  	signal we_n						: std_logic := '0';
	signal ce_n						: std_logic := '1';
	signal sn_reset				: std_logic;
 
 	-- define the states of FSM model
  	type state_type is (st_idle, st_writeReg, st_dataRead, st_writeReg2, st_dataRead2);
  	signal next_state, current_state: state_type;  
  
begin

	-- Tie interrupt to '0', we never interrupt
	interrupt <= '0';
	sn_reset <= NOT rst;
	
	-- doesn't work for unknown reason... libs ? 
	--data_out <= conv_std_logic_vector(signed_output,8);

	-- generate 4MHz clock
	predivider: process(clk)
	begin
		if rising_edge(clk) then
			if rst='1' then
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
	state_reg: process(clk, rst)
	begin
		if rising_edge(clk) then
			if (rst='1') then
				current_state <= st_idle;
			else
				current_state <= next_state;
			end if;
		end if;
   	end process;	

    	-- FSM : combinational logic
    	next_state_logic: process(current_state, ready, we, address)
    	begin
		next_state <= st_idle;
		
		-- use case statement to show the state transistion
		case current_state is	 
			 when st_idle =>	-- nothing to latch
				if we='0' then 
					 next_state <= st_idle;
				else
					 next_state <= st_writeReg;
				end if;	        
			 when st_writeReg =>	-- we is high, data not yet read by sn76489
				if ready='1' then 
					 next_state <= st_dataRead;
				else
					 next_state <= st_writeReg;
				end if;
			 when st_dataRead => -- the SN is ready to latch data	
				if ready='1' then
					 next_state <= st_dataRead;
				else
					case address is
					  when "000000000" => 
						next_state <= st_writeReg2;				
					  when "000000010" => 
						next_state <= st_writeReg2;
					  when "000000100" =>
						next_state <= st_writeReg2;                                    
					  when others =>
						next_state <= st_idle;
					end case;			
				end if;	
			 when st_writeReg2 =>	-- we is high
				if ready='1' then 
					 next_state <= st_dataRead2;
				else
					 next_state <= st_writeReg2;
				end if;
			 when st_dataRead2 =>	
				if ready='1' then
					 next_state <= st_dataRead2;
				else			
					 next_state <= st_idle;
				end if;				
			 when others => null;
		end case;
    	end process next_state_logic;
    
    	--FSM : output logic based onstate
    	output_logic: process (current_state, d_i1, d_i2)
		begin
		 
			-- default value is don't care
			d <= (others => DontCareValue);
			we_n <= '1';
			ce_n <= '1';
			busy <= '0';	

			case current_state is
				when st_idle => 		-- nothing to do
					d <= (others => '0');
					we_n <= '1';
					ce_n <= '1';
					busy <= '0';	
				when st_writeReg =>	-- we is high
					d <= d_i1;
					we_n <= '0';
					ce_n <= '0';
					busy <= '1';  
				when st_dataRead =>	-- ready is high
					d <= d_i1;
					we_n <= '1';
					ce_n <= '1';
					busy <= '1';	
				when st_writeReg2 =>	-- we is high
					d <= d_i2;
					we_n <= '0';
					ce_n <= '0';
					busy <= '1'; 
				 when st_dataRead2 =>	-- ready is high
					d <= d_i2;
					we_n <= '1';
					ce_n <= '1';
					busy <= '1';
			end case;
		
    	end process output_logic;


	-- Main process

	process(clk)

	-- procedure to write a frequency register
--	procedure wr_freq ( ch : in integer range 0 to 2; n  : in std_logic_vector(9 downto 0)) is
--		variable n_s : std_logic_vector(9 downto 0);
--	begin
--		d_i1 <= '1' & conv_std_logic_vector(ch, 2) & '0' & n(3 downto 0);
--		d_i2 <= '0' & '0' & n(9 downto 4);
--	end procedure wr_freq;

	-- procedure to write an attenuation register
--	procedure wr_attn ( ch : in integer range 0 to 7; a : in std_logic_vector(3 downto 0)) is
--		variable a_s : std_logic_vector(3 downto 0);
--	begin
--		d_i1 <= '1' & conv_std_logic_vector(ch, 2) & '1' & a;
--	end procedure wr_attn;

	begin
		if rising_edge(clk) then
			if rst='1' then
				d_i1 <= (others => DontCareValue);
				d_i2 <= (others => DontCareValue);
			else
				if we='1' then
					case address is
						when "000000000" => -- Tone 1 Frequency Register (6+4bits)
							d_i1 <= '1' & "000" & write(3 downto 0);
							d_i2 <= '0' & '0' & write(9 downto 4);
						when "000000001" => -- Tone 1 Attenuation Register (4bits)
							d_i1 <= '1' & "001" & write(3 downto 0);
							d_i2 <= (others => '0');
						when "000000010" => -- Tone 2 Frequency Register (6+4bits)
							d_i1 <= '1' & "010" & write(3 downto 0);
							d_i2 <= '0' & '0' & write(9 downto 4);
						when "000000011" => -- Tone 2 Attenuation Register (4bits)
							d_i1 <= '1' & "011" & write(3 downto 0);
							d_i2 <= (others => '0');
						when "000000100" => -- Tone 3 Frequency Register (6+4bits)
							d_i1 <= '1' & "100" & write(3 downto 0);
							d_i2 <= '0' & '0' & write(9 downto 4);
						when "000000101" => -- Tone 3 Attenuation Register (4bits)
							d_i1 <= '1' & "101" & write(3 downto 0);
							d_i2 <= (others => '0');    
						when "000000110" => -- Noise Register (1+2bits)
							d_i1 <= '1' & "110" & '1' & write(2 downto 0);
							d_i2 <= (others => '0');	
						when "000000111" => -- Noise Attenuation Register (4bits)
							d_i1 <= '1' & "111" & write(3 downto 0);
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
		clock_i    	=> clk,
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
--		clk			=> clk,
--		clk_en			=> clk_4M_en,
--		reset			=> rst,
--				
--		d			=> d,
--		ready			=> ready,
--		we_n			=> we_n,
--		ce_n			=> '0',
	  
--		audio_out		=> data_out
--	);
  	
end behave;
