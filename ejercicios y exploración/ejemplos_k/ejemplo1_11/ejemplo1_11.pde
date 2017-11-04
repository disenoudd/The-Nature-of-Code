/* //<>//
 Ejemplo 1.11: Arreglo de caminantes acelerando hacia el mouse
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */
 
// Un arreglo de objetos
Caminante[] caminantes = new Caminante[20];

void setup() {
  size(640, 360);
  background(255);
  for (int i = 0; i < caminantes.length; i++) {
    // Inicializa cada objeto dentro del array.
    caminantes[i] = new Caminante();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < caminantes.length; i++) {
    // Llama las funciones dentro de cada objeto en el array
    caminantes[i].actualizar();
    caminantes[i].revisarBordes();
    caminantes[i].mostrar();
  }
}