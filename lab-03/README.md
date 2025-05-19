# Tercera práctica de laboratorio Verilog

## Integrantes

- Jairo David Diaz Luna
- Juan Angel Pinzon Lopez
- Erick Hosbany Calvache Pacheco

---

## Descripción

Implementación en FPGA (Verilog) de los siguientes módulos y evidencia de laboratorio:

1. **Comparador de dos bits**  
2. **Medio sumador (Half Adder)**  
3. **Sumador completo (Full Adder)**  
4. **Inversor en anillo (TTL, FPGA)**  



---

## 1. Comparador de dos bits

**Código:** [`comparador_2_bits.v`](./comparador_2_bits.v)

| Caso  | Imagen                                    |
|-------|-------------------------------------------|
| A = B | ![A = B](imagenes/comparador_AB_igual.jpg) |
| A > B | ![A > B](imagenes/comparador_A_mayor_B.jpg) |
| A < B | ![A < B](imagenes/comparador_A_menor_B.jpg) |

---

## 2. Medio sumador (Half Adder)

**Código:** [`Half_adder.v`](./Half_adder.v)

| Entradas     | Imagen                               |
|--------------|--------------------------------------|
| A=0, B=0     | ![A=0, B=0](imagenes/half_adder_00.jpg) |
| A=1/B=1      | ![A=1 o B=1](imagenes/half_adder_01.jpg) |

---

## 3. Sumador completo (Full Adder)

**Código:** [`full_adder.v`](./full_adder.v)

| A | B | Cin | Imagen                                  |
|---|---|-----|-----------------------------------------|
| 0 | 0 | 0   | ![000](imagenes/full_adder_000.jpg)     |
| 0 | 0 | 1   | ![001](imagenes/full_adder_001.jpg)     |
| 0 | 1 | 0   | ![010](imagenes/full_adder_01X.jpg)     |
| 1 | 1 | 1   | ![111](imagenes/full_adder_111.jpg)     |

---

## 4. Inversor en anillo

**Código:** [`anillo.v`](./anillo.v)

| Implementación       | Imagen                                 |
|---------------------|----------------------------------------|
| TTL (osciloscopio)  | ![TTL](imagenes/inversor_anillo_ttl.jpg) |

---
