`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/15 18:07:28
// Design Name: 
// Module Name: Counter8_tb
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
module Counter8_tb();
    reg CLK;
    reg rst_n;
    wire [2:0] oQ;
    wire [6:0] oDisplay;
    Counter8 inst(
        .CLK(CLK),
        .rst_n(rst_n),
        .oQ(oQ),
        .oDisplay(oDisplay)
        );
    integer i;
    initial
    begin
        CLK=0;
        #10 CLK=1;
        for(i=0;i<22;i=i+1)
        begin
            CLK=~CLK;
            #5;
        end
    end
    initial
    begin
        rst_n=0;
        #5 rst_n=1;
        #100 rst_n=0;
    end
endmodule
