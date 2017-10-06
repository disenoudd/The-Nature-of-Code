/* //<>//
 Ejemplo 2.3
 La gravedad es calculada en base a la masa del objeto
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[100];

void setup() {
  size(640, 260);
  for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(0.1, 5), random(-5, 50), 0);
  }
  background(255);
}

void draw() {
  background(255);

  for (int i=0; i< movedores.length; i++) {
    
    PVector viento = new PVector(0.001, 0);
    float m = movedores[i].masa;
    PVector gravedad = new PVector(0, 0.1*m);
    movedores[i].aplicarFuerza(viento);
    movedores[i].aplicarFuerza(gravedad);

    movedores[i].actualizar();
    movedores[i].mostrar();
    movedores[i].revisarBordes();
    
  }
}