boolean hasStartedRotation1 = false;
boolean hasStartedRotation2 = false;
float rotationAngle1 = 0;
float rotationAngle2 = 0;

float triangle4Y = 0;
float velY = 0;
float gravity = 0.2;
boolean hasStartedFalling = false;

CustomTriangle triangle1, triangle2, triangle3, triangle4;

void setup() {
  size(1920, 1080);
  triangle1 = new CustomTriangle(width / 2, height / 2 + 74, width / 2 + 74, height / 2, width / 2 + 74, height / 2 + 74);
  triangle2 = new CustomTriangle(width / 2, height / 2 - 75, width / 2 - 75, height / 2, width / 2 - 75, height / 2 - 75);
  triangle3 = new CustomTriangle(width / 2, height / 2 - 75, width / 2 + 74, height / 2, width / 2 + 74, height / 2 - 75);
  triangle4 = new CustomTriangle(width / 2, height / 2 + 74, width / 2 - 75, height / 2, width / 2 - 75, height / 2 + 74);
  
  triangle4Y = height / 2;
}

void draw() {
  background(0);
   
  circle(width / 2, height / 2, 150, 150);
  
  //triangle1.display();
  //triangle2.display();
  triangle3.display();
  
  if (millis() >= 3000) {
    hasStartedFalling = true; 
  }
  
 if (hasStartedFalling) {
   if (triangle4Y < height) {
     velY += gravity;
     triangle4Y += velY;
   }
  }
  
  triangle4.y1 = triangle4Y + 74;
  triangle4.y2 = triangle4Y;
  triangle4.y3 = triangle4Y + 74;
  triangle4.display();
  
  
  pushMatrix();
  if (millis() >= 6500 && !hasStartedRotation1) {
    hasStartedRotation1 = true;
  } else if (millis() >= 13000 && !hasStartedRotation2) {
     hasStartedRotation2 = true; 
  }
  
  if (hasStartedRotation1) {
    triangle1.rotateTriangle1(rotationAngle1);
    rotationAngle1 += radians(1);
  }
  popMatrix();
  
  if (hasStartedRotation2) {
    triangle2.rotateTriangle2(rotationAngle2);
    rotationAngle2 += radians(1.5);
  }

  
  //saveFrame("frames_6(4)/frame-####.png");
  
  if (frameCount > 600) {
    noLoop();
  }
}

void circle(float x, float y, float w, float h) {
  noStroke();
  fill(255);
  ellipse(x, y, w, h);
}

void customtriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
  stroke(255);
  noFill();
  triangle(x1, y1, x2, y2, x3, y3);
}

class CustomTriangle {
  float x1, y1, x2, y2, x3, y3;

  CustomTriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
  }
  
  void display() {
    stroke(255);
    noFill();
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  void rotateTriangle1(float angle) {
    translate(x1, y1);
    rotate(angle);
    triangle(0, 0, x2 - x1, y2 - y1, x3 - x1, y3 - y1);
  }
  
    void rotateTriangle2(float angle) {
    translate(x2, y2);
    rotate(angle);
    triangle(0, 0, x1 - x2, y1 - y2, x3 - x2, y3 - y2); 
  }
}
