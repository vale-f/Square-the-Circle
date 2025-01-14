float moveX = 0;

float squareSize = 250;
float spacing = 200;
float startX = 100;
float startY;

float widthStick = 10;
float heightStick = 190;
float startXStick = 225;
float startYStick;

float widthMonitor = 280;
float heightMonitor = 190;
float startXMonitor = 87;
float startYMonitor;

int startTime;
int delayTime = 6000;
int delayTime2 = 7000;
int delayTime3 = 8000;
int delayTime4 = 8400;
int delayTime5 = 9500;
int delayTime6 = 9900;
int delayTime7 = 10600;
int delayTime8 = 11000;
int delayTime9 = 12200;
int delayTime10 = 12900;

GridOfSquares grid1;
GridOfSquares grid2;
GridOfSquares grid3;
GridOfSquares grid4;
GridOfSquares grid5;
GridOfSquares grid6;


void setup() {
    size(1920, 1080);
    
    startTime = millis();
  
    startY = height / 2 + 340 - squareSize / 2;
    startYStick = height / 2 + 150 - squareSize / 2;
    startYMonitor = height / 2 - 45 - squareSize / 2;
    
    grid1 = new GridOfSquares(112.4, 386);
    grid2 = new GridOfSquares(562.7, 386);
    grid3 = new GridOfSquares(1012.6, 386);
    grid4 = new GridOfSquares(1462.6, 386);
    grid5 = new GridOfSquares(1912.5, 386);
    grid6 = new GridOfSquares(2362.6, 386);
    frameRate(3);
}



void draw() {
    background(0);
    
    translate(moveX, 0);  // Shift everything by moveX in the X direction
    
    for (int i = 0; i < 6; i++) {
        square(startX + (squareSize + spacing) * i, startY, squareSize);
    }
  
    for (int i = 0; i < 6; i++) {
        stick(startXStick + (squareSize + spacing) * i, startYStick, widthStick, heightStick);
    }
  
    for (int i = 0; i < 6; i++) {
        monitor(startXMonitor + (squareSize + spacing) * i, startYMonitor, widthMonitor, heightMonitor);
    }
    
    grid1.update();
    grid1.display();
    
    grid2.update();
    grid2.display();
    
    grid3.update();
    grid3.display();
    
    grid4.update();
    grid4.display();
    
    grid5.update();
    grid5.display();
    
    grid6.update();
    grid6.display();
    
    
    circle(3040, 884, 252);
    
    stick(3040, startYStick, widthStick, heightStick + 3);
    monitor(2900, startYMonitor, widthMonitor, heightMonitor);
    
    
    circle(2935, 401, 20);
    squareRoundedCorners(2955, 399, 20, 10);
    circle(2990, 400, 20);
    squareRoundedCorners(3010, 401, 25, 8);
    circle(3070, 401, 25);
    squareRoundedCorners(3090, 401, 22, 8);
    squareRoundedCorners(3117, 401, 21, 12);
    circle(3152, 410, 15);
    squareRoundedCorners(2930, 428, 22, 10);
    squareRoundedCorners(2970, 430, 20, 10);
    squareRoundedCorners(3000, 436, 12, 15);
    squareRoundedCorners(3020, 436, 12, 15);
    squareRoundedCorners(3050, 425, 27, 12);
    squareRoundedCorners(3087, 430, 22, 10);
    squareRoundedCorners(3120, 430, 22, 15);
    squareRoundedCorners(3150, 430, 18, 11);
    
    
    if (millis() - startTime >= delayTime) {
      squareRoundedCorners(2922, 460, 22, 15);
    }
    
    if (millis() - startTime >= delayTime2) {
      squareRoundedCorners(2960, 462, 25, 11);
    }
    
    if (millis() - startTime >= delayTime3) {
      squareRoundedCorners(3000, 462, 25, 20);
    }
    
    if (millis() - startTime >= delayTime4) {
      circle(3047, 475, 14);
    }
    
    if (millis() - startTime >= delayTime5) {
      squareRoundedCorners(3070, 463, 27, 18);
    }
    
    if (millis() - startTime >= delayTime6) {
      squareRoundedCorners(3105, 462, 21, 20);
    }
    
    if (millis() - startTime >= delayTime7) {
      squareRoundedCorners(3138, 463, 21, 14);
    }
    
    if (millis() - startTime >= delayTime8) {
      squareRoundedCorners(2920, 490, 24, 22);
    }
    
    if (millis() - startTime >= delayTime9) {
      squareRoundedCorners(2950, 495, 26, 15);
    }
    
    if (millis() - startTime >= delayTime10) {
      squareRoundedCorners(2985, 492, 23, 18);
    }
    
    if (millis() - startTime >= delayTime10 + 500) {
      squareRoundedCorners(3015, 494, 20, 18);
    }
    
    
    if (millis() - startTime >= delayTime10 + 1200) {
      squareRoundedCorners(3050, 494, 23, 14);
    }
    
    if (millis() - startTime >= delayTime10 + 2300) {
      squareRoundedCorners(3080, 495, 23, 25);
    }
    
    if (millis() - startTime >= delayTime10 + 2900) {
      squareRoundedCorners(3110, 493, 19, 15);
    }
    
    if (millis() - startTime >= delayTime10 + 4200) {
      squareRoundedCorners(3140, 493, 19, 15);
    }
    
    if (millis() - startTime >= delayTime10 + 5300) {
      squareRoundedCorners(2922, 522, 21, 17);
    }
    
    if (millis() - startTime >= delayTime10 + 6300) {
      squareRoundedCorners(2950, 526, 18, 28);
    }
    
    if (millis() - startTime >= delayTime10 + 7400) {
      squareRoundedCorners(2978, 523, 23, 22);
    }
    
    if (millis() - startTime >= delayTime10 + 8600) {
      squareRoundedCorners(3005, 524, 20, 20);
    }
     
    
    // Update moveX to shift the entire screen to the right over time
    moveX -= 71;
    
    if (moveX <= -2260) {
      moveX = -2260;
    }
    
  //saveFrame("frames_4/frame-####.png");
  
  if (frameCount > 2000) {
    noLoop();
  }
}


void square(float x, float y, float size) {
    noStroke();
    fill(255);
    rect (x,y,size,size);
}

void stick(float x, float y, float w, float h) {
    stroke(255);
    strokeWeight(4);
    rect(x, y, w, h);
}


void monitor(float x, float y, float w, float h) {
    noFill();
    stroke(255);
    strokeWeight(16);
    rect(x,y,w,h);
}


void circle(float x, float y, float size) {
    noStroke();
    fill(255); 
    ellipse(x, y, size, size);
  //println(x, y, size);
}


void squareRoundedCorners(float x, float y, float size, float CornerRadius) {
      noStroke();
    fill(255);
    rect (x,y,size,size,CornerRadius);
};
