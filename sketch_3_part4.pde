
Circle circle;

void setup() {
  size(1920, 1080);
  circle = new Circle(width/2, 1100, 400, 7, 810);
}


void draw() {
  background(0);
  
  drawFrame(width/2, 198, 700, 870);
  
  circle.update();
  circle.display();
  
  //saveFrame("frames_3_part4/frame-####.png");
  
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


class Circle {
    float x; 
    float y;
    float speedX;
    float speedY;
    float size;
    float initialPositionY;
    float deceleration;

    Circle(float startX, float startY, float circleSize, float circleSpeedY, float initial_PositionY) {
        x = startX;
        y = startY;
        size = circleSize;
        speedY = circleSpeedY;
        initialPositionY = initial_PositionY;
    }
  
   void update() {
        // Move towards initialPositionY
        if (y > initialPositionY) {
            // Move down
            y -= speedY;
            // Slow down
            speedY -= deceleration;
            // Ensure speed does not go below zero
            if (speedY < 0) {
                speedY = 0;
            } 
        }
        //println(x,y);
   }
    
    void display() {
        noStroke();
        fill(255);
        ellipse(x, y, size, size);
    }
}
