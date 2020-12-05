library ieee;
use ieee.std_logic_unsigned.all,ieee.std_logic_1164.all;

entity ALUlap is
	port (A, B: in std_logic_vector(7 downto 0);
			S: in std_logic_vector(3 downto 0);
			M: in std_logic;
			T: out std_logic_vector(7 downto 0);
			CF, ZF: out std_logic);
end ALUlap;

architecture struct of ALUlap is
--	signal carry: std_logic_vector(7 downto 0);
--	
--	begin
--	process(S,M,A,B)
--	
--		variable temp_T: std_logic_vector(7 downto 0);
--		variable SUB_en: std_logic;
--		
--		begin
--		if(M = '0')then
--			T <= "ZZZZZZZZ";
--			CF <= '0';
--			ZF <= '0';
--		elsif(S = "1001")then--加
--			temp_T(0) := A(0) xor B(0);
--			carry(0) <= A(0) and B(0);
--			for i in 1 to 7 loop
--				temp_T(i) := (A(i) xor B(i)) xor carry(i-1);
--				carry(i) <= (A(i) and B(i)) or (carry(i-1) and (A(i) xor B(i)));
--			end loop;
--			CF <=  carry(7);
--			
--			if(temp_T = "00000000")then
--				ZF <= '1';
--			else
--				ZF <= '0';
--			end if;
--			
--			T <= temp_T;
--			
--		elsif(S = "0110")then--减
--			temp_T(0) := A(0) xor B(0);
--			carry(0) <= (not A(0)) and B(0);
--			for i in 1 to 7 loop
--				temp_T(i) := (A(i) xor B(i)) xor carry(i-1);
--				carry(i) <= ((not A(i)) and B(i)) or (carry(i-1) and (not(A(i) xor B(i))));
--			end loop;
--			CF <= carry(7);
--			
--			SUB_en := '0';--判断反码改变的位置使能
--			
--			for i in 0 to 7 loop
--				temp_T(i) := temp_T(i) xor SUB_en;
--				if(temp_T(i) = '1')then
--					SUB_en := '1';
--				end if;
--			end loop;
--			
--			if(temp_T = "00000000")then
--				ZF <= '1';
--			else
--				ZF <= '0';
--			end if;
--			
--			T <= temp_T;
--			
--		elsif(S = "1110")then
--			T <= A and B;
--			CF <= '0';
--			ZF <= '0';
--		elsif(S = "0101")then
--			T <= not A;
--			CF <= '0';
--			ZF <= '0';
--		else 
--			T <= "ZZZZZZZZ";
--			CF <= '0';
--			ZF <= '0';
--		end if;
--	end process;
	begin
	process(M,S,A,B)
	variable temp:std_logic_vector(8 downto 0);
	 begin
	 if (S="1001" and M='1') then
	    temp:=('0'& A)+('0'& B);
	  elsif (S="0110" and M='1') then
	    temp:=('0'& A)-('0'& B);
	  elsif (S="0000" and M='1') then
	    temp:=('0'& A) and ('0'& B);
	  elsif (S="1011" and M='1') then
	    temp:=('0'& A) or ('0'& B);
	  elsif (S="0101" and M='1') then
	    temp:= '0' & (not A);
	  elsif (S="1111" and M='0') then
	    temp:='0'& B;
	  else
	    temp:='0'& A;
	  end if;
	  if temp="000000000" then 
         ZF<='1';
      else
         ZF<='0';
      end if;
      CF<=temp(8);
      T<=temp(7 downto 0);
     end process;
end struct;