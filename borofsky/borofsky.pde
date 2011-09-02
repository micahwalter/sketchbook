int i = 0;

void setup() {
  size(700, 300);
  PFont font;
  font = loadFont("Serif-48.vlw"); 
  textFont(font);
  fill(0); 
}

void draw() {
  background(230);
  text("borofsky" , 500, 100);
  text(binary(i), 20, 240);
  i++; 
}
