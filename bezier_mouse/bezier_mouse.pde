

void setup(){
  noFill();
  size(700, 700);
  background(0);
}

void draw(){
  stroke(b(),b(),b(),9);
  bezier(mouseX,mouseY,mouseY,mouseX,b(),b(),b(),b());
}

float b(){
  return random(255);
}

float e(){
  return random(width) ;
}
