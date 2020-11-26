`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/21 16:33:32
// Design Name: 
// Module Name: Ena_tb
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

/*
module Ena_tb();
    reg ien;
    reg clk;
    wire oen;
    wire [8:0]c;
    Ena eee(.ien(ien),.CLK(clk),.oen(oen),.c(c));
    integer i;
    initial
    begin
    clk=0;
    for(i=0;i<1000;i=i+1)
    begin
        #5;
        clk=~clk;
    end
    end
    initial
    begin
    ien=0;
    #80 ien=1;
    #11 ien=0;
    end
endmodule
    */
 /*   
    integer i,j;
    reg kb;
    reg clk;
    wire [10:0]m;
    keyboard kbd(.kb(kb),.kbclk(clk),.m(m));
    initial
    begin
        clk=0;
        for(j=0;j<1000;j=j+1)
        begin
        #5;
        clk=~clk;
        end
    end
    initial
    begin
        kb=1;
        #35 kb=0;
        for(i=0;i<15;i=i+1)
        begin
            #10 kb=~kb;
        end
    end
endmodule
*/

/*
module wave_tb();
	reg clk;
	wire beep;
	integer i;
	wave wavetb(.stdclk(clk),.beep(beep));
	initial
	begin
		clk=0;
		for(i=0;i<1000;i=i+1)
		begin
			#5;
			clk=~clk;
		end
	end
endmodule
*/

module tricol_tb();
	reg [1:0]in;
	wire [2:0]out;
	tricol1 trictb (.in(in),.out(out));
	initial
	begin
		in=2'b00;
		#50 in=2'b01;
		#50 in=2'b10;
		#50 in=2'b11;
		#50;
	end
endmodule

