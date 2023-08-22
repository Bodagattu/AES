


`timescale 1ns/1ns

 module roundkey_last (clk,rc,datain,keyin,keyout,rlastout);
     input [3:0]rc;
     input clk;
     input [127:0] datain;
     input [127:0] keyin;
     output[127:0] keyout;
     output [127:0] rlastout;
     
     wire [127:0] keyin;
     reg [127:0] rlastout;
     
     wire [127:0] keyout;
                
       
    wire [7:0] b00_sb,b01_sb,b02_sb,b03_sb;
    wire [7:0] b10_sb,b11_sb,b12_sb,b13_sb;
    wire [7:0] b20_sb,b21_sb,b22_sb,b23_sb;
    wire [7:0] b30_sb,b31_sb,b32_sb,b33_sb;
    
    reg [7:0] b00_sr,b01_sr,b02_sr,b03_sr;
    reg [7:0] b10_sr,b11_sr,b12_sr,b13_sr;
    reg [7:0] b20_sr,b21_sr,b22_sr,b23_sr;
    reg [7:0] b30_sr,b31_sr,b32_sr,b33_sr; 
    
    
    


   // key_expansion
   Iterative_key_generation k1(.rc(rc),.key(keyin),.keyout(keyout));
   
   
   always @(posedge clk)
      begin
   
    b00_sr = b00_sb;  
    b01_sr = b01_sb;
    b02_sr = b02_sb;
    b03_sr = b03_sb;
 
    b10_sr = b11_sb;
    b11_sr = b12_sb;
    b12_sr = b13_sb;
    b13_sr = b10_sb;
 
    b20_sr = b22_sb;
    b21_sr = b23_sb;
    b22_sr = b20_sb;
    b23_sr = b21_sb;
 
    b30_sr = b33_sb;
    b31_sr = b30_sb;
    b32_sr = b31_sb;
    b33_sr = b32_sb; 
 
 
          rlastout[127:120] = b00_sr ^ keyout[127:120];
          rlastout[119:112] = b10_sr ^ keyout[119:112];
          rlastout[111:104] = b20_sr ^ keyout[111:104];
          rlastout[103:96] = b30_sr ^ keyout[103:96];
   
          rlastout[95:88] = b01_sr ^ keyout[95:88];
          rlastout[87:80] = b11_sr ^ keyout[87:80];
          rlastout[79:72] = b21_sr ^ keyout[79:72];
          rlastout[71:64] = b31_sr ^ keyout[71:64];
   
          rlastout[63:56] = b02_sr ^ keyout[63:56];
          rlastout[55:48] = b12_sr ^ keyout[55:48];
          rlastout[47:40] = b22_sr ^ keyout[47:40];
          rlastout[39:32] = b32_sr ^ keyout[39:32];
   
          rlastout[31:24] = b03_sr ^ keyout[31:24];
          rlastout[23:16] = b13_sr ^ keyout[23:16];
          rlastout[15:08] = b23_sr ^ keyout[15:08];
          rlastout[7:0] = b33_sr ^ keyout[7:0]; 
   
 end
    
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
     

   endmodule

