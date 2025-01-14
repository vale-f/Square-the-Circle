String title = "Square the circle";
int[] alphaValues; // Array to hold alpha values for each character
int[] delays; // Array to hold random delays for each character

PFont customFont; // Declare a variable for the font

void setup() {
  size(1920, 1080);
  alphaValues = new int[title.length()];
  delays = new int[title.length()];
  
  // Load your custom font
  customFont = createFont("Silkscreen-Regular.ttf", 85); // Ensure this file is in your data folder

  // Initialize alpha values to 0 and set random delays
  for (int i = 0; i < title.length(); i++) {
    alphaValues[i] = 0; // Start fully transparent
    delays[i] = int(random(500, 2000)); // Random delay
    delayCharacter(i, delays[i]);
  }
  frameRate(300); // Set the frame rate
}

void draw() {
  
  background(0);
  fill(255);
  textAlign(LEFT);
  textFont(customFont);
  
  float x = (width - textWidth(title)) / 2; // Center the text horizontally
  float y = height / 2; // Center vertically

  // Draw each character with its alpha value
  for (int i = 0; i < title.length(); i++) {
    fill(255, alphaValues[i]);
    text(title.charAt(i), x + textWidth(title.substring(0, i)), y); // Position each character
  }
  //saveFrame("frames/frame-####.png"); // Save the frame as a PNG
  
  if (frameCount > 300) {
    noLoop(); // Stops the sketch after reaching the frame limit
  }
}

void delayCharacter(int index, int delay) {
  // Use a separate thread to handle the delay and fade in
  new Thread(() -> {
    try {
      Thread.sleep(delay); // Wait for the initial delay
      
      // Fade in
      while (alphaValues[index] < 255) {
        alphaValues[index] += 5; // Fade in speed
        Thread.sleep(30); // Control fade speed
      }

      // Delay before fading out
      Thread.sleep(3000); // Wait before fading out

      // Fade out
      while (alphaValues[index] > 0) {
        alphaValues[index] -= 7; // Fade out speed
        Thread.sleep(30); // Control fade speed
      }
      
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }).start();
}
