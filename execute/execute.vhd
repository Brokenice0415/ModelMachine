library ieee;
use ieee.std_logic_1164.all;

entity execute is
	port(MOVA, MOVB, MOVC, ADD, SUB, AND0, OR0, NOT0,
		  SHR, SHL, JMP, JZ, JC, IN0, OUT0, NOP, HALT: in std_logic;
		  
		  Z, C, SM: in std_logic; --SM 0 取址 1 执行
		  
		  IR: in std_logic_vector(7 downto 0);
		  
		  GENERAL_RA, GENERAL_WA, SELECT_MADD: out std_logic_vector(1 downto 0);
		  
		  SM_EN: out std_logic;
		  
		  ALU_S: out std_logic_vector(3 downto 0);
		  PC_LD, PC_INC, GENERAL_WE, RAM_WL, RAM_RL, RAM_CS, 
		  ALU_M, SHIFT_FBUS, SHIFT_FR, SHIFT_FL, IR_LD, 
		  CF_EN, ZF_EN: out std_logic);
		  
end execute;

architecture struct of execute is
--	signal mov: std_logic_vector(3 downto 0);
	begin
	process(IR)
	begin
--		mov <= SM & MOVA & MOVB & MOVC;
	
		PC_INC <= (not SM) or ((( JC and (not C) ) or (JZ and (not Z))) and SM); 
		PC_LD <= (JMP or (JC and C) or (JZ and Z)) and SM;
		
		ALU_S <= IR(7 downto 4);
--		ALU_M <= (ADD or SUB or AND0 or NOT0) and SM;
		if(ADD = '1' or SUB = '1' or AND0 = '1' or OR0 = '1' or NOT0 = '1')then
			ALU_M<='1';
		else ALU_M<='0';
		end if;
		
		GENERAL_WE <= MOVA or MOVC or ADD or SUB or AND0 or OR0 or NOT0 or SHR or SHL or IN0;
		RAM_RL <= (not SM) or  MOVC or JMP or (C and JC) or (Z and JZ) ;
		RAM_WL <= MOVB; --WL与RL不同时为1
		SHIFT_FBUS <= MOVA or MOVB or ADD or SUB or AND0 or OR0 or NOT0 or SHL or SHR or OUT0;
		RAM_CS <= not ((ADD or SUB or AND0 or OR0 or NOT0 or SHR or SHL) and SM);--低电平有效 RAM与SHIFT不同时输出
		SHIFT_FR <= SHR;
		SHIFT_FL <= SHL;
		
		IR_LD <= not SM; -- 取址时有效
		
		CF_EN <= ADD or SUB or AND0 or OR0 or SHR or SHL;--ADD进位或SUB借位使其为1 或 SHR或SHL 中移过去是什么就是什么
		ZF_EN <= ADD or SUB or AND0 or OR0; --ADD或SUB操作得到0使使其为1
		SM_EN <= not HALT;--停机时SM无效
		
		if(SM = '0')then
			SELECT_MADD <= "00";
		elsif(MOVC = '1')then
			SELECT_MADD <= "01";
		elsif(MOVB = '1')then
			SELECT_MADD <= "10";
		else
			SELECT_MADD <= "00";
		end if;
--		with mov select
--			SELECT_MADD <= "10" when "1010",
--								"01" when "1001",
--								"00" when others;
		
		GENERAL_RA <= IR(1 downto 0);
		
		GENERAL_WA <= IR(3 downto 2);
	end process;
end struct;