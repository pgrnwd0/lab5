`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 06:18:08 PM
// Design Name: 
// Module Name: Light_Pattern_tb
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


module Light_Pattern_tb;

reg play, start, reset, clk;
wire LD3, LD2, LD1, LD0;

Light_Pattern uut (
.play(play),
.start(start),
.reset(reset),
.clk(clk),
.LD3(LD3),
.LD2(LD2),
.LD1(LD1),
.LD0(LD0));

always #100 clk = ~clk;
initial begin
clk = 0;
reset = 1;
#200;
reset = 0;
start = 1;#200;
start = 0;#480;
play = 1; #200;
play = 0; #800;
reset = 1; #200;
reset = 0; #200;
start = 1; #200;
start = 0;#1200;
play = 1; #200;
play = 0; #200;
reset=0;
#2000;
$stop;

end
endmodule