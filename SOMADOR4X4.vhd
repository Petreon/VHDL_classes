-- Como esse componente funciona:
-- 

ENTITY SOMADOR4X4 IS
	-- definindo variavel generica qu etme que ser passada como parametro
	-- na construcao do componente
	--GENERIC(N: NATURAL := 8);
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	A_NUM, B_NUM, C_NUM, D_NUM: IN BIT_VECTOR(3 downto 0);
		RESULT: 	OUT BIT_VECTOR(4 downto 0); -- 5 bits
		CARRY_OUT:	OUT BIT);
END SOMADOR4X4;

ARCHITECTURE ESTRUTURA OF SOMADOR4X4 IS
	-- declarando o uso do FULLADDER:
	COMPONENT FULLADDER
		-- Mapeando as portas do fullhadder
		-- A 1°BIT, 2° bit, VE carry out vem um
		-- S: RESULTADO, VA: CARRY OUT RESULT
		PORT(A , B, VE: IN BIT;
			S, VA: OUT BIT);
	END COMPONENT;
	-- declarando o uso do somador4
	COMPONENT SOMADOR4
		PORT (	A_NUM, B_NUM: 	IN BIT_VECTOR(3 downto 0);
		RESULT: 	OUT BIT_VECTOR(3 downto 0);
		CARRY_OUT:	OUT BIT);
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL SUM_1, SUM_2: BIT_VECTOR(3 downto 0);
	SIGNAL OVF_1, OVF_2, OVF_3: BIT;
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando
	SOMADOR_1: SOMADOR4 PORT MAP(A_NUM, B_NUM, SUM_1, OVF_1);
	SOMADOR_2: SOMADOR4 PORT MAP(C_NUM, D_NUM, SUM_2, OVF_2);
	SOMADOR_3: SOMADOR4 PORT MAP(SUM_1, SUM_2, RESULT(3 downto 0), OVF_3);
	FA_1: FULLADDER PORT MAP(OVF_1, OVF_2, OVF_3, RESULT(4), CARRY_OUT);

END ESTRUTURA;

