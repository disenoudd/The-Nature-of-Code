/*
 Ejercicio 3.3: 
 NO FUCNIONa BIEN AUN
 Crea una simulación de un vehículo que puedas conducir por
 la pantalla usando las flechas del teclado. Izquierda acelera 
 hacia la izquierda, derecha hacia la derecha. El auto debe 
 apuntar en la dirección en que se está moviendo.

 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
*/

Movedor m;
float x, y;

void setup() {
  size(600, 360);
  smooth();
  m = new Movedor(); 
  x=0;
  y=0;
}

void draw() {
  background(255);
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode ==LEFT) {
        x--;
      } else if (keyCode ==RIGHT) {
        x++;
        
      }
    }
  }
  m.update(x, y);
  m.checkEdges();
  m.display();
  
  text("x: " + x, 30, height-60);
  text("m.x: " + nf(int(m.posicion.x), 2), 30, height-40);
  text("m.y: " + nf(int(m.posicion.y), 2), 100, height-40);
  text("m.a: " + degrees(m.angulo), 30, height-20);
}

void keyReleased() {
  x=0;
  y=0;
}