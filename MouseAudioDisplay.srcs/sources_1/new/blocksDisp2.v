`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 18:53:27
// Design Name: 
// Module Name: blocksDisp2
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


module blocksDisp2(
    input CLOCK,
    input clk_1hz,
    output reg [6:0] block_pos_x,
    output reg [6:0] block_pos_y
    );
    initial begin
        block_pos_x = 0;
        block_pos_y = 20;
    end
    always @ (posedge clk_1hz) begin       
        if (block_pos_y > 63) begin
            block_pos_y <= 0;
        end
        else begin
            block_pos_y <= block_pos_y + 1;
        end             
    end
        
endmodule
