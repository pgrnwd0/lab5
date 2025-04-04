`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 11:22:20 AM
// Design Name: 
// Module Name: Button_Synchronizer_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Button_Synchronizer_tb;

reg in, clk, reset;
wire out;

Button_Synchronizer uut (
.in(in),
.reset(reset),
.clk(clk),
.out(out)
);

always #50 clk = ~clk;
initial begin
clk =0;
in = 0;
reset = 1;#97;
reset = 0; #100;

// in for more than 1 clk cycle
in = 1; #200;
in=0; #60;

// in for less than 1 clk cycle
#28;
in = 1; #100;
in = 0; #200;


// in for 1 clk cycle
#100;
in=1; #100;
in = 0;#100;


$finish;
end

endmodule
