LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
--USE ieee.std_logic_unsigned.all; 
--use ieee.std_logic_arith.all;
USE ieee.numeric_std.all; 

library work;

ENTITY conv_signed IS 
PORT( 
	in_signed 		: IN signed (7 downto 0); 
	out_stdlogic 	: OUT std_logic_vector (7 downto 0) 
); 
END conv_signed; 

ARCHITECTURE struct OF conv_signed IS 
begin 

  convert: process (in_signed)
  --variable val : unsigned(7 downto 0);
  begin
      --val := unsigned(in_signed+127);
		--out_stdlogic <= std_logic_vector(val);
		out_stdlogic <= std_logic_vector(unsigned(in_signed + 128));
		--out_stdlogic <= conv_std_logic_vector(in_signed,8);
 end process convert;

--label1: for i in 0 to out_stdlogic'LENGTH-1 generate 
--	out_stdlogic(i) <= in_signed(i); 
--end generate label1; 
END struct;
