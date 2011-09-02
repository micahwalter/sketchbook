// Example: 2D Array
int cols = width;
int rows = height;
int[][] myArray = new int[cols][rows];

void setup() {
size(900,480);


}

void draw() {
// Declare 2D array


// Initialize 2D array values
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = int(random(255));
  }
}

// Draw points
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    stroke(myArray[i][j]);
    point(i,j);
  }
}

}
