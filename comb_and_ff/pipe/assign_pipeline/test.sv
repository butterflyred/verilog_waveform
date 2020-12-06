module test(
	input [2:0] ina,inb,inc,
	input clk,rst,
	output reg [5:0] out
);
	wire [5:0] mult_out,adder_out,a_mc;
	reg [5:0] sum,d_c,m_c,m_out;
	
	assign adder_out 	= ina 	+ 	inb;
	assign mult_out 	= sum	*	d_c;
	assign a_mc 		= m_out + 	m_c;
	
	always @(posedge clk,posedge rst)
	begin
		if(rst) begin
			sum <= 6'd2;
			d_c <= 6'd7;
			m_out <= 6'd3;
			m_c <= 6'd3;
		end	
		else begin 
			sum <= adder_out;
			d_c <= inc;
			m_c <= d_c;
			m_out <= mult_out;
			out <= a_mc;
		end
	end
endmodule
