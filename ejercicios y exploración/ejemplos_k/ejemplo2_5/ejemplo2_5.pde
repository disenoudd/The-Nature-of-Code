/* //<>//
 Ejemplo 2.5
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[300];
Liquido liquido;

void setup() {
  size(360, 640);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(2, 8), random(0, width), 0);
  }
  liquido = new Liquido (0, height/2, width, height/2, 0.4);
  
  
}

void draw() {
  background(255);
  liquido.mostrar();
  
  PVector viento = new PVector(0.02, 0.01);

  for (int i=0; i< caminantes.length; i++) {

    if (caminantes[i].estaSobre(liquido)) {
      caminantes[i].arrastrarPor(liquido);
    } 
    
    float m = caminantes[i].masa * 0.1;
    // Estamos escalando la gravedad según la masa del objeto
    PVector gravedad = new PVector(0,m);
    caminantes[i].aplicarFuerza(gravedad);
    
    float c =  0.030;
    caminantes[i].aplicarFuerza(caminantes[i].friccion(c));
    
    caminantes[i].actualizar();
    caminantes[i].mostrar();
    caminantes[i].revisarBordes();
  }
  
  
}

void keyPressed(){
for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(2, 8), random(0, width), 0);
  }
  liquido = new Liquido (0, height/2, width, height/2, 0.4);
  
}