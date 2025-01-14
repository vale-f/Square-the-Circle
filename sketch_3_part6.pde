float circleX = 960;
float circleY = 806;
float circleSize = 298;

float targetX;

float circleVelocity = 3;
int direction = 1;  // (1 = right)

// Range variables for circle movement
float minX = 740;
float maxX = 1150;

// Timing variables
float squareAppearTimeLeft = 0.5;
float squareAppearTimeRight = 2.0;
float startTime;

MovingSquares squareLeft;
MovingSquares squareRight;


void setup() {
  size(1920, 1080);
  squareLeft = new MovingSquares(-10, 1100, 400, 8.5, 620);
  squareRight = new MovingSquares(1530.3675, 1100, 400, 8.5, 620);
  
   // Initialize target position for circle
  targetX = random(minX, maxX);
  
  startTime = millis();
}



void draw() {
  background(0);
  
  drawFrame(width/2, 198, 700, 870);
  
  updateCircle();
  circle(circleX, circleY, circleSize);
  
  circle(circleX, circleY, circleSize);
   
  // Check if the squares should appear after the specified time
  if ((millis() - startTime) / 1000 >= squareAppearTimeLeft) {
      squareLeft.update();
      squareLeft.display();
  }
  
  if ((millis() - startTime) / 1000 >= squareAppearTimeRight) {
      squareRight.update();
      squareRight.display();
  }
  
  //saveFrame("frames_3_part6/frame-####.png");
  
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

void circle(float x, float y, float size) {
  noStroke();
  fill(255); 
  ellipse(x, y, size, size);
  //println(x, y, size);
}


void updateCircle() {
  if (circleX < targetX) {
    circleX += circleVelocity;
  } else if (circleX > targetX) {
    circleX -= circleVelocity;
  }

  // If the circle reaches the target position, pick a new random target
  if (abs(circleX - targetX) < 5) {
    targetX = random(minX, maxX);
    circleVelocity = random(2, 5);
  }
}
