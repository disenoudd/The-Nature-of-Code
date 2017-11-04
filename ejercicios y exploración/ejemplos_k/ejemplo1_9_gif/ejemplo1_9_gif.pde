/*
 Ejemplo 1.9: Movimiento 101 (velocidad y aceleración aleatoria)
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
Caminante caminante2;

void setup() {
  size(640, 360);
  // Crear objeto caminante
  caminante = new Caminante();
  caminante2 = new Caminante();
  frameRate(12);
}
void draw() {
  background(255);

  // Llamar las funciones del objeto caminante
  caminante.actualizar();
  caminante.revisarBordes();
  caminante.mostrar();
  
  caminante2.actualizar();
  caminante2.revisarBordes();
  caminante2.mostrar();
}