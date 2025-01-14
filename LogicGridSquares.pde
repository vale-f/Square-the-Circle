int numCols = 6;
int numRows = 5;
int squareSize = 50;
int padding = 10;
int currentSquare = 0;  // To track which square to draw next
int totalSquares;

int startX = 10;  // Starting X position of the grid
int startY = 50;  // Starting Y position of the grid

void setup() {
  size(400, 400);
  totalSquares = numCols * numRows;
  frameRate(3);
}

void draw() {
  background(255);

  int xOffset, yOffset;
  int squaresDrawn = 0;

  // Loop through the grid and draw squares
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      xOffset = startX + col * (squareSize + padding);
      yOffset = startY + row * (squareSize + padding);

      // Draw squares one by one until the currentSquare reaches totalSquares
      if (squaresDrawn < currentSquare) {
        fill(100, 150, 255);
        rect(xOffset, yOffset, squareSize, squareSize);
      }
      squaresDrawn++;
    }
  }

  if (currentSquare < totalSquares) {
    currentSquare++;
  }
}
