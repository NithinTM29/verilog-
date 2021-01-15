module encode (I,D);
input [7:0] I;
output [2:0] D;
reg [2:0] D;
always @ (I)
begin
if (I[7]==1'B1) D=3'B111;
else if (I[6]==1'B1) D=3'B110;
else if (I[5]==1'B1) D=3'B101;
else if (I[4]==1'B1) D=3'B100;
else if (I[3]==1'B1) D=3'B011;
else if (I[2]==1'B1) D=3'B010;
else if (I[1]==1'B1) D=3'B001;
else if (I[0]==1'B1) D=3'B000;
else D=3'BZZZ;
end
endmodule
module encode_tb;
    reg [7:0] I;
    
    wire [2:0] D;
    
    encode uut( 
    .D(D),.I(I)
    );
    initial begin
        
        I = 8'b00000001;
 I= 8'b0000001x;
 I = 8'b000001xx;
 I = 8'b00001xxx;
 I= 8'b0001xxxx;
 I = 8'b001xxxxx;
 I = 8'b01xxxxxx;
 I = 8'b1xxxxxxx;

    end 
initial begin
    $display ("time=",$time,"I=%b:D=%b",I,D);
end 
endmodule