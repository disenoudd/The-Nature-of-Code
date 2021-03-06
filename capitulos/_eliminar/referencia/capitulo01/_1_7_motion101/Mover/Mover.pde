class Caminante {
  {!2} El objeto tiene dos PVectores: posicion y velocidad.
  PVector posicion;
  PVector velocidad;

  Caminante() {
    posicion = new PVector(random(width), random(height));
    velocidad = new PVector(random(-2, 2), random(-2, 2));
  }

  void actualizar() {
    //{!1} El caminante se mueve por la velocidad
    posicion.add(velocidad);
  }

  void mostrar() {
    stroke(0);
    fill(175);
    //{!1} Ahora mostramos el caminante.
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

//{!1} Declarar objeto caminante
Caminante caminante;

void setup() {
  size(640, 360);
  //{!1} Crear objeto caminante
  caminante = new Caminante();
}
void draw() {
  background(255);
  
  //{!3} Llamar las funciones del objeto caminante
  caminante.actualizar();
  caminante.revisaBordes();
  caminante.mostrar();
}