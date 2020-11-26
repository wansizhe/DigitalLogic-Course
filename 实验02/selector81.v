`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/10 23:23:35
// Design Name: 
// Module Name: selector81
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


module selector81(
    input [7:0] iC,
    input iS2,
    input iS1,
    input iS0,
    output oZ
    );
    assign oZ=~iS2&~iS1&~iS0&iC[0]|~iS2&~iS1&iS0&iC[1]|~iS2&iS1&~iS0&iC[2]|~iS2&iS1&iS0&iC[3]|iS2&~iS1&~iS0&iC[4]|iS2&~iS1&iS0&iC[5]|iS2&iS1&~iS0&iC[6]|iS2&iS1&iS0&iC[7];
endmodule
