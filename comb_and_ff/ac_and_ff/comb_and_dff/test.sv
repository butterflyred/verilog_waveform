module test(
	input [2:0] ina,inb,
	input clk,rst,
	output reg [4:0] out
);
	reg [4:0] mult_out;
	always_comb begin
		mult_out = ina* inb;
	end
	always @(posedge clk,posedge rst)
	begin
		if(rst) begin 
				out <= 4'd1;
		end
		else    out <= mult_out;
	end
endmodule
