module bin_to_gray(B,G);
input [3:0] B;
output [3:0] G;
assign G[0] = B[1]^B[0];
assign G[1] = B[2]^B[1];
assign G[2] = B[3]^B[2];
assign G[3] = B[3];
endmodule
module bg_tb;
    reg [3:0]b1;
    wire [3:0]g1;
bin_to_gray DUT (.B(b1),.G(g1));
initial 
begin
#5 b1=4'b1001;
#10 b1=4'b0011;
end 
always
#10 $display ($time,"$b1=%b,$g1=%b",b1,g1);
initial
#20 $finish;
endmodule

  