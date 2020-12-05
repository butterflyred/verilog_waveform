module test(
	input [2:0] ina,inb,
	input clk,rst,
	output reg [4:0] out
);
	wire [4:0] mult_out;
	assign mult_out = ina* inb;
	always_ff @(posedge clk,posedge rst)
	begin
		if(rst) begin 
				out <= 4'd1;
		end
		else    out <= mult_out;
	end
endmodule
