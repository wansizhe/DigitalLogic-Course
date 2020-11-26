`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/18 21:26:31
// Design Name: 
// Module Name: encoder83_tb
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

`timescale 1ns/1ns
module encoder83_tb();
    reg [7:0] in;
    wire [2:0] out;
    encoder83 inst(
        .iData(in),
        .oData(out)
        );
    
    initial
    begin
    in=8'b10000000;
    #10 in=8'b01000000;
    #10 in=8'b00100000;
    #10 in=8'b00010000;
    #10 in=8'b00001000;
    #10 in=8'b00000100;
    #10 in=8'b00000010;
    #10 in=8'b00000001;
    end
endmodule
