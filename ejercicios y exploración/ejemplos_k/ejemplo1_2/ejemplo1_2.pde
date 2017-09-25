/*
Ejemplo 1.2: ¡Pelota saltarina con PVectors!
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

/* En vez de muchos floats, ahora tenemos solo 
dos variables PVector.*/
PVector posicion;
PVector velocidad;

void setup() {
  size(640, 360);
  posicion = new PVector(100, 100);
  velocidad = new PVector(2.5, 5);
}

void draw() {
  background(255);
  posicion.add(velocidad);

  /* A veces, aún necesitaremos referirnos a los componentes 
   individuales de un PVector. Para hacerlo se debe nombrar 
   el objeto, seguido por un punto, y finalmente nombrar el 
   componente al cual se quiere acceder; conocido como 
   notación de punto: posicion.x, velocidad.y, etc. */

  if ((posicion.x > width) || (posicion.x < 0)) {
    velocidad.x = velocidad.x * -1;
  }
  if ((posicion.y > height) || (posicion.y < 0)) {
    velocidad.y = velocidad.y * -1;
  }

  stroke(0);
  fill(175);
  ellipse(posicion.x, posicion.y, 16, 16);
}