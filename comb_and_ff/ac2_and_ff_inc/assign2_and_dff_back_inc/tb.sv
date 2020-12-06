
module tb();

reg clk,rst;
reg [2:0] ina,inb,inc;
wire [4:0] out;
initial begin
$fsdbDumpfile("top.fsdb");
$fsdbDumpvars("+struct","+mda",dut);
clk = 0;
rst = 1;
ina=3;
inb=2;
inc=1;
@(posedge clk)
rst = 0;
ina = 1;
inb = 3;
inc = 5;
@(posedge clk)
ina = 2;
inb = 1;
inc = 4;

#50 $finish;
end

always #2 clk <= ~clk;

test dut(
.clk,
.rst,
.ina,
.inb,
.inc,
.out
);

endmodule
