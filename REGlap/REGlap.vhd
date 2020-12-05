--library ieee;
--use ieee.std_logic_1164.all;
--
--entity REGlap is
--	port(WE, CLK: in std_logic;
--		  RA, WA: in std_logic_vector(1 downto 0);
--		  Ii: in std_logic_vector(7 downto 0);
--		  Ao, Bo: out std_logic_vector(7 downto 0));
--end REGlap;
--
--architecture struct of REGlap is
--	signal inA,inB,inC: std_logic_vector(7 downto 0);
--	begin
--	
--	choose:process(CLK,WE,RA,WA)
--	begin
--	if(WE = '1')then
--		case RA is
--			when "00" =>
--				Ao <= inA;
--			when "01" =>
--				Ao <= inB;
--			when "10" =>
--				Ao <= inC;
--			when "11" =>
--				Bo <= inC;
--		end case;
--		
--		case WA is
--			when "00" =>
--				Bo <= inA;
--			when "01" =>
--				Bo <= inB;
--			when "10" =>
--				Bo <= inC;
--			when "11" =>
--				Bo <= inC;
--		end case;
--
--	elsif(CLK'event and CLK = '0')then
--		case WA is
--			when "00" =>
--				inA <= Ii;
--			when "01" =>
--				inB <= Ii;
--			when "10" =>
--				inC <= Ii;
--			when "11" =>
--				inC <= Ii;
--		end case;
--	end if;
--	end process;
--end struct;

library ieee;
use ieee.std_logic_1164.all;

entity REGlap is
	port(WE, CLK: in std_logic;
		  RA, WA: in std_logic_vector(1 downto 0);
		  Ii: in std_logic_vector(7 downto 0);
		  Ao, Bo: out std_logic_vector(7 downto 0);
		  Areg, Breg, Creg: out std_logic_vector(7 downto 0));
end REGlap;

architecture struct of REGlap is
	signal inA,inB,inC: std_logic_vector(7 downto 0);
	begin
--	with RA select
--		Ao <=	inA when "00",
--			   inB when "01",
--				inC when others;
--	with WA select
--		Bo <= inA when "00",
--			   inB when "01",
--				inC when others;
				
	choose:process(CLK,WE)
	begin
	case WA is
		when "00" =>
			Ao <= inA;
		when "01" =>
			Ao <= inB;
		when "10" =>
			Ao <= inC;
		when "11" =>
			Ao <= inC;
	end case;
	
	case RA is
		when "00" =>
			Bo <= inA;
		when "01" =>
			Bo <= inB;
		when "10" =>
			Bo <= inC;
		when "11" =>
			Bo <= inC;
	end case;
	
	if(WE = '1')then
		if(CLK'event and CLK = '0')then
			case WA is
				when "00" =>
					inA <= Ii;
				when "01" =>
					inB <= Ii;
				when "10" =>
					inC <= Ii;
				when "11" =>
					inC <= Ii;
			end case;
		end if;
	end if;
	end process;
	Areg <= inA;
	Breg <= inB;
	Creg <= inC;
end struct;