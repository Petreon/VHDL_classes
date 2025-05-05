ENTITY LOGICUNIT_1 IS
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	X, Y : IN BIT;
		LD_IN: IN BIT_VECTOR (2 downto 0); -- 3 bits input, every bit represents a output alone only one bit is 1
		R_AND, R_OR, R_NOT: OUT BIT); 
		
END LOGICUNIT_1;

ARCHITECTURE FLUXO OF LOGICUNIT_1 IS

	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	-- 1° AND operation
	R_AND 	<= (X AND Y) AND LD_IN(0);
	-- 2° OR operation
	R_OR 	<= (X OR Y) AND (LD_IN(1));
	-- 3° NOT operation
	R_NOT 	<=  (NOT Y) AND (LD_IN(2));


END FLUXO;