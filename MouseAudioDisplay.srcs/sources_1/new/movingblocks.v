`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 16:49:58
// Design Name: 
// Module Name: movingblocks
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


module movingblocks(
    input CLOCK,
    input [6:0] sw,
    input reset,
    output cs,sdin,sclk,d_cn,resn,vccen,pmoden
    );
    wire frame_begin,sending_pixels,sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data; 
    wire [15:0] draw_oled;
    wire oledClk;
    wire clk_1hz;
    wire [6:0] pos_x;
    wire signed [8:0] pos_y;       
        
    clocks clock(.CLOCK(CLOCK),.clk_625mhz(oledClk),.clk_1hz(clk_1hz));
    Oled_Display od0 (oledClk, reset,frame_begin, 
                sending_pixels, sample_pixel, pixel_index, oled_data, 
                cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    blocks_display blks(.CLOCK(CLOCK),.clk_1hz(clk_1hz),.block_pos_x(pos_x),.block_pos_y(pos_y));
    displayOLED disp(.CLOCK(CLOCK),.pixel_index(pixel_index),.block_pos_x(pos_x),.block_pos_y(pos_y),.oled_data(draw_oled));
    
    always @(posedge CLOCK) begin
        oled_data <= draw_oled;
    end
    
endmodule
