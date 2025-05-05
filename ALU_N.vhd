ENTITY ALU_N IS
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	GENERIC(N: NATURAL := 8);
	PORT (	X, Y: IN BIT_VECTOR (N-1 downto 0);
		LD_IN: IN BIT_VECTOR (1 downto 0);
		CARRY_OUT, MSB, ZERO: OUT BIT;
		RESULT: OUT BIT_VECTOR (N-1 downto 0));
		
END ALU_N;

ARCHITECTURE HIBRIDA OF ALU_N IS

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
	COMPONENT OR_N
		PORT(A,B: IN BIT;
		S: OUT BIT);
		
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL CARRY_VECTOR: BIT_VECTOR(N-1 downto 0);
	SIGNAL LD: BIT_VECTOR(3 downto 0);
	SIGNAL RESULT_TEMP, TEMP_OR: BIT_VECTOR(N-1 downto 0);
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	-- 1° XOR operation
	
	DECODER: DECODER2X4 PORT MAP(LD_IN, LD);

	SLICE_0: BITSLICE_ALU1 PORT MAP(X(0), Y(0), '0', LD, RESULT_TEMP(0), CARRY_VECTOR(0));
	
	ITER: FOR I IN 1 TO N-2 GENERATE
		SLICE_I: BITSLICE_ALU1 PORT MAP(X(I), Y(I), CARRY_VECTOR(I-1), LD, RESULT_TEMP(I), CARRY_VECTOR(I));
	END GENERATE;
	
	SLICE_N: BITSLICE_ALU1 PORT MAP(X(N-1), Y(N-1), CARRY_VECTOR(N-2), LD, RESULT_TEMP(N-1), CARRY_OUT);
	
	RESULT 	<= RESULT_TEMP;
	MSB 	<= RESULT_TEMP(N-1);
	TEMP_OR(0) <= RESULT_TEMP(0);
	ITER2: FOR J IN 1 TO N-1 GENERATE
		OR_J: OR_N PORT MAP(TEMP_OR(J-1), RESULT_TEMP(J), TEMP_OR(J));
	END GENERATE;
	ZERO 	<= NOT TEMP_OR(N-1);

END HIBRIDA;
