module instructionCycleOperation_tb();
	reg IRload,JMPmux,PCload,Meminst,Clock,Reset;
	reg [7:0] D;
	wire  [2:0] IR;
	wire [4:0] Address;
	
	initial begin
		IRload = 0;
		JMPmux = 0;
		PCload = 0;
		Meminst = 0;
		D = 8'b11111111;
		Clock = 0;
		Reset = 0;
		#4	Reset = 1;
		#1	Reset = 0;
		#6 	IRload = 1;
			Meminst = 1;
		#5	JMPmux = 1;
			Meminst = 0;
			PCload = 1;
		#5	JMPmux = 0;
			IRload = 0;
		#5	D = {$random}%256;
		#5	Meminst = 1;
			JMPmux = 1;
	end
	always #5 Clock <= ~Clock;
	//declare the reset
	initial begin
		Reset <= 0;
		@(posedge Clock)
		@(negedge Clock) Reset <= 0;
	end
	
	initial begin
		$display("IRload	JMPmux	PCload	Meminst	D	IR	Address");
		$monitor("%d		%d	%d	%d	%d	%d	%d",
		IRload, JMPmux, PCload, Meminst, D,IR,Address);
	end
	instructionCycleOperation 	part1(IRload,JMPmux,PCload,Meminst,Clock,Reset,D,IR,Address);
	
endmodule