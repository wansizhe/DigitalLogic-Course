`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/06 23:36:31
// Design Name: 
// Module Name: ram2
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


module ram2(
    input clk, 
    input ena, 
    input wena, 
    input [4:0] addr,
    inout [31:0] data 
    );
    reg [31:0] temp;
    reg [31:0] m[31:0];
    always @(posedge clk)
    begin
        if(ena==0)
            temp<=32'bz;
        else
        begin
            if(wena==0)
                temp=m[addr];
            else
            begin
                m[addr]<=data;
            end
        end
    end
    assign data=temp;
endmodule
