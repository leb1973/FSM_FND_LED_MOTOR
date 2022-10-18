`timescale 1ns / 1ps


module decoder_digit(
    input [1:0] i_digitsel,
    output [3:0]o_outdigit
    );

    reg [3:0] r_outdigit;
    assign o_outdigit = r_outdigit;

    always @(i_digitsel) begin

        case (i_digitsel)
            2'h0 : r_outdigit = 4'b1110;
            2'h1 : r_outdigit = 4'b1101;
            2'h2 : r_outdigit = 4'b1011;
            2'h3 : r_outdigit = 4'b0111;
            
        endcase
    end

endmodule
