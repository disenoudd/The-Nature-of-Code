class Caminante {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;

  Caminante(float m, float x, float y) {
    masa = m;
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
    stroke(0);
    fill(175, 200);
    ellipse(posicion.x, posicion.y, masa*16, masa*16);
  }

  void revisarBordes() {
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
  }
}