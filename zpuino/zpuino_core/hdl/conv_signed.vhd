LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_unsigned.all; 
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

label1: for i in 0 to out_stdlogic'LENGTH-1 generate 
	out_stdlogic(i) <= in_signed(i); 
end generate label1; 
END struct;
