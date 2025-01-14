class MovingSquareRight {
    float x; 
    float y;
    float speedX;
    float speedY;
    float speedY2;
    float size;
    float initialPositionY;
    float deceleration;
    float deceleration2;
    float perspectiveFactor;
    float distanceFromStart;
   
    MovingSquareRight(float startX, float startY, float squareSize, float squareSpeedX, float squareSpeedY, float initial_PositionY) {
        x = startX;
        y = startY;
        size = squareSize;
        speedX = squareSpeedX;
        speedY = squareSpeedY;
        initialPositionY = initial_PositionY;
        deceleration = 0.05;
        deceleration2 = 0.015;
        perspectiveFactor = 0.5;
        distanceFromStart = x - 761;
    }

    void update() {
        // Move towards initialPositionY
        if (y > initialPositionY) {
            // Move down
            y -= speedY;
            // Slow down
            speedY -= deceleration;
            if (speedY < 0) {
                speedY = 0.3;
            }
        } else {
            // Move towards (1000, 500)
            if (x < 760) {
                x += speedX; // Move right
                speedX -= deceleration2;
            }
         }
        //println(x,y);
    }
    void display() {
        noStroke();
        fill(255);
        rect(x, y, size, size);
    }
}
