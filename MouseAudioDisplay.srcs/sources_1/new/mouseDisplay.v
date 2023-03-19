`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 20:38:52
// Design Name: 
// Module Name: mouseDisplay
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


module mouseDisplay(
    input clock,
    input [6:0] x_val, y_val,
    input [6:0] conv_x, 
    input [5:0] conv_y,
    output reg [15:0] oled_data = 0
    );
    always @(posedge clock) begin
        if (((x_val >= conv_x - 1)&&(x_val <= conv_x + 1))  && ((y_val >= conv_y-1) && (y_val <= conv_y + 1))) begin
            oled_data <= 16'hFFFF;
        end
        else begin
            oled_data = 16'h0;
        end;
    end
endmodule
