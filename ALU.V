module alu (a, b, code, en, aluout);
input [3:0]a,b;
input [2:0] code;
input en;
output [7:0] aluout;
reg [7:0] aluout ;
wire[7:0] x, y;
assign x = {4'B0000, a};
assign y = {4'B0000, b};
always @ (x, y, code, en, a,b)
begin
if (en == 1'B1)
 case (code)
   3'd0: aluout = x + y;
   3'd1: aluout = x - y;
   3'd2: aluout = ~x;   
   3'd3: aluout = a * b;
   3'd4: aluout = x & y;
   3'd5: aluout = x | y;
   3'd6: aluout = ~(x & y);
   3'd7: aluout = ~(x | y);
default: aluout = 8'B00000000;
endcase
else
aluout = 8'BZZZZZZZZ;
end
endmodule

module tb_alu;
//inputs
reg[7:0] A,B;
reg[3:0]ALU_Sel;
//outputs
wire[7:0]ALU_Out;
wire CarruOut;
//verilog code for ALU
integer i;
alu test_unit(
A,B,//ALU 8 bit Inputs
ALU_Sel,//ALU Selection
ALU_Out,//ALU 8 Bit Output
CarryOut//Carry Out Flag
);
initial begin
//hold reset state for 100 ns.
A = 4'b1010;//8'd10;
B = 4'b1011;//4'd11;
ALU_Sel = 4'h0;//4'd0;
for (i=0;i<=15;i=i+1)
begin
ALU_Sel = ALU_Sel + 8'h01;//ALU_Sel = ALU_Sel + 8'd01
#10;
end
A = 8'hF6;//8'd246
B = 8'h0A;//8'd10
end
endmodule
    

    