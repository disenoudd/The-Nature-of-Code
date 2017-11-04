/* //<>//
 Ejercicio 2.5
 Resistencia del Aire y Fluidos con SUPERFICIE
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[1];
Liquido liquido;
Liquido liquido2;
PFont simon;
PVector brisa = new PVector(0,0);
PImage sonic;

void setup() {
  size(800, 340);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(1, 5), random(width), 50);
  }
  liquido = new Liquido (300, 0, 150, height, 0.1, false); // true = oculto

  simon = createFont("Gotham-Book.otf", 22);
  textFont(simon);
  sonic = loadImage("sonic.png");
}

void draw() {
  background(255);
  fill(240);
  noStroke();
  rect(150, 0, 150, height);
  liquido.mostrar();
  textSize(14);
  fill(0);
  text("Sólo\ngravedad", 75, 30);
  text("Fricción", 225, 30);
  text("Resistencia\npor Líquido", 375, 30);

  // Podríamos escalar por masa para ser más precisos (dentro de for loop)
  //PVector gravedad = new PVector(0, 0.3);

  for (int i=0; i< caminantes.length; i++) {

    float m = caminantes[i].masa * 0.075;
    PVector gravedad = new PVector(0, 1);
    caminantes[i].aplicarFuerza(gravedad);



    PVector viento = new PVector(0, 0);

    if (caminantes[i].posicion.x > 150 && caminantes[i].posicion.x < 300) {
      caminantes[i].aplicaFriccion(0.05);
    }

    if (caminantes[i].estaSobre(liquido)) {
      caminantes[i].arrastrarPor(liquido);
    } else {
      // solo aplicar viento si NO está en líquido
      //viento.add(random(-0.05, 0.05), -0.1);
      caminantes[i].aplicarFuerza(viento);
    }






    caminantes[i].actualizar();
    caminantes[i].mostrar();
    caminantes[i].revisarBordes();
    caminantes[i].aplicarFuerza(viento);
  }
}


void keyPressed() {
  
  if (key==CODED) {
    if (keyCode==UP) {
      brisa.add(0,-1);
    } else if (keyCode==DOWN) {
      brisa.add(0,1);
    }
   
    println(brisa.y);
    for (int i=0; i< caminantes.length; i++) {
     caminantes[i].aplicarFuerza(brisa);
    }
  }
}

void keyReleased(){
  brisa.mult(0);
}