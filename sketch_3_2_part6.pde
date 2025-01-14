
class MovingSquares {
    float x; 
    float y;
    float speedX;
    float speedY;
    float speedY2;
    float size;
    float initialPositionY;
    float deceleration;

   
    MovingSquares(float startX, float startY, float squareSize, float squareSpeedY, float initial_PositionY) {
        x = startX;
        y = startY;
        size = squareSize;
        speedY = squareSpeedY;
        initialPositionY = initial_PositionY;
        deceleration = 0.05;
    }

    void update() {
        if (y > initialPositionY) {
            y -= speedY;
            speedY -= deceleration;
            if (speedY < 0) {
                speedY = 0.3;
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
