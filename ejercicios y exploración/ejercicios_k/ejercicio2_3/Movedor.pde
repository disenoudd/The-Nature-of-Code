class Movedor {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;
  float diam;

  Movedor(float m, float x, float y) {
    masa = m;
    diam = masa*16;
    posicion = new PVector(x,y);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, 0);
    
  }

  void aplicarFuerza(PVector fuerza) {
    //PVector f = fuerza.get();
    //f.div(masa);
    PVector f = PVector.div(fuerza,masa);
    aceleracion.add(f);
  }

  void actualizar() {
    velocidad.add(aceleracion);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }

  void mostrar() {
    //stroke(0);
    noStroke();
    fill(255, 70);
    ellipse(posicion.x, posicion.y, diam, diam);
  }

  void revisarBordes() {
    
    float dx = dist(posicion.x,posicion.y, limitX, posicion.y)/10;
    float dx2 = dist(posicion.x,posicion.y, limitX2, posicion.y)/10;
    float dy = dist(posicion.x,posicion.y, posicion.x, limitY)/10;
    float dy2 = dist(posicion.x,posicion.y, posicion.x, limitY2)/10;
    
    if (posicion.x > limitX2-diam) aplicarFuerza(new PVector(-dx2,0));
    if (posicion.x < limitX+ diam) aplicarFuerza(new PVector(dx,0));
    if (posicion.y > limitY2-diam) aplicarFuerza(new PVector(0,-dy2));
    if (posicion.y < limitY + diam) aplicarFuerza(new PVector(0,dy));
    
    //println(dx + " " + dx2 + " " + dy + " " + dy2); 
    
    
    /*
    if (posicion.x > width) {
      posicion.x = width;
      velocidad.x *= -1;
    } else if (posicion.x < 0) {
      velocidad.x *= -1;
      posicion.x = 0;
    }

    if (posicion.y > height) {
      velocidad.y *= -1;
      posicion.y = height;
    } 
    */
  }
}