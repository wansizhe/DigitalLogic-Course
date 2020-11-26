`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/18 22:39:53
// Design Name: 
// Module Name: encoder83_Pri_tb
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
module encoder83_Pri_tb();
    reg [7:0] in;
    reg ei;
    wire [2:0] out;
    wire eo;
    encoder83_Pri inst(
        .iData(in),
        .iEI(ei),
        .oData(out),
        .oEO(eo)
        );
        
    initial
    begin
    ei=1;
    #10 ei=0;
    #80;
    end
    
    initial
    begin
    in=8'b11111111;
    #10 in=8'b01010101;
    #10 in=8'b10101010;
    #10 in=8'b11010101;
    #10 in=8'b11101010;
    #10 in=8'b11110101;
    #10 in=8'b11111010;
    #10 in=8'b11111101;
    #10 in=8'b11111110;
    #10;
    end
endmodule
