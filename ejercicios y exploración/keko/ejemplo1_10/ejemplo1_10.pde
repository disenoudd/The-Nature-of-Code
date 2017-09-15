Movedor movedor;

void setup() {
  size(640, 480);
  movedor = new Movedor();

}
void draw() {
  background(220);
  movedor.actualizar();
  movedor.revisaBordes();
  movedor.mostrar();
}