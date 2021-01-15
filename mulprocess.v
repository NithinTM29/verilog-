module twoprocess ;
reg A,B;
initial
begin
   A=0;
   B=0;
end
//process p1 
always @(B) begin
    A<= 1;
    A<= #5 0;
end

// process p2 
always @(A) begin
    if(A)
       B <= #10 ~B;
end
endmodule