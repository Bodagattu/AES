


`timescale 1ns/1ns 
 module roundkey(clk,rc,datain,keyin,keyout,rndout);
 
    input [3:0] rc;
    input clk; 
    input [127:0] datain;
    input [127:0] keyin;
    output [127:0] keyout;
    output[127:0] rndout;


    wire [127:0] datain,keyin;
    wire [127:0] rndout;
        
    wire [7:0] b00_sb,b01_sb,b02_sb,b03_sb;
    wire [7:0] b10_sb,b11_sb,b12_sb,b13_sb;
    wire [7:0] b20_sb,b21_sb,b22_sb,b23_sb;
    wire [7:0] b30_sb,b31_sb,b32_sb,b33_sb; 



     
     Iterative_key_generation k1(.rc(rc),.key(keyin),.keyout(keyout));


          
     rev_aes_sbox q0( .a(datain[127:120]),.c(b00_sb) );
      rev_aes_sbox q1( .a(datain[119:112]),.c(b10_sb) );
      rev_aes_sbox q2( .a(datain[111:104]),.c(b20_sb) );
      rev_aes_sbox q3( .a(datain[103:96]),.c(b30_sb) );
     
      rev_aes_sbox q4( .a(datain[95:88]),.c(b01_sb) );
      rev_aes_sbox q5( .a(datain[87:80]),.c(b11_sb) );
      rev_aes_sbox q6( .a(datain[79:72]),.c(b21_sb) );
      rev_aes_sbox q7( .a(datain[71:64]),.c(b31_sb) );
     
      rev_aes_sbox q8( .a(datain[63:56]),.c(b02_sb) );
      rev_aes_sbox q9( .a(datain[55:48]),.c(b12_sb) );
      rev_aes_sbox q10(.a(datain[47:40]),.c(b22_sb) );
      rev_aes_sbox q11(.a(datain[39:32]),.c(b32_sb) );
     
      rev_aes_sbox q12(.a(datain[31:24]),.c(b03_sb) );
      rev_aes_sbox q13(.a(datain[23:16]),.c(b13_sb) );
      rev_aes_sbox q14(.a(datain[15:08]),.c(b23_sb) );
      rev_aes_sbox q16(.a(datain[7:0]),.c(b33_sb) );
     
          mct_gate m1(  b00_sb,b01_sb,b02_sb,b03_sb,
  b10_sb,b11_sb,b12_sb,b13_sb,
    b20_sb,b21_sb,b22_sb,b23_sb,
   b30_sb,b31_sb,b32_sb,b33_sb,keyout,rndout);

     
     
 endmodule
