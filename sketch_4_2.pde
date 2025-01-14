class GridOfSquares {
    int numCols = 7;
    int numRows = 5;
    int squareSize = 20;
    int padding = 15;
    int currentSquare = 2;
    int totalSquares;
    
    float startX;
    float startY;


    GridOfSquares(float initialX, float initialY) {
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

    // This method displays the grid of squares
    void display() {
        float xOffset, yOffset;
        int squaresDrawn = 0;  // Track how many squares have been drawn

        noStroke();
        fill(255);

        // Loop through the grid and draw squares up to currentSquare
        for (int row = 0; row < numRows; row++) {
            for (int col = 0; col < numCols; col++) {
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
