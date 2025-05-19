'timescale 1ns / 1ps

module ring_oscillator(
    output osc_out
);

// Se declara la cadena de inversores con el atributo "keep" para evitar optimizaciones.
(* keep = "true" *) wire stage0, stage1, stage2, stage3, stage4;

assign stage0 = ~stage4;
assign stage1 = ~stage0;
assign stage2 = ~stage1;
assign stage3 = ~stage2;
assign stage4 = ~stage3;

// Pulso inicial para la simulación: se fuerza un estado definido en stage4
'ifndef SYNTHESIS
initial begin
    force stage4 = 1'b0;
    #10;
    release stage4;
end
'endif

// La salida del oscilador se toma de stage4
assign osc_out = stage4;

endmodule
