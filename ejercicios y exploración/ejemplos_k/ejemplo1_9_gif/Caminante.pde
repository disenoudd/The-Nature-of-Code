class Caminante {
  // Creamos una instancia de animacion
  Animacion mariposa;
  
  // El objeto tiene dos PVectores: posicion y velocidad.
  PVector posicion;
  PVector velocidad;

  // La aceleración es clave!
  PVector aceleracion;

  //La variable veloMax limitará la magnitud de velocidad.
  float veloMax;

  Caminante() {
    posicion = new PVector(width/2, height/2);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(-0.001, 0.01);
    veloMax = 10;
    
    mariposa = new Animacion("mariposa_", 4);
  }

  void actualizar() {
    // La función random2D() devolverá un PVector de largo 1,
    // apuntando a una dirección aleatoria.
    aceleracion = PVector.random2D();

    velocidad.add(aceleracion);
    velocidad.limit(veloMax);
    posicion.add(velocidad);
  }

  void mostrar() {
    stroke(0);
    fill(175);
    // Ahora mostramos el caminante.
    
    mariposa.mostrar(posicion.x, posicion.y);
    //ellipse(posicion.x, posicion.y, 16, 16);
  }

  void revisarBordes() {
    // Cuando lega a un borde, configura la posición para el borde opuesto.
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
}