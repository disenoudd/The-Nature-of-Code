Walker w;

void setup() {
  size(640,360);
//Create the Walker.
  w = new Walker();
  background(255);
}

void draw() {
//Call functions on the Walker.
  w.step();
  w.display();
}
