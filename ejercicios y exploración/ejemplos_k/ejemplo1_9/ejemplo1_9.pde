/*
 Ejemplo 1.9: Movimiento 101 (velocidad y aceleración aleatoria)
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 */

// Declarar objeto Movedor
Movedor movedor;

void setup() {
  size(640, 360);
  // Crear objeto Movedor
  movedor = new Movedor();
}
void draw() {
  background(255);

  // Llamar las funciones del objeto Movedor
  movedor.actualizar();
  movedor.revisarBordes();
  movedor.mostrar();
}

class Movedor {
  // El objeto tiene dos PVectores: posicion y velocidad.
  PVector posicion;
  PVector velocidad;

  // La aceleración es clave!
  PVector aceleracion;

  //La variable veloMax limitará la magnitud de velocidad.
  float veloMax;

  Movedor() {
    posicion = new PVector(width/2, height/2);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(-0.001, 0.01);
    veloMax = 10;
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
    // Ahora mostramos el Movedor.
    ellipse(posicion.x, posicion.y, 16, 16);
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