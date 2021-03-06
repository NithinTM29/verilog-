module reg3 (q1,q2,q3,a,clk);
    input a;
    input clk;
    output q1,q2,q3;
    reg q1,q2,q3;
    always @(posedge clk)
    begin
        q3 = q2 ;
        q2 = q1 ;
        q1 = a ;
    end
endmodule