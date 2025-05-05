ENTITY XOR_ARRAYN_SOMASUB IS
	-- definindo variavel generica qu etme que ser passada como parametro
	-- na construcao do componente
	GENERIC(N: NATURAL := 4);
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	B_NUM: 		IN BIT_VECTOR(N-1 downto 0);
		OPERATION: 		IN BIT;
		RESULT: 		OUT BIT_VECTOR(N-1 downto 0)); -- 4 bits
		--OVF_SINAL, OVF_MAG:	OUT BIT); -- tambem significa overflow
	
END XOR_ARRAYN_SOMASUB;

ARCHITECTURE FLUXO OF XOR_ARRAYN_SOMASUB IS
	
BEGIN
	ITER: FOR I IN 0 TO N-1 GENERATE
		XOR_I: RESULT(I) <= B_NUM(I) XOR OPERATION;
	END GENERATE;
END FLUXO;
