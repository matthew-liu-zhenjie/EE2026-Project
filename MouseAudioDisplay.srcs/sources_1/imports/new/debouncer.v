`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 20:30:52
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input button, CLOCK,
    output button_output
    );
    //Use 1000Hz Clock input 
    reg first_out = 0, second_out = 0;
    assign button_output = first_out && second_out;
    always @(posedge CLOCK) begin
        first_out <= button; //1 D-FF
        second_out <= first_out; //2nd D-FF
    end

endmodule
