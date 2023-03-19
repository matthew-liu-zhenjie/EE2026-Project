`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 23:30:45
// Design Name: 
// Module Name: segment_display
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


module segment_display(
    input CLOCK,
    input [12:0] pixel_index,
    output reg [15:0] oled_data
    );
    wire [6:0] x; //from 0 to 95
    wire [5:0] y;
    wire [15:0] blocks;
    
    
    assign x = pixel_index%96;
    assign y = pixel_index/96;
    always @(CLOCK) begin
        if ((y == 10 || y == 15 || y == 30 || y == 35 || y == 50 || y == 55) && x >= 10 && x <= 35) begin
            oled_data <= 16'b1111111111111111;
        end
        else if ( (x == 10 || x == 15 || x == 30 || x == 35) && (y >= 10 && y <= 55) ) begin
            oled_data <= 16'b1111111111111111;
        end
        else begin
            oled_data <= 16'h0000;
        end             
    end
endmodule
