`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/12 17:42:02
// Design Name: 
// Module Name: transmission8_tb
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
module transmission8_tb(

    );
    reg [7:0] iData;
    reg A;
    reg B;
    reg C;
    wire [7:0] oData;
    
    initial
    begin
        iData=8'b11111110;
        #20 iData=8'b11111101;
        #20 iData=8'b11111011;
        #20 iData=8'b11110111;
        #20 iData=8'b11101111;
        #20 iData=8'b11011111;
        #20 iData=8'b10111111;
        #20 iData=8'b01111111;
        #20;
    end
    initial
    begin
        A=0;
        #80 A=1;
        #80;
    end
    initial
    begin
        B=0;
        #40 B=1;
        #40 B=0;
        #40 B=1;
        #40;
    end
    initial
    begin
        C=0;
        #20 C=1;
        #20 C=0;
        #20 C=1;
        #20 C=0;
        #20 C=1;
        #20 C=0;
        #20 C=1;
        #20;
    end
    
    transmission8
    transmission8_inst(
    .iData(iData),
    .A(A),
    .B(B),
    .C(C),
    .oData(oData)
    );
endmodule
