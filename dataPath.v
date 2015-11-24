module dataPath(
	input IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, Sub,
	input [1:0] Asel,
	input [7:0] Input,
	output Aeq0, Apos,
	output wire [2:0] IR,
	output [7:0] Output);
	
	reg [7:0] RAM_Q, RAM_D;
	wire [4:0] Address;
		
	instructionCycleOperation 	part1(IRload,JMPmux,PCload,Meminst,Clock,Reset,RAM_D,IR,Address);
	memRAM						part2(Clock,RAM_D,Address,MemWr,RAM_Q);
	instructionSetOperation		part3(Aload, Reset, Clock, Sub,Asel,Input,RAM_Q,RAM_D,Aeq0,Apos,Output);

endmodule 