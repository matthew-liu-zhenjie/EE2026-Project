`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 20:23:11
// Design Name: 
// Module Name: convertXY
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


module convertXY( //convert OLED to XY coord
    input [12:0] pixel_index,
    output [6:0] x_index, y_index
    );
    assign x_index = pixel_index%96;
    assign y_index = pixel_index/96;
endmodule
