module test(
        input [1:0] ina,
        input clk,rst,
        output reg [3:0] out
);
        reg [3:0] a_o, a_oo,a_ooo;
        always @(posedge clk,posedge rst) begin
               if(rst) begin
                       a_o <= 4'd4;
                       a_oo <= 4'd2;
                       a_ooo <= 4'd3;
		end	
		else begin  
                        a_o <= ina;
                        a_oo <= a_o;
                        a_ooo <= a_oo;
                        out <= a_ooo;
                end
        end
endmodule
