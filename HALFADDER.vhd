ENTITY HALFADDER IS
	PORT(	A,B: IN BIT;
		S,VA: OUT BIT);
END HALFADDER;

ARCHITECTURE fluxo OF HALFADDER IS
BEGIN
	S 	<= A XOR B;
	VA 	<= A AND B;
END ARCHITECTURE fluxo;