library ieee;
use ieee.std_logic_1164.all;

entity IRlap is
	port(IR_LD, CLK: in std_logic;
		  IRi: in std_logic_vector(7 downto 0);
		  IRo: out std_logic_vector(7 downto 0));
end IRlap;

architecture struct of IRlap is
	begin
	process(CLK)
	begin
	if(CLK'event and CLK = '0')then--下降沿
		if(IR_LD = '1')then
			IRo <= IRi;
		end if;
	end if;
	end process;
end struct;