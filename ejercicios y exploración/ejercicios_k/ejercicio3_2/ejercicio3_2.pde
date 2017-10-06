/*
 Ejercicio 3.2: Simulación de un cañón.
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[200];
Atractor a;

void setup() {
  size(640, 260);
  for (int i = 0; i < movedores.length; i++) {
    movedores[i] = new Movedor(random(0.05,2),random(width),random(height)); 
  }
  a = new Atractor();
}

void draw() {
  background(255);
  //fill(255,20);
  //rect(width/2,height/2,width, height);
  
  a.mostrar();

  for (int i = 0; i < movedores.length; i++) {
    PVector fuerza = a.atrae(movedores[i]);
    movedores[i].aplicarFuerza(fuerza);
    movedores[i].actualizar();
    movedores[i].mostrar();
  }
}