ENTITY MUX4X2 IS
	PORT ( 	A, B, C, D: IN BIT;
		CTL: IN BIT_VECTOR(1 downto 0);
		S: OUT BIT);
END MUX4X2;

-- iniciando a declaração do componente
ARCHITECTURE ESTRUTURA OF MUX4X2 IS
	-- Declarando o uso do MUX2x1 aqui
	COMPONENT MUX2X1
		-- Mapeando as portas do MUX2X1
		PORT(A, B, C: IN BIT;
			S: OUT BIT);
	END COMPONENT;
	-- criando os sinais intermediarios
	SIGNAL S1, S2: BIT;
-- inicia a logica do MUX4x2 utilizando os mux 2x1
BEGIN
	MU_1: MUX2X1 PORT MAP(A, B, CTL(0), S1);
	MU_2: MUX2X1 PORT MAP(C, D , CTL(0), S2);
	-- o ultimo mux selecionando a entrada dos 2 primeiros usando o bit MSB
	MU_3: MUX2X1 PORT MAP(S1,S2, CTL(0), S);
END ESTRUTURA;
	