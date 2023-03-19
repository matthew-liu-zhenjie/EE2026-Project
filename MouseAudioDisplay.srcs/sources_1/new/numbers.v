`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 15:22:55
// Design Name: 
// Module Name: numbers
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


module numbers(
    input CLOCK,
    input reset,
    input sw,sw4,sw5,sw6,
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden
    );
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data;
    wire [15:0] four_disp;
    wire [15:0] zero_disp;
    wire [15:0] five_disp;
    wire [15:0] six_disp;
    wire oledClk;
    //reg [15:0] oled_data = 16'h07E0;
    
    twentyKHz oledClkGen(CLOCK,oledClk);
    zero Zero (CLOCK,sw,pixel_index,zero_disp);  
    four Four (CLOCK,sw,pixel_index,four_disp); 
    five Five (CLOCK,sw,pixel_index,five_disp);
    six Six (CLOCK,sw,pixel_index,six_disp);
    Oled_Display od0 (oledClk, reset,frame_begin, 
            sending_pixels, sample_pixel, pixel_index, oled_data, 
            cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    always @(CLOCK) begin
        if(sw4) begin
            oled_data <= four_disp;
        end
        else if (sw5) begin
            oled_data <= five_disp;
        end
        else if (sw6) begin
            oled_data <= six_disp;
        end
        else begin
            oled_data <= zero_disp;
        end
    end
    

    
endmodule
