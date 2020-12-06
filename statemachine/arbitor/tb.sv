
module tb();

reg clk,rst;
reg req0,req1;
wire gnt0,gnt1;
initial begin
$fsdbDumpfile("top.fsdb");
$fsdbDumpvars("+struct","+mda",dut);
clk = 0;
rst = 0;
req0=0;
req1=0;

@(posedge clk)
rst = 1;
req0=1;
req1=0;
@(posedge clk)
req0=1;
req1=0;
@(posedge clk)
req0=1;
req1=1;
@(posedge clk)
req0=1;
req1=1;
@(posedge clk)
req0=0;
req1=1;


#6
$finish;
end

always #1 clk <= ~clk;

test dut(
.clk,
.rst,
.req0,
.req1,
.gnt1,
.gnt0
);

endmodule
