float squareSize = 200;
float speed = 5;

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);

  squareSize += speed;
  // Keep the square at the center of the screen
  float x = width / 2 - squareSize / 2;
  float y = height / 2 - squareSize / 2;

  // Draw the square
  square(x, y, squareSize);
  
  //saveFrame("frames_7_square/frame-####.png");
  
  if (frameCount > 300) {
    noLoop();
  }
}

void square(float x, float y, float size) {
  noStroke();
  fill(255);
  rect(x, y, size, size);
}
