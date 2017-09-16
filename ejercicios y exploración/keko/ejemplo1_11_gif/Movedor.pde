class Movedor {

  Animacion mariposa;
  
  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float veloMax;

  Movedor() {
    posicion = new PVector(random(0, width), random(0, height));
    velocidad = new PVector(0, 0);
    veloMax = 10;   
    mariposa = new Animacion("mariposa_", 6);
  }

  PVector actualizar() {

    // Nuestro algoritmo para calcular la aceleración:
    // Encuentra el vector apuntando hacia el mouse.
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, posicion);

    // Normaliza
    dir.normalize();
    // Escala
    dir.mult(0.75);
    // Define aceleración
    aceleracion = dir;

    // Movimiento 101!
    // La velocidad cambia por la aceleración. 
    // La Posición cambia por la velocidad.

    velocidad.add(aceleracion);
    velocidad.limit(veloMax);
    posicion.add(velocidad);
    
    return dir;
  }

  void mostrar() {
    stroke(0);
    fill(175);
    mariposa.mostrar(posicion.x, posicion.y, actualizar().x,actualizar().y);
    //ellipse(posicion.x, posicion.y, 16, 16);
  }
  
  // Qué hacer en los bordes
  void revisarBordes() {
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