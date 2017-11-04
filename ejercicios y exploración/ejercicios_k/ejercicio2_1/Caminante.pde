class Caminante {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;

  Caminante() {
    posicion = new PVector(width/2, height);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, -1);
  }

  void aplicarFuerza(PVector fuerza) {
    aceleracion.add(fuerza);
  }

  void actualizar() {
    velocidad.add(aceleracion);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }

  void mostrar() {
    stroke(0);
    float tx = posicion.x;
    float ty = posicion.y;
    float dx = random(-1.1, 1.1);
    float dy = random(-1.1, -1.1);
    //line(posicion.x, posicion.y, posicion.x, posicion.y+100);
    bezier(tx, ty+30, tx-10, ty+10, tx+(10+dx), ty+(20+dy), tx+10, ty+100);
    noStroke();
    fill(#FF4646);
    triangle(posicion.x, posicion.y +10, posicion.x+5, posicion.y+24, posicion.x-5, posicion.y+24);
    ellipse(posicion.x, posicion.y, 32, 38);
    fill(255, 70);
    ellipse(posicion.x+2, posicion.y-8, 12, 13);
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