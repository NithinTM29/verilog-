module dff(d, rst, clk, q, qb);
input d, rst, clk;
output q, qb;
reg q, qb;
always @(posedge clk)
begin
if (rst == 1'B1)
begin
q = 1'B0; qb = 1'B1;
end
else
begin
q = d; qb = ~q;
end
end
endmodule

// Testbench
module dff_tb;
reg D,CLK,rst1;
wire q1,qb1;
dff DUT (.d(D),.rst(rst1),.clk(CLK),.q(q1),.qb(qb1));
initial
CLK=1'b0;
always 
# 10CLK= ~CLK; 
initial
begin
    D=1'b0;
    rst1=1'b1;
    #20 rst1=1'b0;
    #10 D=1'b1;
    #20 rst1=1'b1;
    #10 D=1'b0;
    #20 rst1=1'b0;
    #10 D=1'b1;
    #10 ;
end
always
#5 $display($time,"clk%b rst1=%b d=%b q=%b qb=%b ",$time,CLK,rst1
,D,q1,qb1);
initial
#100 $finish ;
endmodule
    
   