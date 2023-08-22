
`timescale 1ns/1ns

module aes_cipher (clk,datain,key,dataout);
    
    input clk;
    input [127:0] datain;
    input [127:0] key;
    output[127:0] dataout;
    
    reg [127:0] r0_out;
    wire [127:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    
    wire [127:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9,keyout10;
    
    
    // initial key expansion
    always @(posedge clk) r0_out = (datain ^ key);
    
      
    roundkey r1(.clk(clk),.rc(4'b0000),.datain(r0_out),.keyin(key),.keyout(keyout1),.rndout(r1_out));
    roundkey r2(.clk(clk),.rc(4'b0001),.datain(r1_out),.keyin(keyout1),.keyout(keyout2),.rndout(r2_out));
    roundkey r3(.clk(clk),.rc(4'b0010),.datain(r2_out),.keyin(keyout2),.keyout(keyout3),.rndout(r3_out));
    roundkey r4(.clk(clk),.rc(4'b0011),.datain(r3_out),.keyin(keyout3),.keyout(keyout4),.rndout(r4_out));
    roundkey r5(.clk(clk),.rc(4'b0100),.datain(r4_out),.keyin(keyout4),.keyout(keyout5),.rndout(r5_out));
    roundkey r6(.clk(clk),.rc(4'b0101),.datain(r5_out),.keyin(keyout5),.keyout(keyout6),.rndout(r6_out));
    roundkey r7(.clk(clk),.rc(4'b0110),.datain(r6_out),.keyin(keyout6),.keyout(keyout7),.rndout(r7_out));
    roundkey r8(.clk(clk),.rc(4'b0111),.datain(r7_out),.keyin(keyout7),.keyout(keyout8),.rndout(r8_out));
    roundkey r9(.clk(clk),.rc(4'b1000),.datain(r8_out),.keyin(keyout8),.keyout(keyout9),.rndout(r9_out));
    roundkey_last r10(.clk(clk),.rc(4'b1001),.datain(r9_out),.keyin(keyout9),.keyout(keyout10),.rlastout(dataout));
    
endmodule
