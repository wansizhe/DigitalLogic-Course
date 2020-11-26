`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 20:39:35
// Design Name: 
// Module Name: Regfiles_tb
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


module Regfiles_tb();
    reg clk;
    reg rst;
    reg we;
    reg [4:0] raddr1;
    reg [4:0] raddr2;
    reg [4:0] waddr;
    reg [31:0] wdata;
    wire [31:0] rdata1;
    wire [31:0] rdata2;
    integer i;
    Regfiles reg3232(
        .clk(clk),
        .rst(rst),
        .we(we),
        .raddr1(raddr1),
        .raddr2(raddr2),
        .waddr(waddr),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
        );
    initial
    begin
        clk=0;
        for(i=0;i<500;i=i+1)
        begin
            #5;
            clk=~clk;
        end
    end
    initial
    begin
        wdata=32'habcdef12;
        #15 wdata=32'h12345678;
    end
    initial
    begin
        we=1;
        #25 we=0;
    end
    initial
    begin
        waddr=5'b10101;
        #15 waddr=5'b01010;
    end
    initial
    begin
        raddr1=5'b10101;
    end
    initial
    begin
        raddr2=5'b01010;
    end
    initial
    begin
        rst=0;
        #40 rst=1;
    end
endmodule
