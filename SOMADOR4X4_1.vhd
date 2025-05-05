-- Como esse componente funciona:
-- 

ENTITY SOMADOR4X4_1 IS
	-- definindo variavel generica qu etme que ser passada como parametro
	-- na construcao do componente
	--GENERIC(N: NATURAL := 8);
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	A_NUM, B_NUM, C_NUM, D_NUM: IN BIT_VECTOR(3 downto 0);
		RESULT: 	OUT BIT_VECTOR(4 downto 0); -- 5 bits
		CARRY_OUT:	OUT BIT); -- tambem significa overflow
END SOMADOR4X4_1;

ARCHITECTURE ESTRUTURA OF SOMADOR4X4_1 IS

	-- declarando o uso do somador4
	COMPONENT SOMADORN
		GENERIC(N: NATURAL);
		PORT (	A_NUM, B_NUM: 	IN BIT_VECTOR(N-1 downto 0);
			RESULT: 	OUT BIT_VECTOR(N-1 downto 0);
			CARRY_OUT:	OUT BIT);
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL SUM_1, SUM_2: BIT_VECTOR(4 downto 0);
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando
	SOMADOR_1: SOMADORN GENERIC MAP(4) PORT MAP(A_NUM, B_NUM, SUM_1(3 downto 0), SUM_1(4));
	SOMADOR_2: SOMADORN GENERIC MAP(4) PORT MAP(C_NUM, D_NUM, SUM_2(3 downto 0), SUM_2(4));
	SOMADOR_3: SOMADORN GENERIC MAP(5) PORT MAP(SUM_1, SUM_2, RESULT, CARRY_OUT);

END ESTRUTURA;
