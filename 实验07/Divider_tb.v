`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/15 19:44:53
// Design Name: 
// Module Name: Divider_tb
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
module Divider_tb();
    reg I_CLK;
    reg Rst;
    wire O_CLK;
    Divider inst(
        .I_CLK(I_CLK),
        .Rst(Rst),
        .O_CLK(O_CLK)
        );
    integer i;
    initial
    begin
        I_CLK=0;
        for(i=0;i<500;i=i+1)
            #5 I_CLK=~I_CLK;
    end
    initial
    begin
        Rst=0;
        #200 Rst=1;
        #5 Rst=0;
    end
endmodule
