class Caminante {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  PVector direccion;
  float veloMax;

  float xoff, yoff;

  float r = 16;
  float angulo;

  Caminante() {
    posicion = new PVector(width/2, height/2);
    direccion = new PVector(0,0);
    velocidad = new PVector(0, 0);
    veloMax = 4;
    xoff = 0;
    yoff = 0;
  }

  void update(float _dirX, float _dirY) {
    direccion.add(_dirX, _dirY);
    PVector dir = PVector.sub(direccion, posicion);
    dir.normalize();
    dir.mult(0.5);
    aceleracion = dir;

    velocidad.add(aceleracion);
    velocidad.limit(veloMax);
    posicion.add(velocidad);
    
    aceleracion.mult(0);
  }

  void display() {
    float theta = velocidad.heading2D();

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(posicion.x, posicion.y);
    rotate(theta);
    rect(0, 0, 30, 10);
    popMatrix();
    angulo = theta;
  }

  void checkEdges() {
    
    if (posicion.x > width) {
      posicion.x = 0;
    } 
    else if (posicion.x < 0) {
      posicion.x = width;
    }

    if (posicion.y > height) {
      posicion.y = 0;
    } 
    else if (posicion.y < 0) {
      posicion.y = height;
    }
  }
}