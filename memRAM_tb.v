module	memRAM_tb();
	reg		Clock;
	reg 	[7:0] D;
	reg 	[4:0] Address;
	reg 	WE;
	wire	[7:0] Q;
	
	initial begin
		Clock	= 0;
		D 		= 8'b00000000;
		Address	= 5'b00000;
		WE 		= 1;
	end
	always #1 Clock = ~Clock;
	
	//print result
	initial begin
		$display("WE	Address	 D	Q");
		$monitor("%d	%d	%d	%d",
		WE, Address, D, Q);
		checkRAM();
	end
	
	memRAM		part2(Clock,D,Address,WE,Q);
	
	task checkRAM;
		begin
			while(Address < 5'b11111) begin
				#2	D = D + 1;
					Address = Address + 1;
			end
			WE = 0;
			Address = 5'b00000;
			while(Address < 5'b11111) begin
				#2	Address = Address + 1;
			end
		end
	endtask


endmodule 