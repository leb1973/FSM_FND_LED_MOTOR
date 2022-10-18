`timescale 1ns / 1ps



module Mux_2x1(
    input [3:0] i_outFND,
    input [3:0] i_outBCD,
    input i_modeSW,
    output [3:0] o_out_FND_BCD
    );

    reg [3:0] r_out_FND_BCD;
    assign o_out_FND_BCD = r_out_FND_BCD;

    always @(*) begin
        case(i_modeSW)
            1'b0 : r_out_FND_BCD <= i_outFND;
            1'b1 : r_out_FND_BCD <= i_outBCD;
        endcase
    end


endmodule
