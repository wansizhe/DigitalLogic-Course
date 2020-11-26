`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 20:19:20
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
    input [4:0] iData,
    input iEna,
    output [31:0] oData
    );
    genvar i;
    generate 
    for(i=0;i<32;i=i+1)
    begin:bit
        assign oData[i]=(iData==i)&&(iEna==1)?1'b1:1'b0;
    end
    endgenerate
endmodule
