float yPos = 900;
float speedY = 20;
float speedX = 18;
float xPos;
float waveSpeed = 0.05;
float waveAmplitude = 25; // Amplitude of the wave (how far the circle moves up and down)
int phase = 0; // To keep track of whether the circle is in the vertical or horizontal movement phase

void setup() {
  size(1920, 1080);
  xPos = width / 2;
}

void draw() {
  background(0);
  
  if (phase == 0) {
    yPos -= speedY;
    
    // Stop the circle from moving if it reaches the upper third of the screen
    if (yPos < 360) {
      yPos = 360;
      phase = 1;
    }
  } else if (phase == 1) {
    // Move the circle horizontally to the right with a wave-like pattern
    xPos += speedX; // Move the circle to the right by a constant amount

    yPos = 360 + waveAmplitude * sin(waveSpeed * frameCount);
    
    // Stop the sketch once the circle moves off the right side of the screen
    if (xPos > width + 75) {
      noLoop();
    }
  }
  
  // Draw the circle
  circle(xPos, yPos, 150);
  
  //saveFrame("frames_7/frame-####.png");
    
  if (frameCount > 360) {
    noLoop();
  }
}

void circle(float x, float y, float size) {
  noStroke();
  fill(255);
  ellipse(x, y, size, size);
}
