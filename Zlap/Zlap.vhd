library ieee;
use ieee.std_logic_1164.all;

entity Zlap is
	port(CLK, Z_EN, Zi: in std_logic;
		  Zo: out std_logic);
end Zlap;

architecture struct of Zlap is
	begin
	process(CLK, Z_EN, Zi)
	begin
	if(Z_EN = '1')then
		if(CLK'event and CLK = '0')then
			Zo <= Zi;
		end if;
	end if;
	end process;
end struct;

	