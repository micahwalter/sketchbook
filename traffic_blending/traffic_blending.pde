PImage cam1;


void setup() {
  size(640,480);
  frameRate(1);
  background(0);
}

void draw() {
    
  
    cam1=loadImage("http://207.251.86.248/cctv1.jpg");
    image(cam1 , 0,0, 640, 480);
    
}
