/*
 Ejemplo 1.6: Normalizando un vector
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

  // En este ejemplo, luego que el vector es normalizado, 
  // es multiplicado por 50 para que sea visible en la 
  // pantalla. Notemos como sin importar dónde esté el mouse, 
  // el vector tendrá la misma longitud (50) debido a su 
  // proceso de normalización.
  mouse.normalize();
  mouse.mult(50);
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}