/*
 Ejemplo 1.4: Multiplicando un vector
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
  //{!1} ¡Multiplicando un vector! El vector ahora es la mitad de su tamaño original (multiplicado por 0.5).
  mouse.mult(0.5);
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}