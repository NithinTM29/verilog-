module or_gate(input a,b,output y);
    assign y=a|b;
endmodule
// test bench ;
module tb_or_gate;
reg A,B;
wire Y;
or_gate a1(.a(A),.b(B),.y(Y));
// above style is connecting by name 
initial begin 
A  = 1'b0;
B = 1'b0;
#45 $finish;
end 
always#6 A=~A;
always#3 B=~B;
always@(Y)
$monitor("time=%0t \t INPUT VALUES: \t A=%b B=%b \t output value Y =%b", $time,A,B,Y);
endmodule