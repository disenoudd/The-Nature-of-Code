class Movedor {
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;

  float angulo = 0;
  float velAngular = 0;
  float acelAngular = 0.01;

  Movedor(float m, float x, float y) {
    masa = m;
    posicion = new PVector(x, y);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0,0);
  }

  void aplicarFuerza(PVector fuerza) {
    PVector f = PVector.div(fuerza, masa);
    aceleracion.add(f);
  }

  void actualizar() { 
    velocidad.add(aceleracion);
    posicion.add(velocidad);

    //{!1} Calcula aceleración angular de acuerdo a la dirección horizontal y magnitud de la aceleración.
    acelAngular = aceleracion.x / 10.0;
    velAngular += acelAngular;
    //{!1} Usa constrain() para garantizar que no gire fuera de control.
    velAngular = constrain(velAngular, -0.1, 0.1);
    angulo += velAngular;

    aceleracion.mult(0);
  }

  void mostrar() {
    stroke(0);
    fill(175, 200);
    rectMode(CENTER);
    //{!1} pushMatrix() y popMatrix() son necesarios para que la rotación no afecte a todo nuestro mundo.
    pushMatrix();

    // Fija el origen, en la posición del objeto.
    translate(posicion.x, posicion.y);
    //{!1} Rota según ángulo.
    rotate(angulo);
    rect(0, 0, masa * 16, masa * 16);
    popMatrix();
  }
}