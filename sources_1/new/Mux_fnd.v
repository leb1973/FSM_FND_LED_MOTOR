`timescale 1ns / 1ps



module Mux_fnd(
    input  [3:0]i_sec_1,i_sec_10,i_msec_1,i_msec_10,
    input [1:0] i_sel,
    output [3:0]o_outFND
    

    );
    reg [3:0] r_outFND;
    assign o_outFND = r_outFND;

    always @(*) begin
        case(i_sel)
            2'd0 : r_outFND <= i_msec_1;
            2'd1 : r_outFND <= i_msec_10;
            2'd2 : r_outFND <= i_sec_1;
            2'd3 : r_outFND <= i_sec_10;
            
            
            
        endcase
    end
endmodule
