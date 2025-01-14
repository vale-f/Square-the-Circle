float squareX = 811.1839;
float squareY = 666.8005;
float squareSizeX = 298;
float squareSizeY = 298;
float speed = 4.5;

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);
  
  drawFrame(width/2, 198, 700, 870);
  

  MovingSquareRight(squareX, squareY, squareSizeX, squareSizeY);
  
  if ( squareX >= 1018) {
     squareSizeX -= speed;
  }
  
  squareX += speed;
  if ( squareX >= 1310){
      speed = 0;
  }
  
  //saveFrame("frames_3_part3/frame-####.png");
  
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

void MovingSquareRight(float x, float y, float sizeX, float sizeY) {
  noStroke();
  fill(255);
  rect(x, y, sizeX, sizeY);
  //println(x, y, sizeX, sizeY);
}
