/*
 Ejercicio 3.1
 Rotar un objeto como un bastón, alrededor de su centro, utilizando translate() y rotate().
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */
float angulo = 0;
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  fill(170);
  
  translate(width/2, height/2);
  rotate(radians(angulo));
  line(-100,0,100,0);
  
  ellipse(-100,0,10,10);
  ellipse(100,0,10,10);
  
  angulo++;

  
}