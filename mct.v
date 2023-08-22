`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:36:49 03/17/2019 
// Design Name: 
// Module Name:    mct 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mct_gate(  b00_sb,b01_sb,b02_sb,b03_sb,
  b10_sb,b11_sb,b12_sb,b13_sb,
    b20_sb,b21_sb,b22_sb,b23_sb,
   b30_sb,b31_sb,b32_sb,b33_sb,keyout,rndout);
	
	 input [7:0] b00_sb,b01_sb,b02_sb,b03_sb;
    input [7:0] b10_sb,b11_sb,b12_sb,b13_sb;
    input [7:0] b20_sb,b21_sb,b22_sb,b23_sb;
    input [7:0] b30_sb,b31_sb,b32_sb,b33_sb; 
	 
	 input [127:0] keyout;
    output[127:0] rndout;
	 
	     wire [7:0] b00_sr,b01_sr,b02_sr,b03_sr;
wire [7:0] b10_sr,b11_sr,b12_sr,b13_sr;
 wire [7:0] b20_sr,b21_sr,b22_sr,b23_sr;
wire [7:0] b30_sr,b31_sr,b32_sr,b33_sr; 

    wire [7:0] b00_mcl,b01_mcl,b02_mcl,b03_mcl;
    wire [7:0] b10_mcl,b11_mcl,b12_mcl,b13_mcl;
    wire [7:0] b20_mcl,b21_mcl,b22_mcl,b23_mcl;
    wire [7:0] b30_mcl,b31_mcl,b32_mcl,b33_mcl; 
	 
	 
	  assign  b00_sr = b00_sb;  
       assign   b01_sr = b01_sb;
       assign   b02_sr = b02_sb;
       assign   b03_sr = b03_sb;
   
       assign   b10_sr = b11_sb;
       assign   b11_sr = b12_sb;
      assign    b12_sr = b13_sb;
      assign    b13_sr = b10_sb;
   
     assign     b20_sr = b22_sb;
     assign     b21_sr = b23_sb;
     assign     b22_sr = b20_sb;
     assign     b23_sr = b21_sb;
   
       assign   b30_sr = b33_sb;
      assign    b31_sr = b30_sb;
       assign   b32_sr = b31_sb;
      assign    b33_sr = b32_sb; 

  assign  b00_mcl =    (b00_sr)^  (b10_sr)^(b10_sr)^(b20_sr)^(b30_sr);
  assign        b10_mcl = (b00_sr)^  (b10_sr)^  (b20_sr)^(b20_sr)^(b30_sr);
  assign        b20_mcl = (b00_sr)^(b10_sr)^  (b20_sr)^  (b30_sr)^(b30_sr);
  assign        b30_mcl =    (b00_sr)^(b00_sr)^(b10_sr)^(b20_sr)^  (b30_sr);
     
     
   assign       b01_mcl =    (b01_sr)^  (b11_sr)^(b11_sr)^(b21_sr)^(b31_sr);
  assign        b11_mcl = (b01_sr)^  (b11_sr)^  (b21_sr)^(b21_sr)^(b31_sr);
   assign       b21_mcl = (b01_sr)^(b11_sr)^  (b21_sr)^  (b31_sr)^(b31_sr);
   assign       b31_mcl =    (b01_sr)^(b01_sr)^(b11_sr)^(b21_sr)^  (b31_sr);
     
     
    assign      b02_mcl =    (b02_sr)^  (b12_sr)^(b12_sr)^(b22_sr)^(b32_sr);
    assign      b12_mcl = (b02_sr)^  (b12_sr)^  (b22_sr)^(b22_sr)^(b32_sr);
    assign      b22_mcl = (b02_sr)^(b12_sr)^  (b22_sr)^  (b32_sr)^(b32_sr);
    assign      b32_mcl =    (b02_sr)^(b02_sr)^(b12_sr)^(b22_sr)^  (b32_sr);
     
     
    assign      b03_mcl =    (b03_sr)^  (b13_sr)^(b13_sr)^(b23_sr)^(b33_sr);
    assign      b13_mcl = (b03_sr)^  (b13_sr)^  (b23_sr)^(b23_sr)^(b33_sr);
    assign      b23_mcl = (b03_sr)^(b13_sr)^  (b23_sr)^  (b33_sr)^(b33_sr);
    assign      b33_mcl =    (b03_sr)^(b03_sr)^(b13_sr)^(b23_sr)^  (b33_sr);
			 
			 
			 
	assign		         rndout[127:120] = b00_mcl ^ keyout[127:120];
     assign     rndout[119:112] = b10_mcl ^ keyout[119:112];
    assign      rndout[111:104] = b20_mcl ^ keyout[111:104];
    assign      rndout[103:96] = b30_mcl ^ keyout[103:96];
   
    assign      rndout[95:88] = b01_mcl ^ keyout[95:88];
    assign      rndout[87:80] = b11_mcl ^ keyout[87:80];
    assign      rndout[79:72] = b21_mcl ^ keyout[79:72];
     assign     rndout[71:64] = b31_mcl ^ keyout[71:64];
   
     assign     rndout[63:56] = b02_mcl ^ keyout[63:56];
    assign      rndout[55:48] = b12_mcl ^ keyout[55:48];
     assign     rndout[47:40] = b22_mcl ^ keyout[47:40];
     assign     rndout[39:32] = b32_mcl ^ keyout[39:32];
   
     assign     rndout[31:24] = b03_mcl ^ keyout[31:24];
     assign     rndout[23:16] = b13_mcl ^ keyout[23:16];
      assign    rndout[15:08] = b23_mcl ^ keyout[15:08];
      assign    rndout[7:0] = b33_mcl ^ keyout[7:0]; 

			      
endmodule
