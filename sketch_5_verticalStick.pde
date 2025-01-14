void setup() {
  size(300, 600);
  background(0);
  stick(width / 2, 0, 15, 550);
  stick(width / 2 - 65, height / 2 + 252, 140, 22);
  
  save("vertical.tif");
}

void stick(float x, float y, float h, float w) {
   stroke(255);
   strokeWeight(4);
   rect(x, y, h, w);
}
