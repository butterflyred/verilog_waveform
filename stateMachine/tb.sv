
module tb();

reg clk,rst;
reg w;
wire z;
initial begin
$fsdbDumpfile("top.fsdb");
$fsdbDumpvars("+struct","+mda",dut);
clk = 0;
rst = 0;
w=0;

@(posedge clk)
rst = 1;
@(posedge clk)
w=1;
@(posedge clk)
@(posedge clk)
@(posedge clk)
w=0;

#6
$finish;
end

always #1 clk <= ~clk;

test dut(
.clk,
.rst,
.w,
.z
);

endmodule
