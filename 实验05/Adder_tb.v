`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/02 20:09:38
// Design Name: 
// Module Name: Adder_tb
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


module Adder_tb();
    reg iSA;
    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [8:0] oData;
    wire oData_C;
    Adder inst(
        .iSA(iSA),
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData),
        .oData_C(oData_C)
        );
    initial
    begin
        iSA=0;
        #20 iSA=1;
        #50;
    end
    initial
    begin
        iData_a=8'b00000100;
        #10 iData_a=8'b10000100;
        #10 iData_a=8'b01000001;
        #10 iData_a=8'b11000001;
        #10 iData_a=8'b10000010;
        #10 iData_a=8'b01000000;
        #10 iData_a=8'b01111111;
        #10;
    end    
    initial
    begin
        iData_b=8'b00000110;
        #10 iData_b=8'b10000000;
        #10 iData_b=8'b01000010;
        #10 iData_b=8'b10100001;
        #10 iData_b=8'b00000001;
        #10 iData_b=8'b10000001;
        #10 iData_b=8'b11111111;
        #10;
    end
endmodule
