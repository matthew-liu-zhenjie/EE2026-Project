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
    inout PS2Clk,PS2Data, //Mouse
    output cs,sdin,sclk,d_cn,resn,vccen,pmoden


    );
    wire frame_begin,sending_pixels,sample_pixel;
    wire [12:0] pixel_index;
    reg [15:0] oled_data;
    wire [15:0] outlines;
    wire [15:0] blocks;
    wire clk_1hz;
    
    //Mouse stuff
    wire [11:0] x_input;
    wire [11:0] y_input;
    wire click; //click input from mouse
    wire full_click; //debounced click input
    wire [6:0] x_val;
    wire [6:0] y_val;
    wire [6:0] conv_x;
    wire [5:0] conv_y;
    wire [15:0] mousePos;
    
    assign conv_x = x_input/10;
    assign conv_y = y_input/10;
    //clock wire for OLED usage
    wire oledClk;
    wire debounceClk;
    
    //Declare register to store current state of lit segments
    wire[12:0] segment_lit;
    
    //declare clocks
    clocks clock(.CLOCK(CLOCK),.clk_625mhz(oledClk),.clk_1hz(clk_1hz));
    ThousandHz debounce_clk(CLOCK, debounceClk);
    
    //Declare OLED
    Oled_Display od0 (oledClk, reset,frame_begin, 
                sending_pixels, sample_pixel, pixel_index, oled_data, 
                cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    
    //Connect Mouse inputs
    MouseCtl Mouse (CLOCK,,x_input,y_input,,click,,,,,,,,,PS2Clk, PS2Data);    
    debouncer(click, debounceClk, full_click);
    
    convertXY xy_conv(pixel_index, x_val, y_val); //obtain equivalent x-values and y_values of oled.
    handleClick clickHandler(debounceClk, full_click, conv_x, conv_y, segment_lit);
    
    //Initialize segment display
    segment_display sd(CLOCK,pixel_index,outlines);
    seg_blocks sb(.CLOCK(CLOCK),.pixel_index(pixel_index),.segment_status(segment_lit),.oled_data(blocks)); 
    mouseDisplay(CLOCK, x_val, y_val, conv_x, conv_y, mousePos);
    
    always @(posedge oledClk) begin
        oled_data <= outlines | blocks |mousePos ;
        
    end
    
    
    
    
    
endmodule
