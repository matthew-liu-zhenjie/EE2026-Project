`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input CLOCK,
    input reset,
    input sw,
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden
    );
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    wire oledClk;
    reg [15:0] oled_data = 16'h07E0;
    
    twentyKHz oledClkGen(CLOCK,oledClk);
    
    Oled_Display od0 (oledClk, reset,frame_begin, 
            sending_pixels, sample_pixel, pixel_index, oled_data, 
            cs, sdin, sclk, d_cn, resn, vccen, pmoden);
    always @(CLOCK) begin
        if (sw) begin
            oled_data <= 16'b1101100000000000;
        end
        else begin
            oled_data <= 16'h07E0;
        end
    end
            
    

    // Delete this comment and write your codes and instantiations here

endmodule