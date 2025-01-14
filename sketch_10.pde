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
  
  if (millis() >= 3000) {
    circleOnScreen = true; 
  }
  
  if (circleOnScreen) {
    xPos += speedX;

    // Apply a sine wave to the vertical position for the wave effect
    yPos = 360 + waveAmplitude * sin(waveSpeed * frameCount);
    
    if (xPos + 75 > width) { // Check if the right side of the circle hits the screen width
      xPos = width - 75; // Ensure the circle stays inside the screen
      noLoop(); // Stop the sketch once the circle reaches the right side
    }
  }
  
  // Draw the circle
  circle(xPos, yPos, 150);
   
  //saveFrame("frames_10/frame-####.png");
  
  if (frameCount > 900) {
    noLoop();
  }
}


void circle(float x, float y, float size) {
  noStroke();
  fill(255);
  ellipse(x, y, size, size);
}
