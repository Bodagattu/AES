
`timescale 1ns/1ns

module Iterative_key_generation (rc,key,keyout);
    
   input [3:0] rc;
   input [127:0]key;
   output [127:0] keyout;
   
   wire [31:0] w0,w1,w2,w3,tem;
         
               

	  toffeli t1 (key,tem,keyout,w3,rc);

       
       rev_aes_sbox a1(.a(w3[23:16]),.c(tem[31:24]));
       rev_aes_sbox a2(.a(w3[15:8]),.c(tem[23:16]));
       rev_aes_sbox a3(.a(w3[7:0]),.c(tem[15:8]));
       rev_aes_sbox a4(.a(w3[31:24]),.c(tem[7:0]));
       
       
 
endmodule

