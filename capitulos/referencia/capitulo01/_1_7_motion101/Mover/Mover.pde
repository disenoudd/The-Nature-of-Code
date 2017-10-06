class Movedor {
  {!2} El objeto tiene dos PVectores: posicion y velocidad.
  PVector posicion;
  PVector velocidad;

  Movedor() {
    posicion = new PVector(random(width), random(height));
    velocidad = new PVector(random(-2, 2), random(-2, 2));
  }

  void actualizar() {
    //{!1} El Movedor se mueve por la velocidad
    posicion.add(velocidad);
  }

  void mostrar() {
    stroke(0);
    fill(175);
    //{!1} Ahora mostramos el Movedor.
    ellipse(posicion.x, posicion.y, 16, 16);
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
}

//{!1} Declarar objeto Movedor
Movedor movedor;

void setup() {
  size(640, 360);
  //{!1} Crear objeto Movedor
  movedor = new Movedor();
}
void draw() {
  background(255);
  
  //{!3} Llamar las funciones del objeto Movedor
  movedor.actualizar();
  movedor.revisaBordes();
  movedor.mostrar();
}