`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/16 18:26:38
// Design Name: 
// Module Name: display7update
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
module display7(
    input [3:0] iData,
    output [6:0] oData
    );
    assign oData[0]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0])|(~iData[3] & iData[2] & ~iData[1] & ~iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
    assign oData[1]=(~iData[3] & iData[2] & ~iData[1] & iData[0])|(~iData[3] & iData[2] & iData[1] & ~iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
    assign oData[2]=(~iData[3] & ~iData[2] & iData[1] & ~iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
    assign oData[3]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0])|(~iData[3] & iData[2] & ~iData[1] & ~iData[0])|(~iData[3] & iData[2] & iData[1] & iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
    assign oData[4]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0])|(~iData[3] & ~iData[2] & iData[1] & iData[0])|(~iData[3] & iData[2] & ~iData[1] & ~iData[0])|(~iData[3] & iData[2] & ~iData[1] & iData[0])|(~iData[3] & iData[2] & iData[1] & iData[0])|(iData[3] & ~iData[2] & ~iData[1] & iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
    assign oData[5]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0])|(~iData[3] & ~iData[2] & iData[1] & ~iData[0])|(~iData[3] & ~iData[2] & iData[1] & iData[0])|(~iData[3] & iData[2] & iData[1] & iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
    assign oData[6]=(~iData[3] & ~iData[2] & ~iData[1] & ~iData[0])|(~iData[3] & ~iData[2] & ~iData[1] & iData[0])|(~iData[3] & iData[2] & iData[1] & iData[0])|(iData[3]&~iData[2]&iData[1]&~iData[0])|(iData[3]&~iData[2]&iData[1]&iData[0])|(iData[3]&iData[2]&~iData[1]&~iData[0])|(iData[3]&iData[2]&~iData[1]&iData[0])|(iData[3]&iData[2]&iData[1]&iData[0]);
endmodule



module divider1(
    input I_CLK,
    output O_CLK
    );
    parameter m=1000;
    reg [31:0]n=32'h00000000;
    reg t;
    always @(posedge I_CLK)
    begin
        if(n==(m/2-1))
        begin
            t<=~t;
            n<=32'h00000000;
        end
        else
            n<=n+1;
    end
    assign O_CLK=t;
endmodule

module divider2(
    input I_CLK,
    output O_CLK
    );
    parameter m=100000000;
    reg [31:0]n=32'h00000000;
    reg t;
    always @(posedge I_CLK)
    begin
        if(n==(m/2-1))
        begin
            t<=~t;
            n<=32'h00000000;
        end
        else
            n<=n+1;
    end
    assign O_CLK=t;
endmodule


module times(
    input clk,
    input onoff,
    input pause,
    output [7:0] hour,
    output [7:0] minute,
    output [7:0] second
    );
    reg [7:0] h=8'b00100011;//2,3
    reg [7:0] m=8'b01011001;//5,9
    reg [7:0] s=8'b01011001;//5,9
    always @(posedge clk)
    begin
        if(onoff==1)
        begin
        if(!pause)
        begin
            if(s[3:0]==4'd9)
            begin
                s[3:0]<=4'd0;
                if(s[7:4]==4'd5) s[7:4]<=4'd0;
                else s[7:4]<=s[7:4]+1;
            end
            else    s[3:0]<=s[3:0]+1;
        end
        end
        
        else
        begin
            s<=8'b00000000;
        end
    end
    
    always @(posedge clk)
        begin
            if(onoff==1)
            begin
            if(!pause)
            begin
                if(s==8'b01011001)
                begin
                    if(m[3:0]==4'd9)
                    begin
                        m[3:0]<=4'd0;
                        if(m[7:4]==4'd5) m[7:4]<=4'd0;
                        else m[7:4]<=m[7:4]+1;
                    end
                    else m[3:0]=m[3:0]+1;
                end
            end
            end
            
            else
            begin
                m<=8'b00000000;
            end
        end
        
    always @(posedge clk)
    begin
        if(onoff==1)
        begin
        if(!pause)
        begin
            if(m==8'b01011001)
            begin
                if(h==8'b00100011)  h=8'd0;
                
                else if(h[3:0]==4'd9)
                begin
                    h[3:0]<=4'd0;
                    h[7:4]<=m[7:4]+1;
                end
                else h[3:0]=m[3:0]+1;
            end
        end
        end
                    
        else
        begin
            h<=8'b00000000;
        end
    end    
    
    assign hour=h;
    assign minute=m;
    assign second=s;
endmodule



module display7update(
    //input [15:0] idata,
    input CLK,
    input onoff,
    input pause,
    output reg [7:0] en,
    output clk1,
    output clk2,
    output [6:0] odata
    );
    reg [3:0] temp;
    reg [3:0] count=3'b000;
    wire [7:0] h;
    wire [7:0] m;
    wire [7:0] s;
    display7 inst(
        .iData(temp),
        .oData(odata)
        );
    divider1 dinst1(
        .I_CLK(CLK),
        .O_CLK(clk1)
        );
    divider2 dinst2(
        .I_CLK(CLK),
        .O_CLK(clk2)
        );
    times tinst(
        .clk(clk2),
        .onoff(onoff),
        .hour(h),
        .minute(m),
        .second(s)
    );
    always @(posedge clk1)
    begin
        if(count==3'b000)
        begin
            en<=8'b11111110;
            temp<=s[3:0];
        end
        else if(count==3'b001)
        begin 
            en<=8'b11111101;
            temp<=s[7:4];
        end
        else if(count==3'b010)
        begin
            en<=8'b11110111;
            temp<=m[3:0];
        end
        else if(count==3'b011)
        begin 
            en<=8'b11101111;
            temp<=m[7:4];
        end
        else if(count==3'b100)
        begin
            en<=8'b10111111;
            temp<=h[3:0];
        end
        else if(count==3'b101)
        begin
            en<=8'b01111111;
            temp<=h[7:4];
        end
    end
    always @(posedge clk1)
    begin
        if(count==3'b101)
            count=3'b000;
        else
            count=count+1;
    end
    
endmodule

module tricol1(
    input [1:0]in,
    output [2:0]out
    );
    reg [2:0]t;
    always @(*)
    begin
        case(in)
        2'b00:t<=3'b000;
        2'b01:t<=3'b001;
        2'b10:t<=3'b010;
        2'b11:t<=3'b100;
        endcase
    end
    assign out=t;
endmodule

module tricol2(
    input [6:0]in,
    output [2:0]out
    );
    reg [2:0]t=3'b000;
    always @(*)
    begin
        case(in)
        7'b0000001:t<=3'b001;
        7'b0000010:t<=3'b010;
        7'b0000100:t<=3'b011;
        7'b0001000:t<=3'b100;
        7'b0010000:t<=3'b101;
        7'b0100000:t<=3'b110;
        7'b1000000:t<=3'b111;
        default:t<=3'b000;
        endcase
    end
    assign out=t;
endmodule

module Ena(
    input ien,
    input CLK,
    output c,
    output oen
    );
    reg temp=0;
    reg [31:0]count=32'd0;
    always@(posedge CLK)
    begin
        if(ien==1) temp<=1;
        else if(count==32'd50000000)
        begin
            temp<=0;
            count<=32'd0;
        end    
        if(temp==1) count<=count+1;
        else    count<=32'd0;
    end
    assign oen=temp;
    assign c=count;
endmodule

//音频波形，脉冲宽度调制
module wave(
    input kb,
    input kbclk,
    input stdclk,
    
    input onoff,
    input pause,
    output [7:0] en,
    output clk1,
    output clk2,
    output [6:0] odata,
    
    output beep,
    output [2:0]tric1,
    output [2:0]tric2
    );
    wire [31:0]TIME;
    reg [31:0]count=32'd0;
    reg tbee=0;
    wire [1:0]degree;
    selectTIME sT(.clk(stdclk),.kb(kb),.kbclk(kbclk),.degree(degree),.TIME(TIME),.tric2(tric2));
    tricol1 tc1(.in(degree),.out(tric1));
    display7update dig7(.CLK(stdclk),.onoff(onoff),.pause(pause),.en(en),.clk1(clk1),.clk2(clk2),.odata(odata));
    always @(posedge stdclk)
    begin
        if(count<TIME)  count=count+1;
        else    
        begin
            count=32'd0;
            tbee=~tbee;
        end
    end
    assign beep=tbee;
endmodule

//数据选择器，选择声音
module selectTIME(
    input clk,
    input kb,
    input kbclk,
    output [1:0]degree,
    output [2:0]tric2,
    output [31:0]TIME
    );
    wire [6:0]key;
    wire kbpress;
    reg [31:0]temp;
 
    keyboard kbdin(.clk(clk),.kb(kb),.kbclk(kbclk),.rst(1'b1),.m({degree,key}),.kbpress(kbpress));
    tricol2 tc2(.in(key),.out(tric2));

    always @(key or degree)
    begin
        if(degree==2'b10)
        case(key)
        7'b0000001:temp=32'd95602;
        7'b0000010:temp=32'd85179;
        7'b0000100:temp=32'd75873;
        7'b0001000:temp=32'd71633;
        7'b0010000:temp=32'd63776;
        7'b0100000:temp=32'd56818;
        7'b1000000:temp=32'd50607;
        default:temp=32'd0;
        endcase
        else if(degree==2'b01)
        case(key)
        7'b0000001:temp=32'd190840;
        7'b0000010:temp=32'd170068;
        7'b0000100:temp=32'd151515;
        7'b0001000:temp=32'd143266;
        7'b0010000:temp=32'd127551;
        7'b0100000:temp=32'd113636;
        7'b1000000:temp=32'd101215;
        default:temp=32'd0;
        endcase
        else if(degree==2'b11)
        case(key)
        7'b0000001:temp=32'd47801;
        7'b0000010:temp=32'd42553;
        7'b0000100:temp=32'd37936;
        7'b0001000:temp=32'd35791;
        7'b0010000:temp=32'd31888;
        7'b0100000:temp=32'd28409;
        7'b1000000:temp=32'd25304;
        default:temp=32'd0;
        endcase
        else    temp=32'd0;
    end
    assign TIME=temp;
endmodule

module keyboard(
    input clk,
    input kb,
    input kbclk,
    input rst,
    output reg kbpress,
    output [8:0]m
);
    
    reg kbclk0,kbclk1;
    
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
        begin
            kbclk0<=0;
            kbclk1<=0;
        end
        else
        begin
            kbclk0<=kbclk;
            kbclk1<=kbclk0;
        end
    end
    wire kbclkn=(~kbclk0)&kbclk1;
    
    reg [3:0]count;
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            count<=0;
        else if(kbclkn)
        begin
            if(count>=4'd10)
                count<=0;
            else
                count<=count+1;
        end
    end
    
    reg [7:0] buffer;
    always @(posedge clk or negedge rst)
    begin
        if(!rst)
            buffer<=8'd0;
        else if(kbclkn)
            case(count)
            4'd1:buffer[0]<=kb;
            4'd2:buffer[1]<=kb;
            4'd3:buffer[2]<=kb;
            4'd4:buffer[3]<=kb;
            4'd5:buffer[4]<=kb;
            4'd6:buffer[5]<=kb;
            4'd7:buffer[6]<=kb;
            4'd8:buffer[7]<=kb;
            default:;
            endcase
    end
    
    reg released;
    reg [7:0] data;
    always@ (posedge clk or negedge rst)
    begin
        if(!rst)
            released<=0;
        else if(count==4'd10&&kbclkn)
        begin
            if(buffer==8'hf0)
                released<=1;
            else
                released<=0;
        end
    end
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
        begin
            kbpress<=0;
        end
        else if(count==4'd10&&kbclkn)
        begin
            if(!released)
            begin
                data<=buffer;
                kbpress<=1;
            end
        end
        else
        begin
            kbpress<=0;
        end
    end
    
    reg [6:0]mm;
    always @(*)
    begin
        case(data)
        8'h15:mm<=7'b0000001;
        8'h1c:mm<=7'b0000001;
        8'h22:mm<=7'b0000001;
        
        8'h1d:mm<=7'b0000010;
        8'h1b:mm<=7'b0000010;
        8'h21:mm<=7'b0000010;
        
        8'h24:mm<=7'b0000100;
        8'h23:mm<=7'b0000100;
        8'h2a:mm<=7'b0000100;
        
        8'h2d:mm<=7'b0001000;
        8'h2b:mm<=7'b0001000;
        8'h32:mm<=7'b0001000;
        
        8'h3c:mm<=7'b0010000;
        8'h3b:mm<=7'b0010000;
        8'h31:mm<=7'b0010000;
        
        8'h43:mm<=7'b0100000;
        8'h42:mm<=7'b0100000;
        8'h3a:mm<=7'b0100000;
        
        8'h44:mm<=7'b1000000;
        8'h4b:mm<=7'b1000000;
        8'h41:mm<=7'b1000000;
        default:mm<=7'b0000000;
        endcase
    end
    
    reg [1:0]degree;
    always @(*)
    begin
        case(data)
        8'h15:degree<=2'b11;
        8'h1d:degree<=2'b11;
        8'h24:degree<=2'b11;
        8'h2d:degree<=2'b11;
        8'h3c:degree<=2'b11;
        8'h43:degree<=2'b11;
        8'h44:degree<=2'b11;
        
        8'h1c:degree<=2'b10;
        8'h1b:degree<=2'b10;
        8'h23:degree<=2'b10;
        8'h2b:degree<=2'b10;
        8'h3b:degree<=2'b10;
        8'h42:degree<=2'b10;
        8'h4b:degree<=2'b10;
        
        8'h22:degree<=2'b01;
        8'h21:degree<=2'b01;
        8'h2a:degree<=2'b01;
        8'h32:degree<=2'b01;
        8'h31:degree<=2'b01;
        8'h3a:degree<=2'b01;
        8'h41:degree<=2'b01;
        
        default:degree<=2'b00;
        endcase
    end
    
    assign m={degree,mm};
endmodule

