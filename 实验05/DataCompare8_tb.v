`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/02 19:03:20
// Design Name: 
// Module Name: DataCompare8_tb
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


module DataCompare8_tb();
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [2:0] oData;
    DataCompare8 inst(
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData)
        );
    initial
    begin
        iData_a=8'b00000010;
        #10 iData_a=8'b01000010;
        #10 iData_a=8'b00100100;
        #10;
    end
    initial
    begin
        iData_b=8'b00001000;
        #10 iData_b=8'b01000000;
        #10 iData_b=8'b00100100;
        #10;
    end
endmodule
