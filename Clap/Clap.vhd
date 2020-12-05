library ieee;
use ieee.std_logic_1164.all;

entity Clap is
	port(CLK, C_EN, Ci: in std_logic;
		  Co: out std_logic);
end Clap;

architecture struct of Clap is
	begin
	process(CLK, C_EN, Ci)
	begin
	if(C_EN = '1')then
		if(CLK'event and CLK = '0')then
			Co <= Ci;
		end if;
	end if;
	end process;
end struct;

	