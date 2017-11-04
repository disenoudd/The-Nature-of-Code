/* //<>//
 Ejemplo 2.1
 Aplicando dos fuerzas a un objeto
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante globo;
PVector viento = new PVector(0.075, 0);
PVector gravedad = new PVector(0, 0.5);

void setup() {
  size(640, 360);
  globo = new Caminante();
  background(255);
}

void draw() {
  background(255);

  globo.actualizar();
  globo.revisarBordes();
  
  globo.aplicarFuerza(viento);
  globo.aplicarFuerza(gravedad);
  
  globo.mostrar();
  
  
}