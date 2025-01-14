int numSquares = 230;
float[] xPos = new float[numSquares];
float[] yPos = new float[numSquares];
float[] yOffset = new float[numSquares];
float[] speed = new float[numSquares];
float amplitude = 214;
float waveLength = 0.0025;
boolean isMoving = true;
float minDistance = 33; // Minimum distance to avoid overlap
float maxSpeed = 7.5; // Maximum speed
float minSpeed = 3.5; // Minimum speed

boolean showCircle = false;
float circleX = -50;
float circleY;
float circleDiameter = 30;
float circleSpeed = 6;
float circleAmplitude = 50;
float angle = 0; // Control angle for circle oscillation
float threshold = 30; // Distance from right edge to show the circle

// New control variables for circle's behavior
int circleState = 0; // 0: Moving, 1: Transitioning to Diagonal, 2: Diagonal, 3: Waiting, 4: New Motion
float stopDecay = 0.05; // Decay rate for stopping
float diagonalSpeed = 0.5;
float targetSpeed = 11;
float newSpeed = 0; // Start at 0 speed
float speedIncrement = 0.4; // Amount to increase speed each frame
float newAmplitude = 30; // New amplitude for the second half
boolean hasMovedOnce = false;

void setup() {
  size(1920, 1080);
  
  // Initialize positions and speeds for each square
  for (int i = 0; i < numSquares; i++) {
    xPos[i] = random(-1350, -270); 
    yOffset[i] = random(-550, 250);
    speed[i] = random(minSpeed, maxSpeed);
  }

  circleY = (height / 2) + 30;
}

void draw() {
  background(0);

  // Update and draw each square only if moving
  if (isMoving) {
    boolean allOffScreen = true; // Flag to check if all squares are off screen
    noStroke();
    
    for (int i = 0; i < numSquares; i++) {
      // Update speed based on xPos
      speed[i] = calculateSpeed(xPos[i]);

      // Move square to the right
      xPos[i] += speed[i];  

      // Apply sine wave for smooth group up/down movement and add individual vertical offsets
      yPos[i] = (height / 2) + sin(xPos[i] * waveLength) * amplitude + yOffset[i]; 

      // Avoid overlapping with other squares
      for (int j = 0; j < i; j++) { // Check against previous squares only
        if (dist(xPos[i], yPos[i], xPos[j], yPos[j]) < minDistance) {
          float overlap = minDistance - dist(xPos[i], yPos[i], xPos[j], yPos[j]);
          if (xPos[i] > xPos[j]) {
            xPos[i] += overlap / 2;
            xPos[j] -= overlap / 2;
          } else {
            xPos[i] -= overlap / 2;
            xPos[j] += overlap / 2;
          }
        }
      }

      fill(255);
      rect(xPos[i], yPos[i], 27, 27);

      // Check if a square is still on the screen
      if (xPos[i] <= width) {
        allOffScreen = false;
      }
    }

    // Check if the last square is close to the right edge of the screen
    if (xPos[numSquares - 1] > width - threshold) {
      showCircle = true;
    }

    if (allOffScreen) {
      isMoving = false; // If all squares are off the right side of the screen, stop movement
      showCircle = true; // Keep the circle visible if it has already started moving
    }
  }

  if (showCircle) {
    switch (circleState) {
      case 0: // Moving
        // Update the circle's position
        circleX += circleSpeed; // Move the circle to the right
        float yOffset = sin(angle) * circleAmplitude; // Vertical oscillation for the circle
        circleY = height / 2 + yOffset; // Update vertical position

        // Angle for circle oscillation
        angle += 0.05;

        // Check if the circle is close to a specified point of the screen
        if (circleX >= width / 2 - 400) {
          circleState = 1;
        }
        break;

      case 1: // Transitioning to diagonal
        // Gradually reduce horizontal speed while increasing upward speed
        circleX += circleSpeed * (1 - stopDecay); // Keep moving right but decay speed smoothly
        circleY -= diagonalSpeed * (1 - stopDecay); // Move upward gradually
        circleSpeed -= stopDecay; // Gradually reduce speed
        
        if (circleSpeed < 0) {
          circleSpeed = 0; // Prevent negative speed
        }
        
    // Instead of switching directly to Case 2, you can decide when to switch based on both x and y movements
    if (circleSpeed < 0.5) { 
        circleState = 2; // Switch to diagonal movement when the upward speed is slow
    }
        break;

      case 2: // Diagonal movement
        circleX += diagonalSpeed; // Continue moving horizontally
        circleY -= diagonalSpeed * 0.6; // Continue moving vertically (upward)
      
        if (circleY < height / 2 - 50) {
          circleState = 3;
        }
        break;

      case 3: // Waiting
        // Small horizontal movement (only once)
        if (!hasMovedOnce) { // Check if the movement has not happened yet
          float horizontalMovement = 2; // Number of pixels to move
          circleX += horizontalMovement;
          hasMovedOnce = true; // Set the flag to true to prevent further movement
        }

        angle += 0.09; // Update angle for oscillation
        float waitXOffset = sin(angle) * 0.3; // Amplitude of pixels for subtle oscillation

        circleX += waitXOffset; // Move back and forth slightly

        // Change to new motion after waiting for a specified number of frames
        if (frameCount % 60 == 0) {
          circleState = 4;
        }
        break;

      case 4: // New Motion
        circleX += newSpeed;
        
        // Gradually increase newSpeed until it reaches targetSpeed
        if (newSpeed < targetSpeed) {
          newSpeed += speedIncrement;
          if (newSpeed > targetSpeed) {
            newSpeed = targetSpeed;
          }
        }
        float newYOffset = sin(angle) * newAmplitude; // New vertical oscillation
        circleY = height / 2 - 108.5 + newYOffset;

        // Update angle for new oscillation
        angle += 0.05; // Control speed of oscillation

        if (circleX > width) {
          showCircle = false;
        }
        break;
    }

    fill(255);
    ellipse(circleX, circleY, circleDiameter, circleDiameter);
  }
  
   //saveFrame("frames_1/frame-####.png");
  
  if (frameCount > 840) {
    noLoop();
  }
}

// Function to calculate speed based on x position
float calculateSpeed(float x) {
  float centerX = width / 2;
  float distanceFromCenter = abs(centerX - x);
  
  float speedFactor;
  
  // Determine if the square is in the first or second half of the screen
  if (x < centerX) {
    float mappedDistance = map(distanceFromCenter, 0, centerX, minSpeed, maxSpeed);
    speedFactor = mappedDistance;
  } else {
    float baseSpeedFactor = minSpeed + (maxSpeed - minSpeed) * (1.5 - (distanceFromCenter / centerX));
    float modulatedSpeedFactor = maxSpeed - (maxSpeed - minSpeed) * sin(distanceFromCenter / centerX * PI / 2);
    speedFactor = (baseSpeedFactor + modulatedSpeedFactor) / 2;
  }
  
  return speedFactor;
}
