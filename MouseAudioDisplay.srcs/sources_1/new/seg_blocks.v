`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2023 00:00:40
// Design Name: 
// Module Name: seg_blocks
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


module seg_blocks(
    input CLOCK,
    input [12:0] pixel_index,
    input [12:0] segment_status,
    output reg [15:0] oled_data
    );
    wire [6:0] x; //from 0 to 95
    wire [5:0] y;
    assign x = pixel_index%96;
    assign y = pixel_index/96;
    always @(posedge CLOCK) begin
    //middle blocks

        oled_data = 4'h0000;
        if (segment_status[0]) begin 
            if( (x > 15 && x < 30) && (y > 10 && y < 15) ) begin
                oled_data <= 16'b1111111111111111;
            end
        end        
        
        if (segment_status[1]) begin
            if( (x > 15 && x < 30) && (y > 30 && y < 35) ) begin
                oled_data <= 16'b1111111111111111;
            end    
        end

        if (segment_status[2]) begin
            if( (x > 15 && x < 30) && (y > 50 && y < 55) ) begin
                oled_data <= 16'b1111111111111111;
            end          
        end
        if (segment_status[3]) begin
            if( (x > 10 && x < 15) && (y > 15 && y < 30) ) begin
                oled_data <= 16'b1111111111111111;
            end          
        end
        if (segment_status[4]) begin
            if( (x > 30 && x < 35) && (y > 15 && y < 30) ) begin
                oled_data <= 16'b1111111111111111;
            end           
        end
        if (segment_status[5]) begin
            if( (x > 10 && x < 15) && (y > 35 && y < 50) ) begin
                oled_data <= 16'b1111111111111111;
            end          
        end
        if (segment_status[6]) begin
            if( (x > 30 && x < 35) && (y > 35 && y < 50) ) begin
                oled_data <= 16'b1111111111111111;
            end
        end
    end
        
    
   
endmodule
