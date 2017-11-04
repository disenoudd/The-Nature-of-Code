/*
 Ejemplo 3.2: Fuerzas con movimiento angular (arbitrario)
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[20];
Atractor a;

void setup() {
  size(640, 360);
  for (int i = 0; i < caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.1,2),random(width),random(height)); 
  }
  a = new Atractor();
}

void draw() {
  background(255);
  
  a.mostrar();

  for (int i = 0; i < caminantes.length; i++) {
    PVector fuerza = a.atrae(caminantes[i]);
    caminantes[i].aplicarFuerza(fuerza);
    caminantes[i].actualizar();
    caminantes[i].mostrar();
  }
}