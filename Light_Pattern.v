`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 05:28:53 PM
// Design Name: 
// Module Name: Light_Pattern
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


module Light_Pattern(start, play, reset, clk, LD3, LD2, LD1, LD0);
input start, play, reset, clk;
output reg LD3, LD2, LD1, LD0;

reg [3:0] state, nxtState;
localparam IDLE=0, FIRST=1,
SECOND=2, THIRD=3, FOURTH=4,
FIFTH=5, SIXTH=6, SEVENTH = 7,
GAME_OVER=8, GAME_OVER2 = 9;
// Next-state logic (combinational)

// State register update (sequential logic)
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
    end
    else begin
        state <= nxtState;
    end
end

always @(*) begin
nxtState = state;
case (state)
IDLE :  begin
        if (start)nxtState = FIRST;
        else begin nxtState = IDLE; end 
        LD3 <=0; LD2<=0; LD1<=0; LD0 <=0; end
FIRST : begin nxtState = SECOND;
        LD3 <= 1; end
SECOND : begin nxtState = THIRD;
        LD3 <= 0; LD2 <= 1; end
THIRD : begin nxtState = FOURTH;
        LD2 <= 0; LD1 <= 1; end
FOURTH : begin nxtState = FIFTH;
        LD1 <= 0; LD0 <= 1; end
FIFTH : begin nxtState = SIXTH;
        LD0 <= 0; LD1 <= 1; end
SIXTH : begin nxtState = SEVENTH;
        LD1 <= 0; LD2 <= 1; end
SEVENTH : begin if (play) nxtState <= SECOND;
            else begin nxtState <= GAME_OVER; end 
            LD3 <= 1; LD2 <= 0; end
GAME_OVER : begin nxtState <= GAME_OVER2;
             LD3 <=1; LD2<=1; LD1<=1; LD0 <=1; end
GAME_OVER2 : begin nxtState <= GAME_OVER;
             LD3 <=0; LD2<=0; LD1<=0; LD0 <=0; end
endcase
end                               



endmodule
