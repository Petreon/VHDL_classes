ENTITY DECODER2X4 IS
	-- Precisa urgente documentar a funcionalidade disso aqui to fazendo rapido pq ta na aula
	PORT (	INPUT: IN BIT_VECTOR (1 downto 0);
		LD_OUT: OUT BIT_VECTOR (3 downto 0)); -- 4 bits output, every bit represents a output alone only one bit is 1
END DECODER2X4;

ARCHITECTURE FLUXO OF DECODER2X4 IS

	-- Declarando os sinais intermediarios,
	-- teoricamente somente os sinais de carry out
	
-- Começa a logica do somador4x4
BEGIN
	-- A partir daqui são os valores que estao entrando  
	LD_OUT(0) <= (NOT INPUT(0)) AND (NOT INPUT(1));
	LD_OUT(1) <= (INPUT(0)) AND (NOT INPUT(1));
	LD_OUT(2) <= (NOT INPUT(0)) AND (INPUT(1));
	LD_OUT(3) <= (INPUT(0)) AND (INPUT(1));


END FLUXO;