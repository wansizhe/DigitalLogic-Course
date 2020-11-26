`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/09 10:45:35
// Design Name: 
// Module Name: mux_tb
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
module selector41_tb();
    reg [3:0] iC0;
    reg [3:0] iC1;
    reg [3:0] iC2;
    reg [3:0] iC3;
    reg iS0;
    reg iS1;
    wire [3:0] oZ;
    selector41 utt(iC0,iC1,iC2,iC3,iS1,iS0,oZ);
    initial
    begin 
        iC0=4'b0101;
        #100;
    end
    initial
    begin
        iC1=4'b1010;
        #100;
    end
    initial
    begin
        iC2=4'b0000;
        #100;
    end
    initial
    begin
        iC3=4'b1111;
        #100;
    end
    initial
    begin
        iS0=0;
        #20 iS0=1;
        #40 iS0=0;
        #20;
    end
    initial
    begin
        iS1=0;
        #40 iS1=1;
        #40;
    end
     
endmodule
