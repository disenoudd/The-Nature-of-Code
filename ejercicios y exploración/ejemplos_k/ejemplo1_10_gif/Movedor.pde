class Caminante {
  // Creamos una instancia de animacion
  Animacion mariposa;
  
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;

  float veloMax;

  Caminante() {
    posicion = new PVector(width/2, height/2);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(-0.005, 0.005);
    veloMax = 10;   
    mariposa = new Animacion("mariposa_", 13);
  }

  PVector actualizar() {

    PVector mouse = new PVector(mouseX, mouseY);
    // Paso 1: Clcular dirección
    PVector dir = PVector.sub(mouse, posicion);

    // Paso 2: Normalizar
    dir.normalize();
    

    // Paso 3: Escalar
    dir.mult(0.15);

    // Paso 4: Acelerar
    aceleracion = dir;

    // La velocidad cambia por la aceleración y es limitada por veloMax.
    velocidad.add(aceleracion);
    velocidad.limit(veloMax);
    posicion.add(velocidad);
    
    return dir;
  }

  void mostrar() {
    stroke(0);
    fill(175);
    // Ahora mostramos el caminante
    mariposa.mostrar(posicion.x, posicion.y, actualizar().x,actualizar().y);
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