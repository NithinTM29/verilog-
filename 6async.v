module syncbinary (clk, rst, q);
input clk, rst;
output [3:0]q;
reg [3:0]q;
initial q = 4'B0000;
always @ (posedge clk)
begin
if (rst == 1'B1)
q = 4'B0000;
else
q = q + 1;
end
endmodule

module asynbcd_tb;
    reg clk,rst;
    wire [3:0]q;
    initial  
    clk=1'b0;
    always
    #5 clk=~clk;
    syncbinary dut(clk,rst,q);
    initial
    begin 
    rst=1'b0;
    #15 rst=1'b1;
    #30 rst = 1'b0;
    
end
always
      $monitor ($time,"q=%d",q);
      initial
#60 $finish;
endmodule 