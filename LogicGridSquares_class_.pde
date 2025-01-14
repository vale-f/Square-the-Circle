class GridOfSquares {
    // Fixed properties
    int numCols = 6;
    int numRows = 5;
    int squareSize = 50;
    int padding = 10;
    int currentSquare = 0;  // To track which square to draw next
    int totalSquares;
    
    int startX;
    int startY;

    GridOfSquares(int initialX, int initialY) {
        startX = initialX;
        startY = initialY;
        totalSquares = numCols * numRows;
    }

    void update() {
        // Increment currentSquare to draw the next one
        if (currentSquare < totalSquares) {
            currentSquare++;
        }
    }

    void display() {
        int xOffset, yOffset;
        int squaresDrawn = 0;  // Track how many squares have been drawn

        noStroke();
        fill(100, 150, 255);

        // Loop through the grid and draw squares up to currentSquare
        for (int row = 0; row < numRows; row++) {
            for (int col = 0; col < numCols; col++) {
                // Calculate the position of each square
                xOffset = startX + col * (squareSize + padding);
                yOffset = startY + row * (squareSize + padding);

                // Only draw up to the currentSquare
                if (squaresDrawn < currentSquare) {
                    rect(xOffset, yOffset, squareSize, squareSize);
                }
                squaresDrawn++;
            }
        }
    }
}

GridOfSquares grid;

void setup() {
  size(400, 400);
  grid = new GridOfSquares(10, 50);
  frameRate(3);
}

void draw() {
  background(255);
  
  grid.update();
  grid.display();
}
