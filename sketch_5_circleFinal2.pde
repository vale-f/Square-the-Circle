float circleWidth = 138;
float circleHeight = 149;
float expandRate = 0.35;
float maxWidth = 150;
float maxHeight = 150;

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);

  if (millis() >= 5000 && circleWidth < maxWidth) {
    circleWidth += expandRate;
  }
  
  if (millis() >= 5000 && circleHeight < maxHeight) {
    circleHeight += expandRate;
  }
  
  // Draw the circle with the updated width
  circle(width / 2, height / 2, circleWidth, circleHeight);
  
  //saveFrame("frames_5_circleFinal2/frame-####.png");
  
  if (frameCount > 840) {
    noLoop();
  }
}

void circle(float x, float y, float w, float h) {
  noStroke();
  fill(255);
  ellipse(x, y, w, h);
}
