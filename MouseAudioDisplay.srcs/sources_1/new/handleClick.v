`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 20:51:11
// Design Name: 
// Module Name: handleClick
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


module handleClick(
    input CLOCK,
    input left_click,
    input [6:0] x,
    input [5:0] y,
    output reg [12:0] seglit = 0
    );
    reg change_flag = 1;
    always @(posedge CLOCK) begin
        if (left_click) begin
            seglit[0] <= ((x > 15 && x < 30) && (y > 10 && y < 15) && change_flag)?~seglit[0]:seglit[0];
            seglit[1] <= ((x > 15 && x < 30) && (y > 30 && y < 35) && change_flag)?~seglit[1]:seglit[1];
            seglit[2] <= ((x > 15 && x < 30) && (y > 50 && y < 55) && change_flag)?~seglit[2]:seglit[2];
            seglit[3] <= ((x > 10 && x < 15) && (y > 15 && y < 30) && change_flag)?~seglit[3]:seglit[3];
            seglit[4] <= ((x > 30 && x < 35) && (y > 15 && y < 30) && change_flag)?~seglit[4]:seglit[4];
            seglit[5] <= ((x > 10 && x < 15) && (y > 35 && y < 50) && change_flag)?~seglit[5]:seglit[5];
            seglit[6] <= ((x > 30 && x < 35) && (y > 35 && y < 50) && change_flag)?~seglit[6]:seglit[6];
            change_flag <= 0;
        end
        if (!left_click) begin
            change_flag <= 1;
        end
    end

endmodule
