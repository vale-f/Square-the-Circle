
MovingSquareRight squareRight;

void setup() {
  size(1920, 1080);
  squareRight = new MovingSquareRight(-10, 1100, 400, 10, 8.5, 620);
}



void draw() {
  background(0);
  
  drawFrame(width/2, 198, 700, 870);
  
  squareRight.update();
  squareRight.display();
  
  //saveFrame("frames_3/frame-####.png");
  
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
