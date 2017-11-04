/* //<>//
 Ejemplo 2.5
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[1000];
Liquido liquido;
Liquido liquido2;

void setup() {
  size(360, 640);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.1, 5), random(width), 0);
  }
  liquido = new Liquido (0, 0, width, 50, 0.2, false); // true = oculto
  liquido2 = new Liquido (0, 300, width, 50, 0.2, false); // true = oculto
}

void draw() {
  background(255);


  // Podríamos escalar por masa para ser más precisos (dentro de for loop)
  // PVector gravedad = new PVector(0, 0.1);

  for (int i=0; i< caminantes.length; i++) {

    float m = caminantes[i].masa * 0.075;
    PVector gravedad = new PVector(0, m);
    caminantes[i].aplicarFuerza(gravedad);



    float c = 0.01;
    PVector friccion = caminantes[i].velocidad.get();
    friccion.mult(-1);
    friccion.normalize();
    friccion.mult(c);
    caminantes[i].aplicarFuerza(friccion);

    PVector viento = new PVector(0, 0);

    if (caminantes[i].estaSobre(liquido)) {
      caminantes[i].arrastrarPor(liquido);
    } else if (caminantes[i].estaSobre(liquido2)) {
      caminantes[i].arrastrarPor(liquido2);
    } else {
      // solo aplicar viento si NO está en líquido
      //viento.add(random(-0.05, 0.05), -0.1);
      caminantes[i].aplicarFuerza(viento);
    }






    caminantes[i].actualizar();
    caminantes[i].mostrar();
    caminantes[i].revisarBordes();
    caminantes[i].aplicarFuerza(viento);
  }

  liquido.mostrar();
  liquido2.mostrar();
}