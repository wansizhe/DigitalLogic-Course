`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/10 23:08:40
// Design Name: 
// Module Name: transmission8
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


module transmission8(
    input [7:0] iData,
    input A,
    input B,
    input C,
    output [7:0] oData
    );
    wire temp;
    selector81 s(.iC(iData),.iS2(A),.iS1(B),.iS0(C),.oZ(temp));
    de_selector18 ds(.iC(temp),.iS2(A),.iS1(B),.iS0(C),.oZ(oData));
endmodule
