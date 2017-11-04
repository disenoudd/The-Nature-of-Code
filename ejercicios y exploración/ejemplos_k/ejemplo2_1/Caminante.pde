class Caminante {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;

  Caminante() {
    posicion = new PVector(random(width), random(height));
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, 0);
    masa = 10;
  }

  void aplicarFuerza(PVector fuerza) {
    PVector f = fuerza.get();
    f.div(masa);
    aceleracion.add(f);
  }

  void actualizar() {
    velocidad.add(aceleracion);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }

  void mostrar() {
    stroke(0);
    fill(120);
    ellipse(posicion.x, posicion.y, 32, 32);

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
    } else if (posicion.y < 0) {
      velocidad.y *= -1;
      posicion.y = 0;
    }
  }
}