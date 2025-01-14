float circleX = 960;
float circleY = 806;
float circleSize = 400;
float speed = 3;
float minSize = 300;

void setup() {
  size(1920, 1080);
}


void draw() {
  background(0);
  
  drawFrame(width/2, 198, 700, 870);
  
  if (circleSize > minSize) {
    circleSize -= speed;
  }
  
  
  circle(circleX, circleY, circleSize);
  
   //saveFrame("frames_3_part5/frame-####.png");
  
  if (frameCount > 400) {
    noLoop();
  }
}



void drawFrame(float x, float y, float w, float h) {
  noFill();
  stroke(255);
  strokeWeight(12);
  rect(x - w / 2, y, w, h);
}



void circle(float x, float y, float size) {
  noStroke();
  fill(255);
  ellipse(x, y, size, size);
  //println(x, y, size, size);
}
