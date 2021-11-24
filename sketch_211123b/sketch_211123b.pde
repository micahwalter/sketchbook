int cols = 250;
int rows = 250;
int[][] myArray = new int[cols][rows];


void settings() {
  size(cols,rows);
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      myArray[i][j] = int(random(255));
      stroke(myArray[i][j]);
      point(i,j);
    }
  }
}
