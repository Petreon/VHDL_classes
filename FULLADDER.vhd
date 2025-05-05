ENTITY FULLADDER IS
	PORT (	A, B, VE: IN BIT;
		S, VA: OUT BIT	);
END FULLADDER;

-- iniciando o componente em vhdl, que � um conjunto de Halfadders
ARCHITECTURE HIBRIDA OF FULLADDER IS
-- � preciso declarar como o Halfadder funciona
	COMPONENT HALFADDER
		-- Mapeando as portas do HalfAdder
		PORT(	A, B: IN BIT;
			S, VA: OUT BIT);
	END COMPONENT;
	-- Declarando os sinais intermediarios entre os halfadders
	SIGNAL S1, VA1, VA2: BIT;
-- Come�a a logica do full adder utiliza-se 2 halfadder para fazer 1 full adde
-- a logica dele est� no caderno
BEGIN
	-- criando os 2 halfadders internos do full adder
	HA_0: HALFADDER PORT MAP(A, B, S1, VA1);
	HA_1: HALFADDER PORT MAP(S1, VE, S, VA2);
	-- fazendo a porta interna do OR entre os 2 vai um para ter a saida VA do full adder
	VA <= VA1 OR VA2;
END HIBRIDA;