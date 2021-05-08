`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:05:32 02/09/2021
// Design Name:   datapath_mux
// Module Name:   C:/Users/feng0111/Desktop/feng/lab2 codes/Feng Qingyu/Feng Qingyu/CE3001_lab1/datapath_test.v
// Project Name:  CE3001_lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_test;

	// Inputs
	reg clk;
	reg rst;
	reg [63:0] inst;

	// Outputs
	wire [63:0] aluout;

	// Instantiate the Unit Under Test (UUT)
	datapath_mux uut (
		.clk(clk), 
		.rst(rst), 
		.inst(inst), 
		.aluout(aluout)
	);
	always #15 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		inst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 rst =1;
		#50 rst=0;
		#50;// Wait 50 ns for global reset to finish
		inst=32'b00000000000001000000000000100011;// ADD X3, X1, X4
		// ISIZE =32, DSIZE=64 bit and Write and read ADDR= 5 bit. 
		#100; inst=32'b00000000001000100000000000100100;//SUB X4,X1,X2
	end
      
endmodule

