`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 14:11:12
// Design Name: 
// Module Name: ThousandHz
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


module ThousandHz(
    input CLOCK,
    output reg new_clock = 0
    );
    reg [32:0] counter = 0;
    //Change max_counter value based on equation:  base clock/(target clock *2) + 1
    always @(posedge CLOCK) begin
        if (counter > 49999) begin
            counter = 0;
        end
        counter <= counter + 1;
        new_clock <= (counter == 49999) ? ~new_clock : new_clock;
    end 
endmodule