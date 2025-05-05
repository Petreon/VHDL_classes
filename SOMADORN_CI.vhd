ENTITY SOMADORN_CI IS
	-- definindo variavel generica qu etme que ser passada como parametro
	-- na construcao do componente
	GENERIC(N: NATURAL := 4);
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	A_NUM, S_NUM: 		IN BIT_VECTOR(N-1 downto 0);
		OPERATION: 		IN BIT;
		RESULT: 		OUT BIT_VECTOR(N-1 downto 0); -- 5 bits
		OVF_SINAL, OVF_MAG:	OUT BIT); -- tambem significa overflow
	
END SOMADORN_CI;

ARCHITECTURE ESTRUTURA OF SOMADORN_CI IS

	-- declarando o uso do FUlladder
	COMPONENT FULLADDER
		PORT (	A, B, VE: IN BIT;
			S, VA: OUT BIT	);
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL CARRY_VECTOR: BIT_VECTOR(N-1 downto 1);
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	FA_0: FULLADDER PORT MAP(A_NUM(0), S_NUM(0), OPERATION, RESULT(0), CARRY_VECTOR(1));

	ITER: FOR I IN 1 TO N-2 GENERATE
		FA_1: FULLADDER PORT MAP(A_NUM(I), S_NUM(I), CARRY_VECTOR(I), RESULT(I), CARRY_VECTOR(I+1));
	END GENERATE;
	
	--FA_2: FULLADDER PORT MAP(A_NUM(2), S_NUM(2), CARRY_VECTOR(2), RESULT(2), CARRY_VECTOR(3));
	FA_N: FULLADDER PORT MAP(A_NUM(N-1), S_NUM(N-1), CARRY_VECTOR(N-1), RESULT(N-1), OVF_SINAL);

	OVF_MAG <= CARRY_VECTOR(N-1);
END ESTRUTURA;
