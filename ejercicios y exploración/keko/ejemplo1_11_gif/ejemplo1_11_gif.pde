/*
 Ejemplo 1.11: Arreglo de movedores acelerando hacia el mouse
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
Movedor[] movedores = new Movedor[15];

void setup() {
  size(displayWidth, displayHeight);
  for(int i=0; i< movedores.length; i++){
    movedores[i] = new Movedor();
  }
  frameRate(15);
}
void draw() {
  background(255);
  
   for (int i = 0; i < movedores.length; i++) {
    //{!3} Calling functions on all the objects in the array
    movedores[i].actualizar();
    movedores[i].revisarBordes();
    movedores[i].mostrar();
  }
}