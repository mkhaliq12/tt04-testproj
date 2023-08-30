`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module tt_um_SequenceDetectorMealy(
    input clk,
    input reset, 
    input ain,
    output reg yout,
    output reg[1:0] count
    );
    
    //reg[3:0] count;
    
    always@(posedge clk) begin
        if (reset) begin count = 0; yout <= 1; end
        if(ain) begin
            count = count +1;
            if (count == 3)
                count = 0;
            if (!count) yout = 1;
            else yout = 0;
        end

    end
    
endmodule
