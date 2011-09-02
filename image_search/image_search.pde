
void setup() {
  size(1920,1080);
  frameRate(60);
}

void draw() {

  // Draw points
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      stroke(random(255), random(255), random(255) );
      point(i,j);
    }
  }

}

