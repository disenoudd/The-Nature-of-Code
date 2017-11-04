/* //<>//
 Ejemplo 2.1
 Aplicando dos fuerzas a un objeto
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[100];

void setup() {
  size(640, 360);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.1, 5), random(-5,50), 0);
  }
  background(255);
}

void draw() {
  background(255);

  PVector viento = new PVector(0.01, 0);
  PVector gravedad = new PVector(0, 0.1);


  for (int i=0; i< caminantes.length; i++) {
    caminantes[i].actualizar();
    caminantes[i].revisarBordes();

    caminantes[i].aplicarFuerza(viento);
    caminantes[i].aplicarFuerza(gravedad);

    caminantes[i].mostrar();
  }
}