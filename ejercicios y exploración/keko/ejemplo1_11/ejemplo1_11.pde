//{!1} Un arreglo de objetos

//ArrayList<Movedor> movedores = new ArrayList<Movedor>();
//ArrayList<Punto> puntos = new ArrayList<Punto>();
Punto p0, p1, p2;
Punto[] puntos = new Punto[3];

void setup() {
  size(640, 360);

  background(255); //<>//
  p0 = new Punto(random(width), random(height));
  p1 = new Punto(random(width), random(height));
  p2 = new Punto(random(width), random(height));
  puntos[0] = p0;
  puntos[1] = p1;
  puntos[2] = p2;

  for (int i=0; i>20; i++) {
    //puntos[i] = new Punto(random(width), random(height)); //<>//
  }


  //for (int i=0; i>20; i++) {
  //  movedores.add(new Movedor());  
  //}
}

void draw() {
  background(255);
  fill(120);
  rect(10, 10, width-20, height-20);

  //for (Movedor m : movedores){
  //  m.actualizar();
  //  m.revisarBordes();
  //  m.mostrar();
  //}

  for (int i=0; i>2; i++) {
    puntos[i].actualizar(); //<>//
    puntos[i].revisarBorde();
    puntos[i].mostrar();
  }
}