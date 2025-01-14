float centerX = 960.1839;
float centerY = 815.8005;
float squareSize = 400;
float speed = 3;
float minSize = 300;

void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);
  
  drawFrame(width/2, 198, 700, 870);
  
  // Reduce the square size
  if (squareSize > minSize) {
    squareSize -= speed; // Reduce size by speed
  }
  
  // Calculate the top-left corner based on the center
  float squareX = centerX - (squareSize / 2);
  float squareY = centerY - (squareSize / 2);
  
  MovingSquare(squareX, squareY, squareSize);
  
  //saveFrame("frames_3_part2/frame-####.png");
  
  if (frameCount > 350) {
    noLoop();
  }
}

void drawFrame(float x, float y, float w, float h) {
  noFill();
  stroke(255);
  strokeWeight(12);
  rect(x - w / 2, y, w, h);
}

void MovingSquare(float x, float y, float size) {
  noStroke();
  fill(255);
  rect(x, y, size, size);
  //println(x, y, size, size);
}
    
            
