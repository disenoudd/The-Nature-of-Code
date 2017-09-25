/* //<>//
 Ejercicio 2.5
 Resistencia del Aire y Fluidos
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Movedor[] movedores = new Movedor[30];
Liquido liquido;
Liquido liquido2;
PFont sans;

void setup() {
  size(450, 640);
  for (int i=0; i< movedores.length; i++) {
    movedores[i] = new Movedor(random(0.3, 5), random(width), 50);
  }
  liquido = new Liquido (300, 0, 150, height, 0.1, false); // true = oculto

  sans = createFont("Gotham-Book.otf", 22);
  textFont(sans);
}

void draw() {
  background(255);
  fill(240);
  noStroke();
  rect(150,0,150, height);
  liquido.mostrar();
  textSize(14);
  fill(0);
  text("Sólo\ngravedad", 75, 30);
  text("Fricción", 225, 30);
  text("Resistencia\npor Líquido", 375, 30);

  // Podríamos escalar por masa para ser más precisos (dentro de for loop)
  //PVector gravedad = new PVector(0, 0.3);

  for (int i=0; i< movedores.length; i++) {

    float m = movedores[i].masa * 0.075;
    PVector gravedad = new PVector(0, m);
    movedores[i].aplicarFuerza(gravedad);



    PVector viento = new PVector(0, 0);

    if (movedores[i].posicion.x > 150 && movedores[i].posicion.x < 300) {
      movedores[i].aplicaFriccion(0.05);
    }
   
    if (movedores[i].estaSobre(liquido)) {
      movedores[i].arrastrarPor(liquido);
    } else {
      // solo aplicar viento si NO está en líquido
      //viento.add(random(-0.05, 0.05), -0.1);
      movedores[i].aplicarFuerza(viento);
    }






    movedores[i].actualizar();
    movedores[i].mostrar();
    movedores[i].revisarBordes();
    movedores[i].aplicarFuerza(viento);
  }
}