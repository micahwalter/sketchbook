void setup() {
  size(700, 480);
}

void draw() {
  float numb = map(mouseY ,0 , height, 0, 10);
  float[] sinwave = new float[width];

  for (int i = 0; i < width; i++) {
    float amount = map(i, 0, width, 0, i*numb*PI);
    sinwave[i] = abs(sin(amount));
  }
  for (int i = 0; i < width; i++) {
    stroke(sinwave[i]*255);
    line(i, 0, i, height);
  }
}
