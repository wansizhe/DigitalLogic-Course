`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/10 23:22:01
// Design Name: 
// Module Name: de_selector18
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


module de_selector18(
    input iC,
    input iS2,
    input iS1,
    input iS0,
    output [7:0] oZ
    );
    assign oZ[0]=iS2|iS1|iS0|iC;
    assign oZ[1]=iS2|iS1|~iS0|iC;
    assign oZ[2]=iS2|~iS1|iS0|iC;
    assign oZ[3]=iS2|~iS1|~iS0|iC;
    assign oZ[4]=~iS2|iS1|iS0|iC;
    assign oZ[5]=~iS2|iS1|~iS0|iC;
    assign oZ[6]=~iS2|~iS1|iS0|iC;
    assign oZ[7]=~iS2|~iS1|~iS0|iC;
endmodule
