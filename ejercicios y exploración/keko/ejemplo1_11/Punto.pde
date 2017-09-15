class Punto {
  PVector posicion;

  Punto(float _x, float _y) {
    posicion.x = _x;
    posicion.y = _y;
  }

  void actualizar() {
  }
  
  void revisarBorde() {
  }
  
  void mostrar() {
    strokeWeight(2);
    stroke(#FF6600);
    point(posicion.x, posicion.y);
  }
}