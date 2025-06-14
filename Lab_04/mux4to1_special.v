module mux4to1_special (
    input wire clk,          // Reloj del sistema (por ejemplo, 50 MHz)
    input wire [1:0] sel,    // Selector de canal
    output reg out           // Salida del multiplexor
);

    parameter CLK_FREQ = 50000000; // Frecuencia del reloj en Hz

    // Señales internas para los pulsos
    reg pulse_1hz = 0;
    reg pulse_10hz = 0;

    reg [25:0] counter_1hz = 0;
    reg [23:0] counter_10hz = 0;

    // Generador de pulso de 1Hz
    always @(posedge clk) begin
        if (counter_1hz >= (CLK_FREQ/2)-1) begin
            pulse_1hz <= ~pulse_1hz;
            counter_1hz <= 0;
        end else begin
            counter_1hz <= counter_1hz + 1;
        end
    end

    // Generador de pulso de 10Hz
    always @(posedge clk) begin
        if (counter_10hz >= (CLK_FREQ/20)-1) begin
            pulse_10hz <= ~pulse_10hz;
            counter_10hz <= 0;
        end else begin
            counter_10hz <= counter_10hz + 1;
        end
    end

    // Multiplexor 4 a 1
    always @(*) begin
        case (sel)
            2'b00: out = 1'b0;           // Canal 0: siempre 0
            2'b01: out = pulse_1hz;      // Canal 1: pulso de 1 Hz
            2'b10: out = pulse_10hz;     // Canal 2: pulso de 10 Hz
            2'b11: out = 1'b1;           // Canal 3: siempre 1
        endcase
    end

endmodule