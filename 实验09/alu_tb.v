`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/13 21:03:10
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    reg [31:0]a;
    reg [31:0]b;
    reg [3:0]aluc;
    wire [31:0]r;
    wire z;
    wire n;
    wire c;
    wire v;
    integer i;
    alu inst(.a(a),.b(b),.aluc(aluc),.r(r),.zero(z),.negative(n),.carry(c),.overflow(v));
    initial
    begin
        a=32'h00000011;
        #500;
    end
    initial
    begin
        b=32'hfffffffe;
        #500;
    end
    initial
    begin
        aluc=4'b0000;
        for(i=0;i<16;i=i+1)
        begin
            #10;
            aluc=aluc+1;
        end
    end
endmodule
