library ieee;
use ieee.std_logic_1164.all;

entity SHFlap is
	port( FBUS, FL, FR: in std_logic;
			A: in std_logic_vector(7 downto 0);
			CF: out std_logic;
			W: out std_logic_vector(7 downto 0));
end SHFlap;

architecture struct of SHFlap is
	
	signal shift : std_logic_vector(7 downto 0);
	
	begin
	process(FBUS, FL, FR, A)
	begin
		if(FBUS = '0')then
			shift <= "ZZZZZZZZ";
			CF <= '0';
		elsif(FL = '1')then
			shift <= A(6 downto 0) & A(7);
			CF <= A(7);
		elsif(FR = '1')then
			shift <= A(0) & A(7 downto 1);
			CF <= A(0);
		else
			shift <= A;
			CF <= '0';
		end if;
		W <= shift;
	end process;
end struct;
			
		