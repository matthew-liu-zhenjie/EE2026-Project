`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 16:53:07
// Design Name: 
// Module Name: clocks
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


module clocks(
    input CLOCK,
    output reg clk_1hz, 
    output reg clk_625mhz
    );
    initial begin
        clk_1hz <= 0; 
        clk_625mhz <= 0;
    end
    reg [25:0] counter_1hz = 0; 
    reg [4:0] counter_625mhz = 0;
    always @(posedge CLOCK) begin
    
        counter_1hz <= counter_1hz + 1;
        counter_625mhz <= counter_625mhz + 1;
        if (counter_1hz == 499_999_9) begin //set to 0.1hz
            counter_1hz <= 0;
            clk_1hz <= ~clk_1hz;
        end
        if (counter_625mhz == 15) begin
            counter_625mhz <= 0;
            clk_625mhz <= ~clk_625mhz;
        end
    
    end        
    
endmodule
