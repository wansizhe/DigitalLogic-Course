`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/25 19:47:17
// Design Name: 
// Module Name: barrelshifter32_tb
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
module barrelshifter32_tb();
    reg [31:0] a;
    wire [31:0] c;
    reg [4:0] b;
    reg [1:0] aluc;
    
    barrelshifter32 inst (
        .a(a),
        .b(b),
        .aluc(aluc),
        .c(c)
    );
    
    initial
    begin
        a=32'hffffffff;
        #480 a=32'h80000000;
        #160;
    end
    
    initial
    begin
        b=5'b00000;
        #20 b=5'b00001;
        #20 b=5'b00010;
        #20 b=5'b00011;
        #20 b=5'b00100;
        #20 b=5'b00101;
        #20 b=5'b00110;
        #20 b=5'b00111;
        #20 b=5'b01000;
        #20 b=5'b01001;
        #20 b=5'b01010;
        #20 b=5'b01011;
        #20 b=5'b01100;
        #20 b=5'b01101;
        #20 b=5'b01110;
        #20 b=5'b01111;
        #20 b=5'b10000;
        #20 b=5'b10001;
        #20 b=5'b10010;
        #20 b=5'b10011;
        #20 b=5'b10100;
        #20 b=5'b10101;
        #20 b=5'b10110;
        #20 b=5'b10111;
        #20 b=5'b11000;
        #20 b=5'b11001;
        #20 b=5'b11010;
        #20 b=5'b11011;
        #20 b=5'b11100;
        #20 b=5'b11101;
        #20 b=5'b11110;
        #20 b=5'b11111;
        #20;
    end
    
    initial
    begin
        aluc=2'b11;
        #160 aluc=2'b01;
        #160 aluc=2'b10;
        #160 aluc=2'b00;
        #160;
    end
    
endmodule
