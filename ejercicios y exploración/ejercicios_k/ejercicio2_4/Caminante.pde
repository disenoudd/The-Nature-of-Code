class Caminante {

  PVector posicion;
  PVector velocidad;
  PVector aceleracion;
  float masa;
  color c2;

  Caminante(float m, float x, float y) {
    masa = m;
    posicion = new PVector(x, y);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, 0);
    c2 = color(random(0,360), 300,300);
  }

  PVector friccion(float c_){
    /* 
    La Fricción es una fuerza disipativa. 
    A dissipative force is one in which the total energy of 
    a system decreases when an object is in motion.
    f =  (velocidad_Unitaria * -1) * c * N
    */
    float c = c_; // Coeficiente de fricción
    float normal = 0.3; // Fuerza Normal, perpendicular al plano de movimiento
    float cuantaFriccion = c * normal;
    
    PVector friccion = velocidad.get();  // velocidad
    friccion.normalize();                // unitaria
    friccion.mult(-1);                   // invertida
    
    friccion.mult(cuantaFriccion);
    
    return friccion;
  }
  
  void aplicaFriccion(float c_){
    /* 
    La Fricción es una fuerza disipativa. 
    A dissipative force is one in which the total energy of 
    a system decreases when an object is in motion.
    f =  (velocidad_Unitaria * -1) * c * N
    */
    float c = c_; // Coeficiente de fricción
    float normal = 0.3; // Fuerza Normal, perpendicular al plano de movimiento
    float cuantaFriccion = c * normal;
    
    PVector friccion = velocidad.get();  // velocidad
    friccion.normalize();                // unitaria
    friccion.mult(-1);                   // invertida
    
    friccion.mult(cuantaFriccion);
    
    aplicarFuerza(friccion);
  }
  
  void aplicarFuerza(PVector fuerza) {
    //PVector f = fuerza.get();
    //f.div(masa);
    PVector f = PVector.div(fuerza, masa);
    aceleracion.add(f);
  }

  void actualizar() {
    velocidad.add(aceleracion);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }

  void mostrar() {
    noStroke();
    //stroke(0);
    //color c = color(velocidad.x*100, velocidad.y*10, aceleracion.y*10);
    float h = map (posicion.x, 0, width, 0, 360);
    float s = map (velocidad.mag(), 0, 10, 0, 360);
    //println(s);
    color c = color(h, s, 300);
    fill(c2,220);
    ellipse(posicion.x, posicion.y-(masa*8), masa*16, masa*16);
  }

  void revisarBordes() {
    if (posicion.x > width) {
      posicion.x = width;
      velocidad.x *= -0.9;
    } else if (posicion.x < 0) {
      velocidad.x *= -0.9;
      posicion.x = 0;
    }

    if (posicion.y > height) {
      velocidad.y *= -0.9;
      posicion.y = height;
    } 
  }
}