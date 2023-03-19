`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2023 14:51:15
// Design Name: 
// Module Name: sim
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


module sim(

    );
    reg CLOCK; 
    wire clk1;
     
    twentyKHz tw (CLOCK,clk1);  
     
    initial begin  
        CLOCK = 0;  
    end  
     
    always begin  
        #5 CLOCK = ~CLOCK;  
    end 
endmodule
