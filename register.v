module register
	#(parameter data_size = 8)
(	input load, clock, reset,
	input [data_size-1:0] in,
	output reg [data_size-1:0] out);
	
	always@(posedge clock, posedge reset) begin
		if(reset) begin
			out <= 0;
		end
		else begin
			if(load) begin
				out <= in;
			end
			else begin
				out <= out;
			end
		end
	end
endmodule 