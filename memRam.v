module	memRAM(
	input	Clock,
	input 	[7:0] D,
	input 	[4:0] Address,
	input 	WE,
	output 	reg	[7:0] Q);

	reg [7:0] REGISTER [31:0];
	
	always @(posedge Clock)
	begin
		if(!WE)	Q = REGISTER[Address];
		else	REGISTER[Address] = D;
	end
endmodule
