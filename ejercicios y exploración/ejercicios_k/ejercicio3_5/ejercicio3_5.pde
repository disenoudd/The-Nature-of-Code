/*  //<>//
 Ejercicio 3.5: 
 
 Simulación sencilla de Asteroids
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
 */

Caminante asteroid;

void setup() {
  size(400, 400);
  background(50);
  asteroid = new Caminante(1, width/2, height/2);
}

void draw() {
  background(255);
  asteroid.display();
  
  asteroid.update();
}

void keyPressed() {
  if (key==CODED && keyCode == LEFT) {
    asteroid.aVelocity-=0.1;
  }
  if (key==CODED && keyCode == RIGHT) {
    asteroid.aVelocity+=0.1;
    
  }
  if (key==CODED && keyCode == UP) {
    asteroid.acceleration.y -= 0.1;
  }
  if (key==CODED && keyCode == DOWN) {
    asteroid.acceleration.y += 0.1;
    
  }
}