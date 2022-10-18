`timescale 1ns / 1ps



module Mux_2x1_01234(
    input [3:0] i_select_1,i_select_10,

    input [1:0] i_counter_Mux,
    output [3:0] o_outBCD
    );

    reg [3:0] r_outBCD;
    assign o_outBCD = r_outBCD;

    always @(*) begin
        case(i_counter_Mux)
            2'b00 : r_outBCD <= i_select_1;
            2'b01 : r_outBCD <= i_select_10;
            default : r_outBCD <= 4'b0000;
        endcase
    end
endmodule
