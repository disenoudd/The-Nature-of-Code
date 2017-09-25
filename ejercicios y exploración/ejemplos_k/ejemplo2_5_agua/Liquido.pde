class Liquido {
  float x, y, w, h;
  float c; // coef. friccion
  boolean r;

  Liquido(float x_, float y_, float w_, float h_, float c_, boolean r_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    r = r_;
  }

  void mostrar() {
    noStroke();
    //fill(175);
    if (r) {
      fill(175,10);
    }
    rect(x, y, w, h);
  }
}