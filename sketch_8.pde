float roadY = -65;
float groupY = 1215;
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
    
    if (xPos > width + 75) {
      noLoop(); // Stop the circle once it crosses the right edge
    }
  }
 
  circle(xPos, yPos, 150);
  
  // Move the entire drawing by groupY
  translate(0, groupY);

  // Draw road
  stroke(255);
  strokeWeight(1);
  line(0, roadY, width, roadY);

  drawBuilding(20, roadY, 460, 1120); // Building 1
  drawBuilding(505, roadY, 420, 1050); // Building 2
  drawBuilding(950, roadY, 460, 1160); // Building 3
  drawBuilding(1435, roadY, 445, 1100); // Building 4
  

  //saveFrame("frames_8/frame-####.png");
  
  if (frameCount > 900) {
    noLoop();
  }
}


void drawBuilding(float x, float y, float w, float h) {
  noFill();
  stroke(255);
  rect(x, y - h, w, h);
  
  // Draw windows
  int windowRows = 9;
  int windowCols = 5;
  float windowWidth = w / windowCols * 0.4; // Width of each window (more squared)
  float windowHeight = windowWidth; // Make windows square
  float spacingY = h / (windowRows + 1); // Adjust vertical spacing between windows
  float spacingX = 40; // New variable for horizontal spacing between windows
  
  // Calculate the total width occupied by the windows
  float totalWindowWidth = (windowWidth + spacingX) * windowCols - spacingX; // Total width for all windows
  
  // Calculate starting x position to center the windows
  float startX = x + (w - totalWindowWidth) / 2; 

  for (int row = 0; row < windowRows; row++) {
    for (int col = 0; col < windowCols; col++) {
      // Adjust windowX calculation to include spacingX
      float windowX = startX + col * (windowWidth + spacingX);
      float windowY = y - h + (row + 1) * spacingY - windowHeight;
      noFill();
      stroke(255);
      rect(windowX, windowY, windowWidth, windowHeight);
    }
  }
}

void circle(float x, float y, float size) {
  noStroke();
  fill(255);
  ellipse(x, y, size, size);
}
