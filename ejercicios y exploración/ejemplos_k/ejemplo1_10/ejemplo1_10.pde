/*
 Ejemplo 1.10:Aceleración hacia el mouse
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
 */
 
Caminante caminante;

void setup() {
  size(640, 480);
  caminante = new Caminante();

}
void draw() {
  background(255);
  caminante.actualizar();
  caminante.revisaBordes();
  caminante.mostrar();
}