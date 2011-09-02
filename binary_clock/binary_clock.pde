void setup() {
  size(700, 300);
  PFont font;
  font = loadFont("Serif-48.vlw"); 
  textFont(font);
  fill(0); 
  frameRate(1);
}

void draw() {
  background(230);
  text("binary clock" , 430, 100);
  text(binary(year()), 20, 200);
  text(binary(month()), 320, 200);
  text(binary(day()), 450, 200);
  
  text(binary(hour()), 20, 240);
  text(binary(minute()), 220, 240);
  text(binary(second()), 450, 240);
  
}
