/*
Ejemplo 1.1 Pelota saltarina sin vectores
The Nature of Code por Nathan Shiffman
http://github.com/shiffman/the-Nature-of-Code

La Naturaleza del Código
traducido por Sergio Majluf, Nicolás Troncoso
y estudiantes de Diseño UDD
http://github.com/disenoudd/the-Nature-of-Code
*/

// Variables para posición y velocidad de la pelota.
float x = 100;
float y = 100;
float velocidadX = 1;
float velocidadY = 3.3;

//{!4} ¿Recuerdas cómo funciona Processing? El setup() es ejecutado una vez cuando el sketch comienza a correr, y el draw() se ejecuta en bucle por siempre (hasta que cierres la ventana)
void setup() {
  size(640,360);
  background(255);
}

void draw() {
  background(255);

  // Mueve la pelota dependiendo de su velocidad.
  x = x + velocidadX;
  y = y + velocidadY;

  // {!6} Revisa el rebote.
  if ((x > width) || (x < 0)) {
    velocidadX = velocidadX * -1;
  }
  if ((y > height) || (y < 0)) {
    velocidadY = velocidadY * -1;
  }

  stroke(0);
  fill(175);
  // {!1} Muestra la pelota en su posición (x,y).
  ellipse(x,y,16,16);
}