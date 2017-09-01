Walker w;

void setup(){
	size(500, 500);
	w = new Walker();
	background(90, 30, 50);
}

void draw(){
	w.step();
	w.display();
}
