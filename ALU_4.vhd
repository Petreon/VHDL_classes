ENTITY ALU_4BITS IS
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	X, Y: IN BIT_VECTOR (3 downto 0);
		LD_IN: IN BIT_VECTOR (1 downto 0);
		CARRY_OUT, MSB, ZERO: OUT BIT;
		RESULT: OUT BIT_VECTOR (3 downto 0));
		
END ALU_4BITS;

ARCHITECTURE HIBRIDA OF ALU_4BITS IS

	-- é preciso declarar como o Halfadder funciona
	COMPONENT BITSLICE_ALU1
		-- Mapeando as portas do HalfAdder
			PORT (	X, Y, CARRY_IN : IN BIT;
		LD_IN: IN BIT_VECTOR (3 downto 0);
		RESULT, CARRY_OUT: OUT BIT); 
		
	END COMPONENT;

	COMPONENT DECODER2X4
		-- Mapeando as portas do HalfAdder
		PORT (	INPUT: IN BIT_VECTOR (1 downto 0);
			LD_OUT: OUT BIT_VECTOR (3 downto 0)); -- 4 bits output, every bit represents a output alone only one bit is 1
		
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL CARRY_VECTOR: BIT_VECTOR(2 downto 0);
	SIGNAL RESULT_TEMP, LD: BIT_VECTOR(3 downto 0);
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	-- 1° XOR operation
	
	DECODER: DECODER2X4 PORT MAP(LD_IN, LD);

	SLICE_0: BITSLICE_ALU1 PORT MAP(X(0), Y(0), '0', LD, RESULT_TEMP(0), CARRY_VECTOR(0));
	SLICE_1: BITSLICE_ALU1 PORT MAP(X(1), Y(1), CARRY_VECTOR(0), LD, RESULT_TEMP(1), CARRY_VECTOR(1));
	SLICE_2: BITSLICE_ALU1 PORT MAP(X(2), Y(2), CARRY_VECTOR(1), LD, RESULT_TEMP(2), CARRY_VECTOR(2));
	SLICE_3: BITSLICE_ALU1 PORT MAP(X(3), Y(3), CARRY_VECTOR(2), LD, RESULT_TEMP(3), CARRY_OUT);
	
	RESULT 	<= RESULT_TEMP;
	MSB 	<= RESULT_TEMP(3);
	ZERO 	<= NOT (RESULT_TEMP(0) OR RESULT_TEMP(1) OR RESULT_TEMP(2) OR RESULT_TEMP(3));

END HIBRIDA;
