module test(
        input [1:0] ina,
        input clk,rst,
        output reg [3:0] out
);
        reg [3:0] a_o, a_oo,a_ooo;
        wire [3:0] ina_add,a_o_mult, a_oo_add,a_ooo_mult;
        assign ina_add     = ina + 4'd1    ;
        assign a_o_mult    = a_o * 4'd2    ;
        assign a_oo_add    = a_oo * 4'd3   ;
        assign a_ooo_mult  = a_ooo * 4'd2  ;

        always @(posedge clk,posedge rst) begin
               if(rst) begin
                       a_o <= 4'd4;
                       a_oo <= 4'd2;
                       a_ooo <= 4'd3;
                       out <= 4'd1;
		end	
		else begin  
                        a_o <= ina_add;
                        a_oo <= a_o_mult;
                        a_ooo <= a_oo_add;
                        out <= a_ooo_mult;
                end
        end
endmodule
