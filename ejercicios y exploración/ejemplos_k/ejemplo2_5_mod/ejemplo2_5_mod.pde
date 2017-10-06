/* //<>//
 Ejemplo 2.5
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[1000];
Liquido liquido;
Liquido liquido2;

void setup() {
  size(360, 640);
  for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(0.1, 5), random(width), 0);
  }
  liquido = new Liquido (0, 0, width, 50, 0.2, false); // true = oculto
  liquido2 = new Liquido (0, 300, width, 50, 0.2, false); // true = oculto
}

void draw() {
  background(255);


  // Podríamos escalar por masa para ser más precisos (dentro de for loop)
  // PVector gravedad = new PVector(0, 0.1);

  for (int i=0; i< movedores.length; i++) {

    float m = movedores[i].masa * 0.075;
    PVector gravedad = new PVector(0, m);
    movedores[i].aplicarFuerza(gravedad);



    float c = 0.01;
    PVector friccion = movedores[i].velocidad.get();
    friccion.mult(-1);
    friccion.normalize();
    friccion.mult(c);
    movedores[i].aplicarFuerza(friccion);

    PVector viento = new PVector(0, 0);

    if (movedores[i].estaSobre(liquido)) {
      movedores[i].arrastrarPor(liquido);
    } else if (movedores[i].estaSobre(liquido2)) {
      movedores[i].arrastrarPor(liquido2);
    } else {
      // solo aplicar viento si NO está en líquido
      //viento.add(random(-0.05, 0.05), -0.1);
      movedores[i].aplicarFuerza(viento);
    }






    movedores[i].actualizar();
    movedores[i].mostrar();
    movedores[i].revisarBordes();
    movedores[i].aplicarFuerza(viento);
  }

  liquido.mostrar();
  liquido2.mostrar();
}