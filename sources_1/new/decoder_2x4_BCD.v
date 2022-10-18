`timescale 1ns / 1ps



module decoder_2x4_BCD(
    input [2:0]i_toBCD,
    output [3:0] o_outBCD

    );

    reg [3:0] r_outBCD;
    assign o_outBCD = r_outBCD;

    always @(i_toBCD) begin
        r_outBCD = 4'bxxxx;
        case (i_toBCD)
            3'h0 : r_outBCD = 4'd0;
            3'h1 : r_outBCD = 4'd1;
            3'h2 : r_outBCD = 4'd2;
            3'h3 : r_outBCD = 4'd3;
            3'h4 : r_outBCD = 4'd4;
            
        endcase
    end
endmodule


