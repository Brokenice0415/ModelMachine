library ieee;
use ieee.std_logic_1164.all;

entity SELECTlap is
	port(MADD: in std_logic_vector(1 downto 0);
		  PCi, Ai, Bi: in std_logic_vector(7 downto 0);
		  out1: out std_logic_vector(7 downto 0));
end SELECTlap;

architecture struct of SELECTlap is
	begin
	process(MADD)
	begin
	case MADD is
		when "00" =>
			out1 <= PCi;
		when "01" =>
			out1 <= Ai;
		when "10" =>
			out1 <= Bi;
		when "11" =>
			out1 <= "ZZZZZZZZ";
	end case;
	end process;
end struct;