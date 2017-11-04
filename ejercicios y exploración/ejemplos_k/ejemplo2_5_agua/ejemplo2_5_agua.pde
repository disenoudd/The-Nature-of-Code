/* //<>//
 Ejemplo 2.5
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[1800];
Liquido liquido;
PImage agua;

void setup() {
  size(360, 640);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.4, 5), random(width), random(-400, -50));
  }
  liquido = new Liquido (0, 150, width, height, 0.085, true); // true = oculto
  agua = loadImage("agua.jpg");
}

void draw() {
  background(255);
  image(agua, 0, 0);
  liquido.mostrar();

  PVector viento = new PVector(0.001, 0);

  // Podríamos escalar por masa para ser más precisos (dentro de for loop)
  // PVector gravedad = new PVector(0, 0.1);
  
  for (int i=0; i< caminantes.length; i++) {

    float m = caminantes[i].masa * 0.075;
    PVector gravedad = new PVector(0,m);

    float c = 0.01;
    PVector friccion = caminantes[i].velocidad.get();
    friccion.mult(-1);
    friccion.normalize();
    friccion.mult(c);

    if (caminantes[i].estaSobre(liquido)) {
      caminantes[i].arrastrar(liquido);
    }

  caminantes[i].aplicarFuerza(friccion);
    caminantes[i].aplicarFuerza(viento);
    caminantes[i].aplicarFuerza(gravedad);
    
    caminantes[i].actualizar();
    caminantes[i].mostrar();
    caminantes[i].revisarBordes();
  }
}