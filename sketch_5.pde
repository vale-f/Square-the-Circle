float circleWidth = 150;
float circleHeight = 150;
float shrinkRate = 0.2;
float minWidth = 138;
float maxHeight = 155;

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);

  if (millis() >= 5000 && circleWidth > minWidth) {
    circleWidth -= shrinkRate;
  }
  
  if (millis() >= 5000 && circleHeight < maxHeight) {
    circleHeight += shrinkRate;
  }

  circle(width / 2, height / 2, circleWidth, circleHeight);
  
  //saveFrame("frames_5/frame-####.png");
  
  if (frameCount > 840) {
    noLoop();
  }
}

void circle(float x, float y, float w, float h) {
  noStroke();
  fill(255);
  ellipse(x, y, w, h);
}
