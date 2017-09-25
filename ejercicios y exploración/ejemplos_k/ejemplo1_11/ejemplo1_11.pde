/* //<>//
 Ejemplo 1.11: Arreglo de movedores acelerando hacia el mouse
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */
 
// Un arreglo de objetos
Movedor[] movedores = new Movedor[20];

void setup() {
  size(640, 360);
  background(255);
  for (int i = 0; i < movedores.length; i++) {
    // Inicializa cada objeto dentro del array.
    movedores[i] = new Movedor();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movedores.length; i++) {
    // Llama las funciones dentro de cada objeto en el array
    movedores[i].actualizar();
    movedores[i].revisarBordes();
    movedores[i].mostrar();
  }
}