/* //<>//
 Ejercicio 2.1
 Utilizando fuerzas, simula on globo lleno de helio
 que flota hacia arriba y rbota en el borde de
 la ventana. ¿Puedes agregar una fuerza que cambie
 en el tiempo, quizás de utilizando ruido Perliano?
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor globo;
float t = random(1000);


void setup() {
  size(640, 360);
  globo = new Movedor();
  background(255);
}

void draw() {
  background(255);

  globo.actualizar();
  globo.revisarBordes();
  globo.mostrar();

  t += 0.01;
}

void keyPressed() {

  float rp = noise(t)/5;
  PVector viento = new PVector(-rp, 0);
  if (key == CODED && keyCode == RIGHT ) {
    viento.x *= -1;
  }
  globo.aplicarFuerza(viento);
  println(viento.x + " " + t);
}