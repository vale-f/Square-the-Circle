void setup() {
  size(400, 400);
  background(0);
  square(width / 2 - 150, height / 2 - 150, 300);

  save("square.tif");
}

void square(float x, float y, float size) {
  noStroke();
  fill(255);
  rect(x, y, size, size);
}
