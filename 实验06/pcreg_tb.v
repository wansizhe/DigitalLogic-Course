`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/09 22:30:08
// Design Name: 
// Module Name: pcreg_tb
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


module pcreg_tb();
    reg clk;
    reg rst;
    reg ena;
    reg [31:0] data_in;
    wire [31:0] data_out;
    pcreg inst(
        .clk(clk),
        .rst(rst),
        .ena(ena),
        .data_in(data_in),
        .data_out(data_out)
        );
    initial
    begin
        rst=1;
        #5 rst=0;
        #25 rst=1;
        #5;
    end
    initial
    begin
        clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5 clk=1;
        #5 clk=0;
        #5;
    end
    initial
    begin
        ena=0;
        #10 ena=1;
        #25;
    end
    initial
    begin
        data_in=8'h12345678;
        #10 data_in=8'habcdef05;
        #10 data_in=8'hffffffff;
        #15;
    end
endmodule
