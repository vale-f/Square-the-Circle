float x;
float squareSize = 370;
float targetX;
float speed;
float easing = 0.07;


void setup() {
    size(1920, 1080);
    x = width - 100;
    targetX = width / 2 - squareSize / 2;
}



void draw() {
    background(0);

    rect(x, height / 2 + 50, squareSize, squareSize);
  
    // Calculate the distance between the square and the target position
    float distance = targetX - x;
  
    speed = distance * easing;
  
    x += speed;
  
    // Stop the square when it is close enough to the target
    if (abs(distance) < 1) {
        x = targetX; // Ensure it stops exactly at the center
    }
    
    //saveFrame("frames_4/frame-####.png");
  
    if (frameCount > 2000) {
        noLoop();
    }
  }
