module dataPath_tb();
	reg IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, Sub;
	reg [1:0] Asel;
	reg [7:0] Input;
	wire Aeq0, Apos;
	wire [4:0] Address;
	wire [2:0] IR;
	wire [7:0] Output, Q;
	
	//reg [8:0]controlSignal = {IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Asel};
	
	initial begin
		start();
		Input 	= {$random}%256;
		Clock 	= 0;
		Reset 	= 1;
	#10	Reset 	= 0;
		storeValueToRAM();
		Display();
	#10	start();
	#10	fetch();
	#10	decode();
	#10 load();
	#10 add();
	#10 sub();
	#10	INPUT();
	#10	jz();
	#10	jpos();
	#10	halt();
		
	end
	
	always #5 Clock <= ~Clock;
		
	dataPath dataPathTest(IRload,JMPmux, PCload, Meminst, MemWr, Aload, Reset, Clock, Sub, Asel, Input, Aeq0, Apos, Address, IR, Output,Q);
	
	task Display; begin
		$display("IRload	JMPmux	PCload	Meminst	MemWr	Reset	Aload	Sub	Asel	IR	Aeq0	Apos	Address	Input	Output	Q");
		$monitor("%d		%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d	%d",
		IRload, JMPmux, PCload, Meminst, MemWr, Reset, Aload, Sub, Asel,IR,Aeq0,Apos,Address,Input,Output,Q);
		end
	endtask
	
	task start; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 0;MemWr 	= 0;Aload 	= 0;Sub 	= 0;Asel	= 2'b00; 
		$display("Start");
		end
	endtask
	
	task fetch; begin
		IRload 	= 1;JMPmux 	= 0;PCload 	= 1;Meminst = 0;MemWr 	= 0;Aload 	= 0;Sub 	= 0;Asel	= 2'b00; 
		$display("Fetch");
		end
	endtask
	
	task decode; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 1;MemWr 	= 0;Aload 	= 0;Sub 	= 0;Asel	= 2'b00;
		$display("Decode"); 
		end
	endtask
	
	task load; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 0;MemWr 	= 0;Aload 	= 1;Sub 	= 0;Asel	= 2'b10; 
		$display("Load");
		end
	endtask
	
	task store; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 1;MemWr 	= 1;Aload 	= 0;Sub 	= 0;Asel	= 2'b00; 
		$display("Store");
		end
	endtask
	
	task add; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 0;MemWr 	= 0;Aload 	= 1;Sub 	= 0;Asel	= 2'b00; 
		$display("Add");
		end
	endtask
	
	task sub; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 0;MemWr 	= 0;Aload 	= 1;Sub 	= 1;Asel	= 2'b00; 
		$display("Sub");
		end
	endtask
	
	task INPUT; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 0;MemWr 	= 0;Aload 	= 1;Sub 	= 0;Asel	= 2'b01; 
		$display("Input");
		end
	endtask
	
	task jz; begin
		IRload 	= 0;JMPmux 	= 1;PCload 	= Aeq0;Meminst = 0;MemWr 	= 0;Aload 	= 0;Sub 	= 0;Asel	= 2'b00; 
		$display("JZ");
		end
	endtask
	
	task jpos; begin
		IRload 	= 0;JMPmux 	= 1;PCload 	= Apos;Meminst = 0;MemWr 	= 0;Aload 	= 0;Sub 	= 0;Asel	= 2'b00; 
		$display("JPOS");
		end
	endtask
	
	task halt; begin
		IRload 	= 0;JMPmux 	= 0;PCload 	= 0;Meminst = 0;MemWr 	= 0;Aload 	= 0;Sub 	= 0;Asel	= 2'b00; 
		$display("Halt");
		end
	endtask
	
	task storeValueToRAM;
		begin
			while(Address < 5'b11111) begin
				#10	IRload 	= 0;JMPmux 	= 0;PCload 	= 1;Meminst = 0;MemWr 	= 1;Aload 	= 1;Sub 	= 0;Asel	= 2'b01; 
			end
			#10	PCload = 1;
			//while(Address < 5'b11111) begin
			//	#10	IRload 	= 0;JMPmux 	= 0;PCload 	= 1;Meminst = 0;MemWr 	= 0;Aload 	= 1;Sub 	= 0;Asel	= 2'b01; 
			//end
		end
	endtask

	
	
	
	
	
endmodule 