`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2023 00:43:56
// Design Name: 
// Module Name: zero
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


module zero(
    input CLOCK,
    input sw,
    input [12:0] pixel_index,
    output reg [15:0] oled_data
    );
    reg j;
    wire [6:0] x; //from 0 to 95
    wire [5:0] y;
    assign x = pixel_index%96;
    assign y = pixel_index/96;
    always @(CLOCK) begin
        if ((x >= 58) && (x <= 60) && (y >= 0) && (y < 59) && sw) begin
            oled_data <= 16'h07E0;
        end
        else if ((x > 0) && (x <= 60) && (y >= 58) && (y <= 60) && sw) begin
            oled_data <= 16'h07E0;
        end
        else if ((x > 10) && (x < 40) && (y > 10) && (y < 14)) begin
            oled_data <= 16'b1111111111111111;
        end
        else if ((x > 36) && (x < 40) && (y > 10) && (y < 50)) begin
            oled_data <= 16'b1111111111111111;
        end
        else if ((x > 10) && (x < 14) && (y > 10) && (y < 50)) begin
            oled_data <= 16'b1111111111111111;
        end
        else if ((x > 10) && (x < 40) && (y > 46) && (y < 50) ) begin
            oled_data <= 16'b1111111111111111;
        end
         else begin
            oled_data <= 16'h0000;
        end
            
    end

endmodule
