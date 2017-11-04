// Attraction
// Daniel Shiffman <http://www.shiffman.net>

// A class for a draggable attractive body in our world

class Atractor {
  float masa;         // Mass, tied to size
  PVector posicion;   // Location
  float g;

  Atractor() {
    posicion = new PVector(width/2, height/2);
    masa = 20;
    g = 0.4;
  }


  PVector atrae(Caminante c) {
    PVector fuerza = PVector.sub(posicion, c.posicion);             // Calculate direction of force
    float distancia = fuerza.mag();                                 // Distance between objects
    distancia = constrain(distancia, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    fuerza.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (g * masa * c.masa) / (distancia * distancia); // Calculate gravitional force magnitude
    fuerza.mult(strength);                                         // Get force vector --> magnitude * direction
    return fuerza;
  }

  // Method to display
  void mostrar() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(posicion.x, posicion.y, 48, 48);
  }
}