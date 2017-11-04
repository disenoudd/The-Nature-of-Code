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

Caminante[] caminantes = new Caminante[10];
PImage lija, aceite;

void setup() {
  size(600, 200);
  colorMode(HSB, 360);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.01, 5), random(-5, 50), 0);
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

  for (int i=0; i< caminantes.length; i++) {

    PVector viento = new PVector(0.018, 0);
    float m = caminantes[i].masa;
    PVector gravedad = new PVector(0, 0.2*m);
    float c = 0; // coeficiente de fricción

    // Bolsillos de friccion
    if (caminantes[i].posicion.x > 200 && caminantes[i].posicion.x < 300) {
      c = -1;
    } else if (caminantes[i].posicion.x > 400 && caminantes[i].posicion.x < 500) {
      c = 0.6; 
      caminantes[i].aplicaFriccion(0.6);
    } else {
      c = 0;
    }
    //caminantes[i].aplicaFriccion(c);

    // pasamos c al objeto. Objeto calcula friccion y la devuelve
    // pasamos esa friccion a aplicarFuerza
    caminantes[i].aplicarFuerza(caminantes[i].friccion(c));
    caminantes[i].aplicarFuerza(viento);
    caminantes[i].aplicarFuerza(gravedad);

    caminantes[i].actualizar();
    caminantes[i].mostrar();
    caminantes[i].revisarBordes();
  }
}