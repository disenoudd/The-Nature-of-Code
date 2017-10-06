class Liquido {
  float x, y, w, h;
  float c; // coef. friccion


  Liquido(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;

  }

  void mostrar() {
    noStroke();
    fill(105,200);
    rect(x, y, w, h);
  }
}