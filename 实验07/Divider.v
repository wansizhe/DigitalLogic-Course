`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/15 19:14:25
// Design Name: 
// Module Name: Divider
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


module Divider(
    input I_CLK,
    input Rst,
    output O_CLK
    );
    parameter m=20;
    reg [31:0]n=32'h00000000;
    reg t=0;
    always @(posedge I_CLK or posedge Rst)
    begin
        if(Rst==1)
        begin
            t<=0;
            n<=32'h00000000;
        end
        else 
        begin
            if(n==(m/2-1))
            begin
                t<=~t;
                n<=32'h00000000;
            end
            else
                n<=n+1;
        end
    end
    assign O_CLK=t;
endmodule
