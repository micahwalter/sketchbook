int d=0;
int[] e={255,0};
boolean upwards = false;
int opacity = 0;

void setup(){
  noFill();
  size(600, 600);
  background(0);
}

void draw(){
  d=(d>0)?0:1;
  
  if ((opacity == 100) || (opacity == 0))
    upwards = !upwards;
    
  if ( upwards == true )
    opacity++;
   else
    opacity--;
  
  
  println(opacity);
  
  
  stroke(b(),e[d],b(),opacity);
  bezier(b(),b(),b(),b(),b(),b(),b(),b());
}

float b(){
  return random(width);
}
