`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/09 19:51:58
// Design Name: 
// Module Name: de_selector14_tb
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


module de_selector14_tb();
    reg iC;
    reg iS0;
    reg iS1;
    wire oZ0;
    wire oZ1;
    wire oZ2;
    wire oZ3;
    de_selector14 uut(iC,iS1,iS0,oZ0,oZ1,oZ2,oZ3);
    initial
    begin
    iC=0;
    #100;
    end
    initial
    begin
    iS1=0;
    #40;
    iS1=1;
    #40;
    end
    initial
    begin
    iS0=0;
    #20;
    iS0=1;
    #40;
    iS0=0;
    #20;
    end
endmodule
