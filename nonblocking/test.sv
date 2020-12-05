module test(
	input [1:0] ina,inb,
	input clk,rst,
	output reg [3:0] out
);
	wire [3:0] mult_out;
	reg [3:0] adder_out;
	
	assign mult_out = ina* inb;
	
	always @(posedge clk,posedge rst)
	begin
		if(rst) begin 
			adder_out 	<= 4;
			out 		<= 4'd8;
		end
		else    begin
			adder_out 	<= mult_out + out;
		    out 		<= adder_out;
		end
	end
endmodule
