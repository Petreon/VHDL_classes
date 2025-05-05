-- Exemplo copiado da professora adicionando parametros para o componenente
-- exemplo para if cases

ENTITY SOMADORN1 IS
	-- definindo variavel generica qu etme que ser passada como parametro
	-- na construcao do componente
	GENERIC(N: NATURAL := 8);
	PORT (	A_NUM, B_NUM: 	IN BIT_VECTOR(N-1 downto 0);
		RESULT: 	OUT BIT_VECTOR(N-1 downto 0);
		CARRY_OUT:	OUT BIT);
END SOMADORN1;

ARCHITECTURE ESTRUTURA OF SOMADORN1 IS
	-- declarando o uso do FULLADDER:
	COMPONENT FULLADDER
		-- Mapeando as portas do fullhadder
		-- A 1°BIT, 2° bit, VE carry out vem um
		-- S: RESULTADO, VA: CARRY OUT RESULT
		PORT(A , B, VE: IN BIT;
			S, VA: OUT BIT);
	END COMPONENT;
	-- declarando o uso do halfadder
	COMPONENT HALFADDER
		PORT(A , B: IN BIT;
			S, VA: OUT BIT);
	END COMPONENT;
	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL CARRY_VECTOR: BIT_VECTOR(N-1 downto 1);
-- Começa a logica do full adder

BEGIN
	--HA_0: HALFADDER PORT MAP(A_NUM(0), B_NUM(0), RESULT(0), CARRY_VECTOR(1));
	ITER: FOR I IN 0 TO N-1 GENERATE
		COND0: IF I = 0 GENERATE
			HA_0: HALFADDER PORT MAP(A_NUM(I), B_NUM(I), RESULT(I), CARRY_VECTOR(I+1));
		END GENERATE;
		CONDN_NN: IF I = N-1 GENERATE
			FA_N: FULLADDER PORT MAP(A_NUM(I), B_NUM(I), CARRY_VECTOR(I), RESULT(I), CARRY_OUT);
		END GENERATE;
		CONDN_ITE: IF (I /= 0) AND (I /= N-1) GENERATE
			FA_I: FULLADDER PORT MAP(A_NUM(I), B_NUM(I), CARRY_VECTOR(I), RESULT(I), CARRY_VECTOR(I+1));
		END GENERATE;
	END GENERATE;
	--FA_N: FULLADDER PORT MAP(A_NUM(N-1), B_NUM(N-1), CARRY_VECTOR(N-1), RESULT(N-1), CARRY_OUT);
END ESTRUTURA;