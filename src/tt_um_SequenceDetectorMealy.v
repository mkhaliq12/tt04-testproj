`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module tt_um_SequenceDetectorMealy(
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
    );

    reg yout;
    wire ain;
    reg [1:0] count;
    
    
    assign uo_out[0] = yout;
    assign ain = ui_in[0];
    
    always@(posedge clk) begin
        if (rst_n) begin count = 0; yout <= 1; end
        if(ain) begin
            count = count +1;
            if (count == 3)
                count = 0;
            if (!count) yout = 1;
            else yout = 0;
        end

    end
    
endmodule
