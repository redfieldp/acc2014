float rotation = 0;

void setup() {
  size (1024, 768, P3D);
}

void draw() {
  background(0);
  noStroke();
  lights();
  translate(width/2, height/2, 300);
  pushMatrix();
  rotateY(rotation);
  pushMatrix();
  translate(-100, 0);
  sphere(25);
  popMatrix();

  pushMatrix();
  translate(100, 0);
  sphere(25);
  popMatrix();
  popMatrix();

  rotation = (rotation + (PI/100)) % (2 * PI);
}
