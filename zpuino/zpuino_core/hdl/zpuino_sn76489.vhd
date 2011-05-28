-- SN76489 interface IO module for ZPUino

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

library work;
--use work.zpu_config.all;
--use work.zpupkg.all;
--use work.zpuinopkg.all;

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

  signal clk_4M_en  : std_logic := '0';
  signal predivcnt	: integer;
  constant PRE_CLOCK_DIVIDER: integer := 24;
  
  signal d          : std_logic_vector(7 downto 0) := (others => '0');
  signal we_n       : std_logic := '0';
  signal ready 		: std_logic;
  signal d_i1		: std_logic_vector(7 downto 0) := (others => '0');
  signal d_i2		: std_logic_vector(7 downto 0) := (others => '0');
 
 -- define the states of FSM model
  type state_type is (idle, writeReg, waitReady, writeReg2, waitReady2);
  signal next_state, current_state: state_type;  
  
begin

	-- Tie busy to '0', we're never busy
	--busy <= '0';
	-- Tie interrupt to '0', we never interrupt
	interrupt <= '0';

	-- generate 4MHz clock
	predivider: process(clk,rst)
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

	-- FSM : set current state
	state_reg: process(clk)
   begin
     if (clk'event and clk='1') then
		  if (rst='1') then
				current_state <= idle;
		  else
				current_state <= next_state;
		  end if;
     end if;
   end process;	

    -- FSM : combinational logic
    comb_logic: process(current_state, ready, d_i1, d_i2, we, address)
    begin

		-- use case statement to show the state transistion
		case current_state is	 
			 when idle =>	-- nothing to latch
				  d <= (others => '0');
				  we_n <= '1';
				  busy <= '0';
				if we='0' then 
					 next_state <= idle;
				else
					 next_state <= writeReg;
				end if;	        
			 when writeReg =>	-- we is high
				  d <= d_i1;
				  we_n <= '0';
				  busy <= '1';
				if ready='1' then 
					 next_state <= waitReady;
				else
					 next_state <= writeReg;
				end if;
			 when waitReady => -- the SN is ready to latch data	
				  d <= d_i1;
				  we_n <= '1';
				  busy <= '1';
				if ready='1' then
					 next_state <= waitReady;
				else
					case address is
					  when "000000000" => 
						next_state <= writeReg2;				
					  when "000000010" => 
						next_state <= writeReg2;
					  when "000000100" =>
						next_state <= writeReg2;                                    
					  when others =>
						next_state <= idle;
					end case;			
				end if;	
			 when writeReg2 =>	-- we is high
				  d <= d_i2;
				  we_n <= '0';
				  busy <= '1';
				if ready='1' then 
					 next_state <= waitReady2;
				else
					 next_state <= writeReg2;
				end if;
			 when waitReady2 =>	
				  d <= d_i2;
				  we_n <= '1';
				  busy <= '1';
				if ready='1' then
					 next_state <= waitReady2;
				else			
					 next_state <= idle;
				end if;				
			 when others =>
				  d <= (others => '0');
				  we_n <= '1';
				  busy <= '0';
		end case;
    end process;

	-- Main process

	process(clk)

	-- procedure to write a frequency register
	procedure wr_freq ( ch : in integer range 0 to 2; n  : in std_logic_vector(9 downto 0)) is
		variable n_s : std_logic_vector(9 downto 0);
	begin
		d_i1 <= '1' & conv_std_logic_vector(ch, 2) & '0' & n(3 downto 0);
		d_i2 <= '0' & '0' & n(9 downto 4);
	end procedure wr_freq;

	-- procedure to write an attenuation register
	procedure wr_attn ( ch : in integer range 0 to 7; a : in std_logic_vector(3 downto 0)) is
		variable a_s : std_logic_vector(3 downto 0);
	begin
		d_i1 <= '1' & conv_std_logic_vector(ch, 2) & '1' & a;
	end procedure wr_attn;
		

	begin
	  if rising_edge(clk) then
		if rst='1' then
		  d_i1 <= (others => '0');
		  d_i2 <= (others => '0');
		else
		  if we='1' then
			case address is
			  when "000000000" => -- Tone 1 Frequency Register (6+4bits)
				wr_freq(0, write(9 downto 0));
			  when "000000001" => -- Tone 1 Attenuation Register (4bits)
				wr_attn(0, write(3 downto 0));
			  when "000000010" => -- Tone 2 Frequency Register (6+4bits)
				wr_freq(1, write(9 downto 0));
			  when "000000011" => -- Tone 2 Attenuation Register (4bits)
				wr_attn(1, write(3 downto 0));  
			  when "000000100" => -- Tone 3 Frequency Register (6+4bits)
				wr_freq(2, write(9 downto 0));
			  when "000000101" => -- Tone 3 Attenuation Register (4bits)
				wr_attn(2, write(3 downto 0));     
			  when "000000110" => -- Noise Register (1+2bits)
				d_i1 <= '1' & "110" & '1' & write(2 downto 0);
			  when "000000111" => -- Noise Attenuation Register (4bits)
				wr_attn(7, write(3 downto 0));                                        
			  when others =>
			end case;
		  end if;
		end if;
	  end if;
	end process;

	sn76489_inst : entity work.sn76489
	generic map
	(
	  AUDIO_RES   => 8
	)
	port map
	(
		clk					=> clk,
		clk_en				=> clk_4M_en,
		reset				=> rst,
					
		d					=> d,
		ready				=> ready,
		we_n				=> we_n,
		ce_n				=> '0',
	  
		audio_out			=> data_out
	);
  	
end behave;
