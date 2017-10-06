import java.util.*;

Random generator;

void setup() {
  size(640,640);
  generator = new Random();
}
void draw() {
//Note that nextGaussian() returns a double.
  float num = (float) generator.nextGaussian();
  float num1 = (float) generator.nextGaussian();
  float sd = 60;
  float mean = 320;

//Multiply by the standard deviation and add the mean.
  float x = sd * num + mean;
  float y = sd * num1 + mean;
  noStroke();
  fill(255,40);
  ellipse(x,y,16,16);
}
