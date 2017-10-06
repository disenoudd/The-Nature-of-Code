/*
Ejercicio de Vectores 1.7
Sergio Majluf


El PVector v vale (1,5)
El PVector u vale v multiplicado por 2
El PVector w vale v menos u
Divide el PVector w por 3
*/

PVector v;

v = new PVector(1,5);
PVector u = PVector.mult(v, 2);
PVector w = PVector.sub(v,u);
w.div(3);
