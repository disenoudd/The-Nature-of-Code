/* //<>//
 Ejemplo 2.5
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[300];
Liquido liquido;

void setup() {
  size(360, 640);
  for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(2, 8), random(0, width), 0);
  }
  liquido = new Liquido (0, height/2, width, height/2, 0.4);
  
  
}

void draw() {
  background(255);
  liquido.mostrar();
  
  PVector viento = new PVector(0.02, 0.01);

  for (int i=0; i< movedores.length; i++) {

    if (movedores[i].estaSobre(liquido)) {
      movedores[i].arrastrarPor(liquido);
    } 
    
    float m = movedores[i].masa * 0.1;
    // Estamos escalando la gravedad según la masa del objeto
    PVector gravedad = new PVector(0,m);
    movedores[i].aplicarFuerza(gravedad);
    
    float c =  0.030;
    movedores[i].aplicarFuerza(movedores[i].friccion(c));
    
    movedores[i].actualizar();
    movedores[i].mostrar();
    movedores[i].revisarBordes();
  }
  
  
}

void keyPressed(){
for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(2, 8), random(0, width), 0);
  }
  liquido = new Liquido (0, height/2, width, height/2, 0.4);
  
}