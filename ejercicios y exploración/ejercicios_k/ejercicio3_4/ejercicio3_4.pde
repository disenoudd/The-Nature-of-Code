/* //<>//
 Ejercicio 3.4: 
 
 Usando el Ejemplo 3.4 como base, dibuja un trazo espiral. 
 Comienza en el centro, moviéndote hacia afuera. 
 Esto puedes lograrlo sólo con cambiar una línea existente, y 
 agregar una nueva línea de código.
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
 */

float r = 1;
float theta = 0;
float px, py;
float t = 1;
float m=0;
int state = 0;

PFont gothamLight, nueva;

void setup() {
  size(400, 400);
  background(50);
  smooth();
  px = width/2;
  py = height/2;
  strokeWeight(2);
  gothamLight = createFont("Roboto-ThinItalic.ttf", 34);
  nueva = loadFont("NowAlt-Regular-40.vlw");
}

void draw() {
  if (state==0) {
    intro();
  } else if (state ==1) {
    background(50);
    saveFrame();
  } else {
    flor();
  }
}

void keyPressed() {
  noLoop();
}

void mousePressed() {
  state++;
}

void intro(){
  background(50);
  fill(220);
  textFont(nueva);
  textAlign(CENTER);
  text("Math\nis\nBeautiful", 50, 100, width-100, height-100);
  saveFrame();
}
void flor() {
  fill(255, 1);
  noStroke();
  //rect(0,0, width, height);
  //{!2} Coordenadas polares (r,theta) convertidas a cartesianas (x,y) para usarlas en ellipse()
  float x = r * cos(theta);
  float y = r * sin(theta);
  px = x + width/2;
  py = y + height/2;

  if (t < 860) {
    stroke(150, 10, 225);
    r += 0.2;
    theta += 0.4;
  } else if (t < 1600) {
    stroke(200, 155, 255);
    r -= 0.4;
    theta += 0.3;
  } else {
    stroke(205, 90, 0, 100);
    r += 0.2;
    theta += 0.5;
  }


  

  point(x + width/2, y + height/2);
  //line (x + width/2, y + height/2, px, py);

  t++;
  m = t%3;
  if (m == 2) {
    println("t:\t" + t + "m:\t" + m);
    saveFrame();
  } else {
    println("--");
  }
}