/*
 Ejemplo 1.10:Aceleración hacia el mouse
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
 MODS:
 Llevamos clase Caminante a su propio archivo
 Agregamos clase Animacion
 Mostrarmos un GIF animado en el lugar de la ellipse
 https://processing.org/examples/animatedsprite.html
 */

// Declarar objeto caminante
Caminante caminante;

void setup() {
  size(640, 360);
  caminante = new Caminante();
  frameRate(12);
}
void draw() {
  background(255);
  caminante.actualizar();
  caminante.revisarBordes();
  caminante.mostrar();
}