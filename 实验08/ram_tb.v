`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 19:29:50
// Design Name: 
// Module Name: ram_tb
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
module ram_tb();
    reg clk;
    reg ena; 
    reg wena; 
    reg [4:0] addr; 
    reg [31:0] data_in; 
    wire [31:0] data_out;
    ram inst(
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
        );
    integer i;
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
        ena=0;
        #20 ena=1;
    end
    initial
    begin
        wena=0;
        #10 wena=1;
        #30 wena=0;
    end
    initial
    begin
        data_in=32'habcdef12;
       #30 data_in=32'h12345678;
       #10;
    end
    initial
    begin
        addr=5'b01010;
        #30 addr=5'b10101;
        #10 addr=5'b01010;
        #10 addr=5'b10101;
        #10;
    end
endmodule
