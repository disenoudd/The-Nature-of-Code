/* //<>//
 Ejercicio 2.3
 Instead of objects bouncing off the edge of the wall, 
 create an example in which an invisible force pushes back 
 on the objects to keep them in the window. Can you weight 
 the force according to how far the object is from an 
 edge—i.e., the closer it is, the stronger the force?
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

Caminante[] caminantes = new Caminante[4000];
PImage cerveza;
int limitX = 40+60;
int limitX2 = 370+20;
int limitY = 21-60;
int limitY2 = 480-60;
boolean toggle = false;
String mensaje;

void setup() {
  size(600, 600);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante(random(0.1, 0.2), random(limitX,limitX2),
    random(limitY, limitY2));
  }
  
  cerveza = loadImage("mug-cerveza.png");
  textSize(16);
}

void mouseMoved(){
println(mouseY);
}
void keyPressed(){
toggle = !toggle;
}
void draw() {
  background(0);
  

  PVector viento = new PVector(0.06, 0);
  PVector gravedad = new PVector(0, 0.5);


  for (int i=0; i< caminantes.length; i++) {
    caminantes[i].actualizar();
    caminantes[i].revisarBordes();

    caminantes[i].aplicarFuerza(viento);
    caminantes[i].aplicarFuerza(gravedad);

    caminantes[i].mostrar();
  }
  
  if (toggle) {
    image(cerveza, 70,70, width-70, height);
    mensaje = "Animación de partículas... sin sed";
  } else {
    mensaje = "Animación de partículas... con sed";
  }
  fill(0, 120);
  rect(80, height-120, width, 50);
  fill(255);
  text(mensaje, 130, height-90);
  //saveFrame("ejercicio2_3-######.png");
}