library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity PClap is
	port (LD_PC, IN_PC, CLK: in std_logic;
			Ci: in std_logic_vector(7 downto 0);
			Co: out std_logic_vector(7 downto 0));
end PClap;

architecture struct of PClap is	
	signal prevPC: std_logic_vector(7 downto 0);
	
	begin
	
	process(CLK)
	begin
	if(CLK'event and CLK = '0')then
		if(IN_PC = '1' and LD_PC = '0')then
			prevPC <= prevPC + "00000001";
		elsif(IN_PC = '0' and LD_PC = '1')then
			prevPC <= Ci;
		end if;
	end if;
	Co <= prevPC;
	end process;
	

end struct;
	
	
			