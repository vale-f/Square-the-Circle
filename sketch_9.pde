boolean circleOnScreen = false;
float yPos = 360; 
float speedX = 16;
float xPos = -75;
float waveSpeed = 0.05;
float waveAmplitude = 25;


void setup() {
  size(1920, 1080);
}


void draw() {
  background(0);
  
  tree(275, 650, 60, 900);
  tree(900, 650, 60, 900);
  tree(1520, 650, 60, 900);
  tree(708, 470, 450, 180);
  tree(758, 320, 350, 150);
  tree(795, 200, 280, 120);
  tree(840, 110, 200, 90);
  tree(880, 50, 125, 60);
  tree(906, 8, 75, 42);
  tree(1261, 180, 570, 470);
  tree(186, 50, 250, 600);
  tree(460, 371, 160, 280);
  tree(3, 371, 160, 280);
  
  branch(960, 760, 1045, 650);
  branch(960, 802, 1080, 650);
  
  branch(900, 760, 820, 650);
  branch(900, 802, 785, 650);
  
  branch(1580, 800, 1690, 650);
  branch(1580, 862, 1740, 650);
  
  branch(1520, 800, 1405, 650);
  branch(1520, 862, 1355, 650);
  
  branch(336, 750, 500, 750);
  branch(336, 777, 527, 777);
  branch(500, 750, 500, 652);
  branch(527, 777, 527, 652);
  
  branch(275, 750, 121, 750);
  branch(275, 777, 94, 777);
  branch(121, 750, 121, 652);
  branch(94, 777, 94, 652);
  
  if (millis() >= 3000) {
    circleOnScreen = true; 
  }
  
  if (circleOnScreen) {
    xPos += speedX;

    // Apply a sine wave to the vertical position for the wave effect
    yPos = 360 + waveAmplitude * sin(waveSpeed * frameCount);
    
    if (xPos > width + 75) {
      noLoop(); // Stop the circle once it crosses the right edge
    }
  }
  
  circle(xPos, yPos, 150);
   
  //saveFrame("frames_9/frame-####.png");
  
  if (frameCount > 900) {
    noLoop();
  }
}


void tree(float x, float y, float h, float w) {
  noFill();
  stroke(255);
  rect(x, y, h, w);
}

void branch(float x1, float y1, float x2, float y2) {
  stroke(255);
  line(x1, y1, x2, y2);
}


void circle(float x, float y, float size) {
  noStroke();
  fill(255);
  ellipse(x, y, size, size);
}
