/*
 Ejemplo 1.5: Magnitud de un Vector
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */
float angulo,dx,dy = 0;
float r = 10;
void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);
  PVector centro = new PVector(width/2, height/2);
  mouse.sub(centro);

  // La magnitud (es decir, longitud) de un vector 
  // puede ser accedida desde la función mag(). 
  // Acá la usamos para definir el ancho de un rectángulo 
  // dibujado en la parte superior de la ventana.
  float m = mouse.mag();
  fill(0);
  rect(0, 0, m, 10);

  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}