class Movedor {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  
  float veloMax;

  Movedor() {
    posicion = new PVector(width/2, height/2);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(-0.001, 0.01);
    veloMax = 10;
  }

  void actualizar() {

    PVector mouse = new PVector(mouseX, mouseY);
    // Step 1: Clcular dirección
    PVector dir = PVector.sub(mouse, posicion);

    // Step 2: Normalizar
    dir.normalize();

    // Step 3: Escalar
    dir.mult(0.5);

    //{!1} Step 4: Acelerar
    aceleracion = dir;

    //{!2} La velocidad cambia por la aceleración y es limitada por veloMax.
    velocidad.add(aceleracion);
    velocidad.limit(veloMax);
    posicion.add(velocidad);
  }

  void revisaBordes() {
    //{!11} Cuando lega a un borde, configura la posición para el borde opuesto.
    if (posicion.x > width) {
      posicion.x = 0;
    } else if (posicion.x < 0) {
      posicion.x = width;
    }

    if (posicion.y > height) {
      posicion.y = 0;
    } else if (posicion.y < 0) {
      posicion.y = height;
    }
  }
  
  void mostrar() {
    stroke(0);
    fill(175);
    //{!1} Ahora mostramos el Movedor.
    ellipse(posicion.x, posicion.y, 16, 16);
  }
}