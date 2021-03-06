module comparator (a, b, alb, aeb, agb);
input [3:0] a , b;
output alb, aeb, agb;
reg alb, aeb, agb;
always@(a,b)
begin
if(a<b)
begin
alb=1'b1; aeb=1'b0; agb=1'b0;
end
else if (a>b)
begin
alb=1'b0; aeb=1'b0; agb=1'b1;
end
else
begin
alb=1'b0; aeb=1'b1; agb=1'b0;
end
end
endmodule

module comp_tb;
    reg [3:0]A;
    reg [3:0]B;
    wire alb1,aeb1,agb1;
comparator DUT (.a(A),.b(B),.alb(alb1),.aeb(aeb1),.agb(agb1));
initial
begin
   #5 A=4'b0000 ; B=4'b0000;
   #5 A=4'b1100 ; B=4'b0011;
   #5 A=4'b0011 ; B=4'b1100;
    #5;
end
always
 #10 $display ($time,"a=%b b=%b alb1=%b aeb1=%b agb1=%b",$time,A,B,alb1,aeb1,agb1);
initial
#100 $finish;
endmodule
    
    







