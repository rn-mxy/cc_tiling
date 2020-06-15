import processing.pdf.*;

// global variable for cell size
int size = 40;

// global variable for probability
float probability = 0.4; // change this value to increase or decrease the probability of rotating clock or counter-clock wise

void setup() {
  // define canvas size in pixel
  size(1000, 1000);

  // call function once on startup
  generatePattern();
  
  frameRate(2);
}


void draw() {
  generatePattern();
}

void generatePattern() {
  // clear background with color
  background(234, 224, 213);
  
  // generate new cell size with a random value between 15 - 100
  size = floor(random(50, 50));
  // nested for-loop for each X and Y value for evey cell
  for(int x = 0; x < width; x+=size) {
    for(int y = 0; y < height; y+=size) {
      pushMatrix();
      // move the canvas to a new origin
      // -> new origin is the center of each cell
      translate(x+size/2, y+size/2);
      
      // draw each cell (white transparent with opactiy)
      noFill();
      noStroke();
      rect(-size/2, -size/2, size, size);
      
      // decide on the rotation by random value
      // rotate the canvas by either PI/4 or -PI/4
      if(random(1) < probability) {
        rotate(PI/4);
      }
      else {
        rotate(-PI/4);
      }
        
      int selected = (int)random(0, 3);
      int choicesR[] = {34, 198, 94};
      int choicesG[] = {51, 172, 80};
      int choicesB[] = {59, 143, 63};
      color c = color(choicesR[selected], choicesG[selected], choicesB[selected]);
      
      // draw horizontal line 
      if(random(1) < probability) {
        noStroke();
        fill(lerpColor(color(94, 80, 63), color(34, 51, 59), (((millis()/1000)%2==0)?millis()%1000:1000-millis()%1000)/1000.0));
      }
      else {
        stroke(c);
      }
      rect(-size/2, -size/2, 50, 50);
      popMatrix();
    }
  }
}
