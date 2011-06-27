--
--  3r party package
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuino_config.all;

package papiliochippkg is

	-- Yamaha 2149
	component zpuino_io_YM2149 is
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
	end component zpuino_io_YM2149;

	-- Atari Pokey
	component zpuino_io_POKEY is
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
	end component zpuino_io_POKEY;
	
	component zpuino_io_SN76489 is
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
	end component zpuino_io_SN76489;	
  
	-- Audio mixer 3 voices
	component zpuino_io_audiomixer is
	port (
		clk:      	in std_logic;
		rst:      	in std_logic;
		ena:		in std_logic;
		
		data_in1:  	in std_logic_vector(7 downto 0);
		data_in2:  	in std_logic_vector(7 downto 0);
		data_in3:  	in std_logic_vector(7 downto 0);

		audio_out: 	out std_logic
	);
	end component zpuino_io_audiomixer;  
	
	-- Audio mixer 6 voices	
	component zpuino_io_audiomixer6 is
	port (
		clk:      	in std_logic;
		rst:      	in std_logic;
		ena:		in std_logic;
		
		data_in1:  	in std_logic_vector(7 downto 0);
		data_in2:  	in std_logic_vector(7 downto 0);
		data_in3:  	in std_logic_vector(7 downto 0);
		data_in4:  	in std_logic_vector(7 downto 0);
		data_in5:  	in std_logic_vector(7 downto 0);
		data_in6:  	in std_logic_vector(7 downto 0);
			
		audio_out: 	out std_logic
		);
	end component zpuino_io_audiomixer6;	

end package papiliochippkg;
