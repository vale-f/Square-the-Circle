float circleWidth = 138;
float circleHeight = 155;
float shrinkRate = 0.22;
float minHeight = 149;

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);

  if (millis() >= 5000 && circleHeight > minHeight) {
    circleHeight -= shrinkRate;
  }

  circle(width / 2, height / 2, circleWidth, circleHeight);
  
  //saveFrame("frames_5_circleFinal/frame-####.png");
  
  if (frameCount > 840) {
    noLoop();
  }
}

void circle(float x, float y, float w, float h) {
  noStroke();
  fill(255);
  ellipse(x, y, w, h);
}
