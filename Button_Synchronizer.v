`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 11:16:37 AM
// Design Name: 
// Module Name: Button_Synchronizer
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


module Button_Synchronizer(in, clk, reset, out);
input in, clk, reset;
output out;

reg state;
always @ (posedge clk) begin
if (reset) begin
state <= 0; 
end
else if (state) begin
state <= 0;
end
else if (in) begin
state <= 1;
end
end

assign out = state;
endmodule
