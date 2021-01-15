module srff(sr, clk, q);
input clk;
input [1:0]sr;
output q;
reg q;
always @(posedge clk)
begin
case (sr)
2'B00:q=q;
2'B01:q=1'B0;
2'B10:q=1'B1;
default:q=1'BZ;
endcase
end
endmodule

module srff_tb;
    wire q1;
    reg clk1;
    reg [1:0]sr1;
    srff DUT (.q(q1),.clk(clk1),.sr(sr1));
    initial
    clk1=1'b0;
    always
    #10 clk1=~clk1;
    initial
    begin
    sr1=2'b00;
    #5 sr1=2'b01;
    #5 sr1=2'b10; 
    #5 sr1=2'b11;
    #10;
end
always
#5 $display($time,"clk=%b q=%b sr=%b ",clk1 , q1 , sr1);
initial
#100 $finish;
endmodule

    
    
    
    
    
    
    
    
    
    