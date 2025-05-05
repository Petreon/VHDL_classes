ENTITY BITSLICE_ALU1 IS
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	X, Y, CARRY_IN : IN BIT;
		LD_IN: IN BIT_VECTOR (3 downto 0);
		RESULT, CARRY_OUT: OUT BIT); 
		
END BITSLICE_ALU1;

ARCHITECTURE HIBRIDA OF BITSLICE_ALU1 IS

	-- é preciso declarar como o Halfadder funciona
	COMPONENT LOGICUNIT_1
		-- Mapeando as portas do HalfAdder
			PORT (	X, Y : IN BIT;
		LD_IN: IN BIT_VECTOR (2 downto 0); -- 3 bits input, every bit represents a output alone only one bit is 1
		R_AND, R_OR, R_NOT: OUT BIT); 
		
	END COMPONENT;

	COMPONENT SOMADOR_ALU1_1
		-- Mapeando as portas do HalfAdder
		PORT (	X, Y, CARRY_IN, LD_IN : IN BIT;
			SUM, CARRY_OUT: OUT BIT); 
		
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL R_AND, R_OR, R_NOT, SUM: BIT;
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	-- 1° XOR operation
	UNIT_LOGIC: LOGICUNIT_1 PORT MAP(X, Y, LD_IN(2 downto 0), R_AND, R_OR, R_NOT);
	UNIT_ARITMETIC: SOMADOR_ALU1_1 PORT MAP(X, Y, CARRY_IN, LD_IN(3), SUM, CARRY_OUT);
	RESULT <= R_AND OR R_OR OR R_NOT OR SUM;
	

END HIBRIDA;
