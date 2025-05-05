ENTITY OR_N IS
	PORT(	A,B: IN BIT;
		S: OUT BIT);
END OR_N;

ARCHITECTURE fluxo OF OR_N IS
BEGIN
    S <= A OR B;
END fluxo;
