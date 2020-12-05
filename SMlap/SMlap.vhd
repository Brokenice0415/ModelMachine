library ieee;
use ieee.std_logic_1164.all;

entity SMlap is
	port(CLK, EN: in std_logic;
		  SM: out std_logic);
end SMlap;

architecture struct of SMlap is
	signal temp: std_logic;
	begin
	process(CLK)
	begin
	if(CLK'event and CLK = '0')then
		if(EN = '1')then
			temp <= not temp;
		else
			temp <= temp;
		end if;
		
	end if;
	SM <= temp;
	end process;
end struct;	
		