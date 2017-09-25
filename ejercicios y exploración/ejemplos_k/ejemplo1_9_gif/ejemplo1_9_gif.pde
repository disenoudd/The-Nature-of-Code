/*
 Ejemplo 1.9: Movimiento 101 (velocidad y aceleración aleatoria)
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
Movedor movedor2;

void setup() {
  size(640, 360);
  // Crear objeto Movedor
  movedor = new Movedor();
  movedor2 = new Movedor();
  frameRate(12);
}
void draw() {
  background(255);

  // Llamar las funciones del objeto Movedor
  movedor.actualizar();
  movedor.revisarBordes();
  movedor.mostrar();
  
  movedor2.actualizar();
  movedor2.revisarBordes();
  movedor2.mostrar();
}