-- o objectivo desse programa � fazer um somador de 2 numeros de 4 bits
-- utilizando 3 full hadder e um half adder, com o carry out
-- sendo o mais significativo A3, B3
ENTITY SOMADOR4 IS
	PORT (	A_NUM, B_NUM: 	IN BIT_VECTOR(3 downto 0);
		RESULT: 	OUT BIT_VECTOR(3 downto 0);
		CARRY_OUT:	OUT BIT);
END SOMADOR4;

-- iniciando a declara��o do componente
-- n�o � hibrido entao � definido como estrutura
ARCHITECTURE ESTRUTURA OF SOMADOR4 IS
	-- declarando o uso do FULLADDER:
	COMPONENT FULLADDER
		-- Mapeando as portas do fullhadder
		-- A 1�BIT, 2� bit, VE carry out vem um
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
	SIGNAL CARRY_VECTOR: BIT_VECTOR(3 downto 0);
-- Come�a a logica do full adder

BEGIN
	-- nessa parte da materia ainda n�o foi ensinado loop
	-- ent�o declara cada componente ao inves de fazer o loop de componente
	-- entra primeiro bits dos vetores, e o valor resulta no vetor de saida
	-- utiliza o sinal intermediario de carry vector pra salvar o valor
	HA_0: HALFADDER PORT MAP(A_NUM(0), B_NUM(0), RESULT(0), CARRY_VECTOR(0));
	FA_1: FULLADDER PORT MAP(A_NUM(1), B_NUM(1), CARRY_VECTOR(0), RESULT(1), CARRY_VECTOR(1));
	FA_2: FULLADDER PORT MAP(A_NUM(2), B_NUM(2), CARRY_VECTOR(1), RESULT(2), CARRY_VECTOR(2));
	FA_3: FULLADDER PORT MAP(A_NUM(3), B_NUM(3), CARRY_VECTOR(2), RESULT(3), CARRY_VECTOR(3));
	CARRY_OUT <= CARRY_VECTOR(3); -- isso aqui pode ser perda de iteracao
END ESTRUTURA;
-- Observa�oes da professora:
-- o sinal temporario deveria ser de 1 a 3 para sincronizar os indexes dos sinais
-- mas poderia ser usado n-1 tamb�m, 
-- e ao inves de atribuir o CARRY_OUT no final, ja utilizar o valor de saida e economizar
-- um espa�o no CARRY VECTOR.
