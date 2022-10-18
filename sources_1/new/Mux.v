`timescale 1ns / 1ps



module Mux(
    input [3:0] i_x,
    input [2:0] i_select,
    output o_y
    

    );
    reg  r_y;
    assign o_y = r_y;

    always @(*) begin
        case(i_select)
            3'd0 : r_y <= 4'b0000;
            3'd1 : r_y <= i_x[0];
            3'd2 : r_y <= i_x[1];
            3'd3 : r_y <= i_x[2];
            3'd4 : r_y <= i_x[3];
            default : r_y <= 4'b0000;
            
        endcase
    end
endmodule
