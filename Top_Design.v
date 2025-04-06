`timescale 1ns / 1ps

module Top_Design(CLK100MHZ, BTNU, BTNC, BTND, LED);
    input CLK100MHZ, BTNU, BTNC, BTND;
    output [3:0] LED;
        
    // The code below is to instantiate the ClkDiv module that
	//you can use for this part	
    wire ClkOut;
    //ClkDiv a1(CLK100MHZ, 1'b0, ClkOut);
    
    //see figure 2 in the lab handout and add your code below to 
	//a) instantiate the Button synchronizer and make connections
	wire startOut, playOut;
	Button_Synchronizer play(BTND , CLK100MHZ, BTNU, playOut);
	Button_Synchronizer start(BTNC, CLK100MHZ, BTNU, startOut);
	//b) instantiate the light pattern generator and make connections.
	Light_Pattern lights (startOut, playOut, BTNU, CLK100MHZ, LED[3], LED[2], LED[1], LED[0]);		


endmodule