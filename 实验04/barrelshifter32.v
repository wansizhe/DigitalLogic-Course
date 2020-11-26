`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/25 19:30:40
// Design Name: 
// Module Name: barrelshifter32
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


module barrelshifter32(
    input [31:0] a,
    input [4:0] b,
    input [1:0] aluc,
    output reg signed [31:0] c
    );
    reg signed [31:0] temp;
    always @(*)
    begin
        temp=a;
        if(aluc==2'b00)
        begin
            if(b[0]==1)temp=temp>>>1;
            if(b[1]==1)temp=temp>>>2;
            if(b[2]==1)temp=temp>>>4;
            if(b[3]==1)temp=temp>>>8;
            if(b[4]==1)temp=temp>>>16;
        end
        else if(aluc==2'b10)
        begin
            if(b[0]==1)temp=temp>>1;
            if(b[1]==1)temp=temp>>2;
            if(b[2]==1)temp=temp>>4;
            if(b[3]==1)temp=temp>>8;
            if(b[4]==1)temp=temp>>16;
        end
        else if(aluc==2'b01)
        begin
            if(b[0]==1)temp=temp<<<1;
            if(b[1]==1)temp=temp<<<2;
            if(b[2]==1)temp=temp<<<4;
            if(b[3]==1)temp=temp<<<8;
            if(b[4]==1)temp=temp<<<16;
        end
        else if(aluc==2'b11)
        begin
            if(b[0]==1)temp=temp<<1;
            if(b[1]==1)temp=temp<<2;
            if(b[2]==1)temp=temp<<4;
            if(b[3]==1)temp=temp<<8;
            if(b[4]==1)temp=temp<<16;
        end
        c=temp;
    end
endmodule
