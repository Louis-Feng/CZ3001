`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:19 01/27/2021
// Design Name:   adder
// Module Name:   C:/Users/feng0111/Desktop/Feng Qingyu/CE3001_lab1/adder_test.v
// Project Name:  CE3001_lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_test;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;

	// Outputs
	wire [63:0] out;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#200 a=64'h01; //after 200ns make a=1;
		#200 b=64'h02; // after 200ns make b=1;
	end
      
endmodule

