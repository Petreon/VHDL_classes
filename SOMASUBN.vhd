ENTITY SOMASUBN IS
	-- definindo variavel generica qu etme que ser passada como parametro
	-- na construcao do componente
	GENERIC(N: NATURAL := 8);
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	A_NUM, B_NUM: 	IN BIT_VECTOR(3 downto 0);
		OPERATION: 	IN BIT;
		RESULT: 	OUT BIT_VECTOR(3 downto 0); -- 5 bits
		FLAG:		OUT BIT); -- tambem significa overflow
END SOMASUBN;

ARCHITECTURE ESTRUTURA OF SOMASUBN IS

	-- declarando o uso do FUlladder
	COMPONENT SOMADORN_CI
		GENERIC(N: NATURAL);
		PORT (	A_NUM, S_NUM: 		IN BIT_VECTOR(N-1 downto 0);
			OPERATION: 		IN BIT;
			RESULT: 		OUT BIT_VECTOR(N-1 downto 0); -- 5 bits
			OVF_SINAL, OVF_MAG:	OUT BIT); -- tambem significa overflow
	
	END COMPONENT;

	COMPONENT XOR_ARRAYN_SOMASUB
		GENERIC(N: NATURAL);
		PORT (	B_NUM: 		IN BIT_VECTOR(N-1 downto 0);
		OPERATION: 		IN BIT;
		RESULT: 		OUT BIT_VECTOR(N-1 downto 0)); -- 4 bits
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL XOR_B_CARRY: BIT_VECTOR(N-1 downto 0);
	SIGNAL OVF_SIN, OVF_MAG: BIT;
-- Come�a a logica do somador4x4
BEGIN
	-- A partir daqui s�o os valores que estao entrando  
	XOR_ARRAY: XOR_ARRAYN_SOMASUB GENERIC MAP(N) PORT MAP(B_NUM, OPERATION, XOR_B_CARRY);
	SPECIAL_SOMADOR: SOMADORN_CI GENERIC MAP(N) PORT MAP(A_NUM, XOR_B_CARRY, OPERATION, RESULT, OVF_SIN, OVF_MAG);
	FLAG <= OVF_SIN XOR OVF_MAG;

END ESTRUTURA;
