`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/18 22:15:46
// Design Name: 
// Module Name: encoder83_Pri
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


module encoder83_Pri(
    input [7:0] iData,
    input iEI,
    output [2:0] oData,
    output oEO
    );
    assign oEO=~iEI;
    assign oData[2]=iEI|(~iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI);
    assign oData[1]=iEI|(~iData[5]&iData[6]&iData[7]&~iEI)|(~iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI);
    assign oData[0]=iEI|(~iData[6]&iData[7]&~iEI)|(~iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(~iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI)|(iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iData[5]&iData[6]&iData[7]&~iEI);
endmodule
