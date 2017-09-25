/*
 Ejemplo 1.3: Substracción de Vectores
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
  // Dos PVector, uno para la posición del mouse y uno para el centro de la ventana
  PVector mouse  = new PVector(mouseX, mouseY);
  PVector centro = new PVector(width/2, height/2);

  // Dibuja los dos vectores originales
  stroke(200);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, centro.x, centro.y);

  // ¡Substracción de PVector!
  mouse.sub(centro);

  // Dibuja una línea para representar el vector.
  // Observa como muevo el origen con translate() para ubicar el vector
  stroke(0);
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
 
  r = dist(0, 0, mouse.x, mouse.y);
  noFill();
  ellipse(0, 0, r*2,r*2);
  dx = sin(angulo) * r;
  dy = cos(angulo) * r;
  
  fill(255,0,0);
  ellipse (dx, dy, 10, 10);
  angulo -= 0.1;
}