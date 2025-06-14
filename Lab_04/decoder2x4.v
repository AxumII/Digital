module decoder2to4 ( 
input  wire [1:0] A,     // Entradas A, B 
output wire [3:0] Y      
Y2 
Y3 
// Salidas Y0, Y1, Y2, Y3 
); 
assign Y = 4'b0001 << A; // Solo la salida correspondiente es 1 
endmodule