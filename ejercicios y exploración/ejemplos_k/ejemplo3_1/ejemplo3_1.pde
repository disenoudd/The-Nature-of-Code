/*
 Ejemplo 3.1
 Rotar un objeto como un bastón, alrededor de su centro, utilizando translate() y rotate().
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

// Posición
  float angulo = 0;

  // Velocidad
  float  velAngular = 0;

  // Aceleración
  float acelAngular = 0.001;

  void setup() {
    size(640, 360);
  }

  void draw() {
    background(255);

    fill(175);
    stroke(0);
    rectMode(CENTER);
    translate(width/2, height/2);
    rotate(angulo);
    line(-50, 0, 50, 0);
    ellipse(50, 0, 8, 8);
    ellipse(-50, 0, 8, 8);

    // Equivalente angular de velocidad.add(aceleracion);
    velAngular += acelAngular;
    // Equivalente angular de posicion.add(velocidad);
    angulo+= velAngular;
  }