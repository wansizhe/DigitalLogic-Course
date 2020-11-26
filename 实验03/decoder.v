`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/18 14:57:05
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [2:0] iData,
    input [1:0] iEna,
    output [7:0] oData
    );
    assign oData[0]=~(~iData[2] & ~iData[1] & ~iData[0] & iEna[1] & ~iEna[0]);
    assign oData[1]=~(~iData[2] & ~iData[1] & iData[0] & iEna[1] & ~iEna[0]);
    assign oData[2]=~(~iData[2] & iData[1] & ~iData[0] & iEna[1] & ~iEna[0]);
    assign oData[3]=~(~iData[2] & iData[1] & iData[0] & iEna[1] & ~iEna[0]);
    assign oData[4]=~(iData[2] & ~iData[1] & ~iData[0] & iEna[1] & ~iEna[0]);
    assign oData[5]=~(iData[2] & ~iData[1] & iData[0] & iEna[1] & ~iEna[0]);
    assign oData[6]=~(iData[2] & iData[1] & ~iData[0] & iEna[1] & ~iEna[0]);
    assign oData[7]=~(iData[2] & iData[1] & iData[0] & iEna[1] & ~iEna[0]);
endmodule
