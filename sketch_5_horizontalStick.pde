void setup() {
  size(760, 250);
  background(0);
  square(width / 2 + 180, height / 2 - 85, 170);
  stick(55, height / 2 - 7.5, 505, 15);
  stick(width / 2 - 350, height / 2 - 70, 22, 140);
  
  save("horizontal.tif");
}

void square(float x, float y, float size) {
  noStroke();
  fill(255);
  rect(x, y, size, size);
}

void stick(float x, float y, float h, float w) {
   stroke(255);
   strokeWeight(4);
   rect(x, y, h, w);
}
