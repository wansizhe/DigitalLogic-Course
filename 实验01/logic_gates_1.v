`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/21 18:41:10
// Design Name: 
// Module Name: logic_gates
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


module logic_gates_1(
    input iA,
    input iB,
    output oAnd,
    output oOr,
    output oNot
    );
    and and_inst(oAnd,iA,iB);
    or  or_inst(oOr,iA,iB);
    not not_inst(oNot,iA);
endmodule
