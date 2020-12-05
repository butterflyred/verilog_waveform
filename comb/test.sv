module test(
        input [1:0] ina,inb,
        input clk,rst,
        output reg [3:0] out
);
        always_comb begin
            out = ina* inb;
        end
endmodule
