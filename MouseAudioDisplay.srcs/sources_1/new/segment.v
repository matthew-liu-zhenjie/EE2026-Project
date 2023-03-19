`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 23:25:44
// Design Name: 
// Module Name: segment
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


module segment(
    input CLOCK,
    input [6:0] sw,
    input reset,
    output cs,sdin,sclk,d_cn,resn,vccen,pmoden


    );
    wire frame_begin,sending_pixels,sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data;
    wire [15:0] outlines;
    wire [15:0] blocks;
    wire clk_1hz;
    
    wire oledClk;
    clocks clock(.CLOCK(CLOCK),.clk_625mhz(oledClk),.clk_1hz(clk_1hz));
    Oled_Display od0 (oledClk, reset,frame_begin, 
                sending_pixels, sample_pixel, pixel_index, oled_data, 
                cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    segment_display sd(CLOCK,pixel_index,outlines);
    seg_blocks sb(.CLOCK(CLOCK),.sw(sw),.pixel_index(pixel_index),.oled_data(blocks));   
    
    always @(CLOCK) begin
        oled_data <= outlines | blocks;
    end
    
    
    
endmodule
