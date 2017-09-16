/*
 Ejemplo 1.10:Aceleración hacia el mouse
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
 MODS:
 Llevamos clase Mover a su propio archivo
 Agregamos clase Animacion
 Mostrarmos un GIF animado en el lugar de la ellipse
 https://processing.org/examples/animatedsprite.html
 */

// Declarar objeto Movedor
Movedor movedor;

void setup() {
  size(640, 360);
  movedor = new Movedor();
  frameRate(12);
}
void draw() {
  background(255);
  movedor.actualizar();
  movedor.revisarBordes();
  movedor.mostrar();
}