
module tb();

reg clk,rst;
reg [2:0] ina,inb;
wire [4:0] out;
initial begin
$fsdbDumpfile("top.fsdb");
$fsdbDumpvars("+struct","+mda",dut);
clk = 0;
rst = 1;
ina=3;
@(posedge clk)
rst = 0;
ina = 1;
@(posedge clk)
ina = 2;

#50 $finish;
end

always #2 clk <= ~clk;

test dut(
.clk,
.rst,
.ina,
.out
);

endmodule
