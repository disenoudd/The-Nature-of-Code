/*
 Ejercicio 2.4
 Bolsillos de friccion
 
 fr       = −1 *      µ   *     N     *    v
 Pvector  opuesto  coef.Fricc  Normal    Velocidad unitaria
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[10];
PImage lija, aceite;

void setup() {
  size(600, 200);
  colorMode(HSB, 360);
  for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(0.01, 5), random(-5, 50), 0);
  }

  aceite = loadImage("aceite.jpg");
  lija = loadImage("lija.jpg");
  background(0, 120, 120);
}

void draw() {
  background(255);

  // Bolsillos de friccion
  noStroke();
  fill(240);
  //rect (200, 0, 100, height);
  //rect (400, 0, 100, height);
  image(aceite, 200, 0, 100, height);
  image(lija, 400, 0, 100, height);

  for (int i=0; i< movedores.length; i++) {

    PVector viento = new PVector(0.018, 0);
    float m = movedores[i].masa;
    PVector gravedad = new PVector(0, 0.2*m);
    float c = 0; // coeficiente de fricción

    // Bolsillos de friccion
    if (movedores[i].posicion.x > 200 && movedores[i].posicion.x < 300) {
      c = -1;
    } else if (movedores[i].posicion.x > 400 && movedores[i].posicion.x < 500) {
      c = 0.6; 
      movedores[i].aplicaFriccion(0.6);
    } else {
      c = 0;
    }
    //movedores[i].aplicaFriccion(c);

    // pasamos c al objeto. Objeto calcula friccion y la devuelve
    // pasamos esa friccion a aplicarFuerza
    movedores[i].aplicarFuerza(movedores[i].friccion(c));
    movedores[i].aplicarFuerza(viento);
    movedores[i].aplicarFuerza(gravedad);

    movedores[i].actualizar();
    movedores[i].mostrar();
    movedores[i].revisarBordes();
  }
}