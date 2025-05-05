ENTITY SOMADOR_ALU1_1 IS
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	X, Y, CARRY_IN, LD_IN : IN BIT;
		SUM, CARRY_OUT: OUT BIT); 
		
END SOMADOR_ALU1_1;

ARCHITECTURE FLUXO OF SOMADOR_ALU1_1 IS

	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	SIGNAL XOR_1: BIT;
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	-- 1° XOR operation
	XOR_1 <= X XOR Y;
	SUM <= (CARRY_IN XOR XOR_1) AND LD_IN;
	CARRY_OUT <= (LD_IN AND X AND Y) OR (LD_IN AND XOR_1 AND CARRY_IN);


END FLUXO;
