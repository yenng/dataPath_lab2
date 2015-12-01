module dataPath_tb();
	reg IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, Sub;
	reg [1:0] Asel;
	reg [7:0] Input;
	wire Aeq0, Apos;
	wire [2:0] IR;
	wire [7:0] Output;
	
	//reg [8:0]controlSignal = {IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Asel};
	
	initial begin
		IRload = 0;
		JMPmux = 0;
		PCload = 0;
		Meminst = 0;
		MemWr = 0;
		Aload = 0;
		Sub = 0;
		Asel = 0;
		Input = {$random}%256;
		Clock = 0;
		Reset = 0;
		#2	Reset = 1;
		#3	Reset = 0;
		#10 IRload = 1;
			PCload = 1;
		#10 IRload = 0;
			PCload = 0;
			Meminst = 1;
		#10 Meminst = 0;
			Aload = 1;
			Asel = 2;
		#10 Aload = 0;
			Asel = 0;
			Meminst = 1;
			MemWr = 1;
		#10 Meminst = 0;
			MemWr = 0;
			Aload = 1;
		#10 Sub = 1;
		#10 Sub = 0;
			Asel = 1;
		#10 Asel = 0;
			Aload = 0;
			JMPmux = 1;
			PCload = 1;
		#10 PCload = 0;
		#10 JMPmux = 0;
	end
	
	always #5 Clock <= ~Clock;
	//declare the reset
	/*initial begin
		Reset <= 0;
		@(posedge Clock)
		@(negedge Clock) Reset <= 1;
	end*/
	
	initial begin
		$display("IRload	JMPmux	PCload	Meminst	MemWr	Aload	Sub	Asel	IR	Aeq0	Apos	Input	Output");
		$monitor("%d		%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	",
		IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Asel,IR,Aeq0,Apos,Input,Output);
	end
		
	
	
	
	dataPath dataPathTest(IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, Sub, Asel, Input, Aeq0, Apos, IR, Output);
	
endmodule 