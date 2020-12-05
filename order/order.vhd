library ieee;
use ieee.std_logic_1164.all;

entity order is
	port(EN: in std_logic;
		  IR: in std_logic_vector(7 downto 0);
		  MOVA, MOVB, MOVC, ADD, SUB, AND0, OR0, NOT0, SHR, SHL, JMP, JZ,
		  JC, IN0, OUT0, NOP, HALT: out std_logic);
end order;


architecture struct of order is
	signal code: std_logic_vector(8 downto 0);
	signal kind: std_logic_vector(4 downto 0);
	begin
		code <= EN&IR;
		kind <= EN&IR(7 downto 4);
		with code select
			MOVA <= '1' when "111110001",
					  '1' when "111110010",
					  '1' when "111110100",
					  '1' when "111110110",
					  '1' when "111111000",
					  '1' when "111111001",
					  '0' when others;
		with code select
			MOVB <= '1' when "111111100",
					  '1' when "111111101",
					  '1' when "111111110",
					  '0' when others;
		with code select
			MOVC <= '1' when "111110011",
					  '1' when "111110111",
					  '1' when "111111011",
					  '0' when others;
		with kind select
			ADD  <= '1' when "11001",
					  '0' when others;
		with kind select
			SUB  <= '1' when "10110",
					  '0' when others;
		with kind select
			OR0  <= '1' when "11011",
					  '0' when others;
		with kind select
			AND0 <= '1' when "10000",
					  '0' when others;
		with kind select
			NOT0 <= '1' when "10101",
					  '0' when others;
		with code select
			SHR  <= '1' when "110100000",
					  '1' when "110100100",
					  '1' when "110101000",
					  '1' when "110101100",
					  '0' when others;
		with code select
			SHL  <= '1' when "110100011",
					  '1' when "110100111",
					  '1' when "110101011",
					  '1' when "110101111",
					  '0' when others;
		with code select
			JMP  <= '1' when "100010000",
					  '0' when others;
		with code select
			JZ   <= '1' when "100010001",
					  '0' when others;
		with code select
			JC   <= '1' when "100010010",
					  '0' when others;
		with kind select
			IN0  <= '1' when "10010",
					  '0' when others;
		with kind select
			OUT0 <= '1' when "10100",
					  '0' when others;
		with code select
			NOP  <= '1' when "101110000",
					  '0' when others;
		with code select
			HALT <= '1' when "110000000",
					  '0' when others;
--begin
--   process(EN,IR)
--	variable tmp: std_logic_vector(16 downto 0);
--	begin
--	tmp:="00000000000000000";
--	IF EN='1' THEN 
--	if IR(7 downto 4)="1111" then 
--		if IR(3 downto 2)="11" then tmp(1):='1';
--	    elsif IR(1 downto 0)="11" then tmp(2):='1';
--	    else  tmp(0):='1';
--		end if;
--	elsif IR(7 downto 4)="1001"then
--		tmp(3) := '1';
--	elsif IR(7 downto 4)="0110"then
--		tmp(4) := '1';
--	elsif IR(7 downto 4)="0000" then
--		tmp(5):='1';
--	elsif IR(7 downto 4)="1011"then
--		tmp(6) := '1';
--	elsif IR(7 downto 4)="0101" then
--		tmp(7):='1';
--	elsif IR(7 downto 4)="1010" then
--		if IR(1 downto 0)="11" then tmp(9):='1';
--		else tmp(8):='1';
--        end if;
--	elsif IR="00010000" then
--		tmp(10):='1';
--	elsif IR="00010001" then
--		tmp(11):='1';
--	elsif IR="00010010" then
--		tmp(12):='1';
--	elsif IR(7 downto 4)="0010" then
--		tmp(13):='1';
--	elsif IR(7 downto 4)="0100" then
--		tmp(14):='1';
--	elsif IR="01110000" then
--		tmp(15):='1';
--	elsif IR="10000000" then
--		tmp(16):='1';
--	end if;
--	ELSE
--	 tmp:="00000000000000000";
--	end if; 
--	
--	MOVA<=tmp(0);
--	MOVB<=tmp(1);
--	MOVC<=tmp(2);	
--	ADD<=tmp(3);
--	SUB<=tmp(4);
--	AND0<=tmp(5);
--	OR0<=tmp(6);
--	NOT0<=tmp(7);
--	SHR<=tmp(8);
--	SHL<=tmp(9);
--	JMP<=tmp(10);
--	JZ<=tmp(11);
--	JC<=tmp(12);
--	IN0<=tmp(13);
--	OUT0<=tmp(14);
--	NOP<=tmp(15);
--	HALT<=tmp(16);
--	
--	end process;
end struct;