class MovingSquares {
    float x;
    float y;
    float speed;
    float size;
    int direction; // 1 for right, -1 for left

    MovingSquares(float startX, float startY, float squareSize, float squareSpeed, int dir) {
        x = startX;
        y = startY;
        size = squareSize;
        speed = squareSpeed;
        direction = dir;
    }

    void update() {
        x += speed * direction;
        if (x > width) { // Reset position to the left when it goes off the screen
            x = -size; 
        }
        if (x < -size) { // Reset position to the right when it goes off the screen
            x = width; 
        }
    }

    void display() {
        noStroke();
        fill(255);
        rect(x, y, size, size);
    }
}


class MovingSquaresLast {
    float x;
    float y;
    float speed;
    float size;
    int direction; // 1 for right, -1 for left
    boolean isVisible = true; // To track visibility

    MovingSquaresLast(float startX, float startY, float squareSize, float squareSpeed, int dir) {
        x = startX;
        y = startY;
        size = squareSize;
        speed = squareSpeed;
        direction = dir; // Set direction
    }

    void update() {
        x += speed * direction; // Update based on direction
        
        // Mark as not visible if it goes off the right side
        if (x > width) {
            isVisible = false; // Mark as not visible
        }
    }

    void display() {
        if (isVisible) {
            noStroke();
            fill(255);
            rect(x, y, size, size);
        }
    }
}


class Circle {
    float x;
    float y;
    float speed;
    float size;
    boolean isVisible = true; 
    float waveAmplitude;
    float waveFrequency;
    float targetX; // Target position for slowing down
    boolean isStopping = false; // Flag to check if it is stopping
    float deceleration = 0.05; // Amount to decrease speed each frame
    float minSpeed = 1; // Minimum speed to maintain

    Circle(float startX, float startY, float circleSize, float circleSpeed, int dir) {
        x = startX;
        y = startY;
        size = circleSize;
        speed = circleSpeed * dir; // Use dir to set initial speed direction
        targetX = width / 2 + 200;
    }
    
    void setWaveProperties(float amplitude, float frequency) {
        waveAmplitude = amplitude;
        waveFrequency = frequency;
    }

    void update() {
        if (isVisible) {
            // Update position based on speed
            x += speed; 
            y += sin(x * waveFrequency) * waveAmplitude;

            // Gradually reduce speed as it approaches the target position
            if (abs(x - targetX) < 200) { // Adjust this threshold as needed
                speed = max(minSpeed, speed - deceleration); // Reduce speed but keep above minSpeed
                isStopping = true; // Indicate that the circle is slowing down
            } else {
                isStopping = false; // Reset stopping flag when not near target
            }

            // Check for collision with squares
            for (SecondMovingSquaresLast square : squares5) {
                float threshold = 18;
                if (isVisible && square.isVisible && x < square.x + square.size + threshold && x + size > square.x) {
                    x += speed * 5;
                    break;
                }
            }

            if (x > width) {
                isVisible = false;
            }
        }
    }

    void display() {
        if (isVisible) {
            noStroke();
            fill(255);
            ellipse(x, y, size, size);
        }
    }
}



class SecondMovingSquaresLast {
    float x;
    float y;
    float speed;
    float size;
    int direction;
    boolean isVisible = true;
    

    SecondMovingSquaresLast(float startX, float startY, float squareSize, float squareSpeed, int dir) {
        x = startX;
        y = startY;
        size = squareSize;
        speed = squareSpeed;
        direction = dir;
    }

    void update() {
        if (!shouldStop) {
            x += speed * direction;
            if (x > width) {
                isVisible = false;
            }
        }
    }

    void display() {
        if (isVisible) {
            noStroke();
            fill(255);
            rect(x, y, size, size);
        }
    }
}
