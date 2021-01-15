module reg31 (Q1,Q2,Q3,A,CLK);
    input A;
     input CLK ;
     output Q1,Q2,Q3;
     
     reg Q1,Q2,Q3;
     
     always @(posedge CLK)
     begin 
     Q1 = A;
     Q2 = Q1;
     Q3 = Q2;
 end
 endmodule