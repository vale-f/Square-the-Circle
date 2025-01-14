float yPos;
float speed = 15;
float deceleration = 0.12; // Rate at which speed decreases

void setup() {
  size(1920, 1080);
  yPos = 0;
}

void draw() {
  background(0);

  speed -= deceleration; // Gradually reduce the speed

  // Prevent the speed from going below 0
  if (speed < 0) {
    speed = 0;
  }

  yPos += speed;

  circle(width / 2, yPos, 150);
  
  //saveFrame("frames_10part3/frame-####.png");

  if (frameCount > 900) {
    noLoop();
  }
}

void circle(float x, float y, float size) {
  noStroke();
  fill(255);
  ellipse(x, y, size, size);
}
