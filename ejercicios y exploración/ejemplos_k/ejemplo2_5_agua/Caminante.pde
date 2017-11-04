class Caminante {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;


  Caminante(float m, float x, float y) {
    masa = m;
    posicion = new PVector(x, y);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, 0);
  }

  boolean estaSobre(Liquido l) {
  //[offset-down] This conditional statement determines if the PVector location is inside the rectangle defined by the Liquid class.
  if (posicion.x>l.x && posicion.x<l.x+l.w && posicion.y>l.y && posicion.y<l.y+l.h)
  {
    return true;
  } else {
    return false;
  }
}

   void arrastrar(Liquido l) {

    float speed = velocidad.mag();
    // The force’s magnitude: Cd * v~2~
    float dragMagnitude = l.c * speed * speed;

    PVector drag = velocidad.get();
    drag.mult(-1);
    // The force's direction: -1 * velocity
    drag.normalize();

    // Finalize the force: magnitude and direction together.
    drag.mult(dragMagnitude);

    // Apply the force.
    aplicarFuerza(drag);
  }

  void aplicarFuerza(PVector fuerza) {
    //PVector f = fuerza.get();
    //f.div(masa);
    PVector f = PVector.div(fuerza, masa);
    aceleracion.add(f);
  }

  void actualizar() {
    velocidad.add(aceleracion);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }

  void mostrar() {
    //stroke(0);
    fill(250, 100);
    ellipse(posicion.x, posicion.y, 2, 2);
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
      velocidad.y *= random(-10, -80);
      //posicion.y = height;
    }
  }
}