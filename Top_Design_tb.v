`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2025 07:30:08 PM
// Design Name: 
// Module Name: Top_Design_tb
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


module Top_Design_tb;
reg CLK100MHZ, BTNU, BTNC, BTND;
wire [3:0] LED;
Top_Design uut (.CLK100MHZ(CLK100MHZ), 
.BTNU(BTNU), 
.BTNC(BTNC), 
.BTND(BTND), 
.LED(LED));

always #400 CLK100MHZ = ~CLK100MHZ;
initial begin
CLK100MHZ <= 0;
BTNU <= 1;
BTNC <= 0;
BTND <= 0;#800;

BTNU <= 0;#800;
BTNC <= 1; #800;
BTNC <= 0; #4000;
//BTND <= 1; #400;
//BTND <= 0; #400;
end
endmodule
