/* //<>//
 Ejemplo 2.4
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[10];


void setup() {
  size(640, 260);
  for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(0.1, 5), 0, 0);
  }

  background(255);
}

void draw() {
  background(255);
  
  PVector viento = new PVector(0.001, 0);
  
  // Podríamos escalar por masa para ser más precisos (dentro de for loop)
  PVector gravedad = new PVector(0, 0.1);

  for (int i=0; i< movedores.length; i++) {
    //float m = movedores[i].masa * 0.075;
    //PVector gravedad = new PVector(0,m);

    float c = 0.01;
    PVector friccion = movedores[i].velocidad.get();
    friccion.mult(-1);
    friccion.normalize();
    friccion.mult(c);
    
    movedores[i].aplicarFuerza(friccion);
    movedores[i].aplicarFuerza(viento);
    movedores[i].aplicarFuerza(gravedad);

    movedores[i].actualizar();
    movedores[i].mostrar();
    movedores[i].revisarBordes();
  }
}