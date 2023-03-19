module twentyKHz(
    input CLOCK,
    output out
    );
    reg [4:0] count = 0; //6.25MHz
    reg C0 = 0;

     
    always @ (posedge CLOCK) begin  
        count <= (count == 15) ? 0 : count + 1;
        C0 <= (count == 0) ? ~C0 : C0;
    end
    assign out = C0;
 
 
endmodule