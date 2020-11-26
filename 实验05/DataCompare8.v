`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/31 23:12:20
// Design Name: 
// Module Name: DataCompare8
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


module DataCompare8(
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData
    );
    wire [2:0] temp;
    DataCompare4 inst1(
        .iData_a(iData_a[3:0]),
        .iData_b(iData_b[3:0]),
        .iData(3'b001),
        .oData(temp)
        );
    DataCompare4 inst2(
        .iData_a(iData_a[7:4]),
        .iData_b(iData_b[7:4]),
        .iData(temp),
        .oData(oData)
        );
endmodule
