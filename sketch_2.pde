float roadY;
float spacing = 80; // Distance between each dot
float dotLength = 40;
float groupY = 1215;

boolean shouldStop = false;



MovingSquares[] squares;
MovingSquares[] squares2;
MovingSquares[] squares3;
int squareCount = 24;
MovingSquaresLast[] squares4;
int squareCount4 = 35;
SecondMovingSquaresLast[] squares5;

Circle circle;

void setup() {
  size(1920, 1080);
  roadY = height / 2 + 40;
  
  squares = new MovingSquares[squareCount];
  for (int i = 0; i < squareCount; i++) {
    float startX = i * (27 + 54); //Spacing between squares
    squares[i] = new MovingSquares(startX, height / 2 + 66, 37, 5, -1);
  }
   squares2 = new MovingSquares[squareCount];
   for (int i = 0; i < squareCount; i++) {
     float startX = i * (27 + 54);
     squares2[i] = new MovingSquares(startX, height / 2 + 154, 37, 5, -1);
  }
   squares3 = new MovingSquares[squareCount];
   for (int i = 0; i < squareCount; i++) {
     float startX = i * (27 + 54);
      squares3[i] = new MovingSquares(startX, height / 2 + 372, 37, 5, 1);
    }
    squares4 = new MovingSquaresLast[squareCount4];
    float initialOffset = -1557; // Start off-screen to the left
    for (int i = 0; i < squareCount4; i++) {
      float startX2 = initialOffset + i * (27 + 54);
       squares4[i] = new MovingSquaresLast(startX2, height / 2 + 282, 37, 5, 1);
    }
    
    circle = new Circle(-1320, height / 2 + 297, 39, 4, 1); // Initialize the circle at the left side of the window
    circle.setWaveProperties(0.17, 0.008); // Set amplitude and frequency
    
    squares5 = new SecondMovingSquaresLast[squareCount4];
    float initialOffset2 = -4170; // Start off-screen to the left
    for (int i = 0; i < squareCount4; i++) {
      float startX2 = initialOffset2 + i * (27 + 54); // Adjust spacing between squares
      squares5[i] = new SecondMovingSquaresLast(startX2, height / 2 + 282, 37, 4, 1); // Start from left
    }
}


void draw() {
  background(0);
  
  // Move the entire drawing by groupY
  translate(0, groupY);

  // Road
  stroke(255);
  strokeWeight(2);
  line(0, roadY, width, roadY);

  drawBuilding(30, roadY, 250, 650); // Building 1
  drawBuilding(300, roadY, 220, 550); // Building 2
  drawBuilding(545, roadY, 250, 700); // Building 3
  drawBuilding(820, roadY, 245, 600); // Building 4
  drawBuilding(1085, roadY, 240, 660); // Building 5
  drawBuilding(1350, roadY, 245, 710); // Building 6
  drawBuilding(1620, roadY, 250, 660); // Building 7
  
  // Draw tick line
  strokeWeight(40);
  line(0, height / 2 + 236, width, height / 2 + 236);

  // Draw the first dotted lane divider
  drawDottedLine(0, height / 2 + 127, width, height / 2 + 127, spacing, dotLength); // First dotted line
  
  // Draw the second dotted lane divider at a different position
  drawDottedLine(0, height / 2 + 342, width, height / 2 + 342, spacing, dotLength); // Second dotted line
  
  for (MovingSquares square : squares) {
    square.update();
    square.display();
    }
    
  for (MovingSquares square : squares2) {
    square.update();
    square.display();
  }
  
   for (MovingSquares square : squares3) {
     square.update();
     square.display();
   }
   
   for (MovingSquaresLast square : squares4) {
     square.update();
     square.display();
    }
    
    circle.update();
    circle.display();
    
    // Fifth line of moving squares
    for (SecondMovingSquaresLast square : squares5) {
      square.update();
      square.display();
    }
    

  // Move up until groupY reaches 0
  if (groupY > 95) {
    groupY -= 3; // Adjust this value for speed
    if (groupY <= 95) {
      groupY = 95;
    }
  }
  
  //saveFrame("frames_2/frame-####.png");
  
  if (frameCount > 1200) {
    noLoop();
  }
}

// Function to draw a dotted line
void drawDottedLine(float x1, float y1, float x2, float y2, float spacing, float dotLength) {
  stroke(255);
  strokeWeight(2);
  
  for (float i = 0; i < dist(x1, y1, x2, y2); i += spacing) {
    float x = lerp(x1, x2, i / dist(x1, y1, x2, y2));
    float y = lerp(y1, y2, i / dist(x1, y1, x2, y2));
    line(x, y, x + dotLength, y);
  }
}

// Function to draw a building with windows and a door
void drawBuilding(float x, float y, float w, float h) {
  noFill();
  stroke(255);
  rect(x, y - h, w, h);
  
  int windowRows = 7;
  int windowCols = 4;
  float windowWidth = w / windowCols * 0.4; // Width of each window (more squared)
  float windowHeight = windowWidth; // Make windows square
  float spacingY = h / (windowRows + 1); // Adjust vertical spacing between windows
  float spacingX = 30; // New variable for horizontal spacing between windows
  
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

  float doorWidth = w * 0.15;
  float doorHeight = h * 0.08;
  float doorX = x + (w - doorWidth) / 2;
  float doorY = y - h + h * 0.92;
  noFill();
  stroke(255);
  rect(doorX, doorY, doorWidth, doorHeight);
}
