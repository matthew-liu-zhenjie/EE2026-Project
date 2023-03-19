`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 16:51:14
// Design Name: 
// Module Name: blocks_display
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


module blocks_display(
    input CLOCK,
    input clk_1hz,
    output reg [6:0] block_pos_x,
    output reg signed [8:0] block_pos_y
    );
    initial begin
        block_pos_x = 0;
        block_pos_y = -28; //starting of simulation does not matter
    end
    always @ (posedge clk_1hz) begin       
        if (block_pos_y > 64) begin
            block_pos_y <= -20; //transition lower number: if going down
        end
        else begin
            block_pos_y <= block_pos_y + 1;
        end             
    end
        
endmodule
