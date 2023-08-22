`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:28:27 03/19/2018
// Design Name:   aes_cipher
// Module Name:   C:/Users/Dell_2/Desktop/developed/22.AES PROJECT/15.AES PROJECT/aesdes_code/AESTOP.v
// Project Name:  aesdes
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: aes_cipher
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AESTOP;

	// Inputs
	reg clk;
	reg [127:0] datain;
	reg [127:0] key;

	// Outputs
	wire [127:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	aes_cipher uut (
		.clk(clk), 
		.datain(datain), 
		.key(key), 
		.dataout(dataout)
	);

	always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		datain = 10;
		key = 20;
	$monitor("The value of dataout is: %b", dataout) ;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

