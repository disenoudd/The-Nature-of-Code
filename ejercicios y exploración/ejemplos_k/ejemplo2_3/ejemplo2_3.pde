/* //<>//
 Ejemplo 2.3
 La gravedad es calculada en base a la masa del objeto
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[100];

void setup() {
  size(640, 260);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.1, 5), random(-5, 50), 0);
  }
  background(255);
}

void draw() {
  background(255);

  for (int i=0; i< caminantes.length; i++) {
    
    PVector viento = new PVector(0.001, 0);
    float m = caminantes[i].masa;
    PVector gravedad = new PVector(0, 0.1*m);
    caminantes[i].aplicarFuerza(viento);
    caminantes[i].aplicarFuerza(gravedad);

    caminantes[i].actualizar();
    caminantes[i].mostrar();
    caminantes[i].revisarBordes();
    
  }
}