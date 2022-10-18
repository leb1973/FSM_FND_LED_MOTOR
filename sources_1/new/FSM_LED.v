`timescale 1ns / 1ps



module FSM_LED(
    input i_clk,
    input i_reset,
    input [4:0] i_button,
    output [2:0] o_lightState

    );

    parameter
        S_LS_0 = 3'b000,
        S_LS_1 = 3'b001,
        S_LS_2 = 3'b010,
        S_LS_3 = 3'b011,
        S_LS_4 = 3'b100;

    reg [2:0] curState, nextState;
    reg [2:0] r_lightState ; 
    assign o_lightState = r_lightState;

    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) curState <= S_LS_0;
        else        curState <= nextState;

    end

    always @(curState or i_button) begin
        case(curState)
            S_LS_0 : begin 
                if      (i_button[0]) nextState <= S_LS_0;
                else if (i_button[1]) nextState <= S_LS_1;
                else if (i_button[2]) nextState <= S_LS_2;
                else if (i_button[3]) nextState <= S_LS_3;
                else if (i_button[4]) nextState <= S_LS_4;
                else nextState <= S_LS_0;
            end
            S_LS_1 : begin
                if      (i_button[0]) nextState <= S_LS_0;
                else if (i_button[1]) nextState <= S_LS_1;
                else if (i_button[2]) nextState <= S_LS_2;
                else if (i_button[3]) nextState <= S_LS_3;
                else if (i_button[4]) nextState <= S_LS_4;
                else nextState <= S_LS_1;
            end
            S_LS_2 : begin
                if      (i_button[0]) nextState <= S_LS_0;
                else if (i_button[1]) nextState <= S_LS_1;
                else if (i_button[2]) nextState <= S_LS_2;
                else if (i_button[3]) nextState <= S_LS_3;
                else if (i_button[4]) nextState <= S_LS_4;
                else nextState <= S_LS_2;
            end
            S_LS_3 : begin
                if      (i_button[0]) nextState <= S_LS_0;
                else if (i_button[1]) nextState <= S_LS_1;
                else if (i_button[2]) nextState <= S_LS_2;
                else if (i_button[3]) nextState <= S_LS_3;
                else if (i_button[4]) nextState <= S_LS_4;
                else nextState <= S_LS_3;
            end
            S_LS_4 : begin
                if      (i_button[0]) nextState <= S_LS_0;
                else if (i_button[1]) nextState <= S_LS_1;
                else if (i_button[2]) nextState <= S_LS_2;
                else if (i_button[3]) nextState <= S_LS_3;
                else if (i_button[4]) nextState <= S_LS_4;
                else nextState <= S_LS_4;
            end

            default : nextState <= S_LS_0;
        endcase
    end

    always @(curState) begin
        
        case (curState)
            S_LS_0 : r_lightState <= 3'b000;
            S_LS_1 : r_lightState <= 3'b001;
            S_LS_2 : r_lightState <= 3'b010;
            S_LS_3 : r_lightState <= 3'b011;
            S_LS_4 : r_lightState <= 3'b100;
            default  : r_lightState <= 3'b000;
        endcase
    end
endmodule


