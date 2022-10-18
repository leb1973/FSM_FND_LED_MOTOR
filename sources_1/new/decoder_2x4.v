`timescale 1ns / 1ps



module decoder_2x4(
    input [2:0] i_digitSelect,
    output [3:0] o_digit
    );
    reg [3:0] r_digit;  
    assign o_digit = r_digit;

    always @(i_digitSelect) begin  // ?????? ????????? ��� �ٶ󺸰� ??????
    
        case (i_digitSelect)
            3'h0 : r_digit = 4'b0000;
            3'h1 : r_digit = 4'b0001;
            3'h2 : r_digit = 4'b0011;
            3'h3 : r_digit = 4'b0111;
            3'h4 : r_digit = 4'b1111;
            default : r_digit = 4'b0000;
            
        endcase    // case?? ??????????? endcase ??????
    end
    
endmodule
