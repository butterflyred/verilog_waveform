module test(
	input [2:0] ina,inb,
	input clk,rst,
	output reg [4:0] out
);
	reg [4:0] mult_out,adder_out;
	always_comb begin
		mult_out = ina* inb;
		adder_out = mult_out + out;
	end
	always @(posedge clk,posedge rst)
	begin
		if(rst) begin 
				out <= 4'd1;
		end
		else    out <= adder_out;
	end
endmodule
