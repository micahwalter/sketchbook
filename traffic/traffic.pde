PImage camA;
PImage camB;
PImage camC;
PImage camD;

void setup() {
  size(700,480);
  PFont font;
  font = loadFont("Serif-48.vlw"); 
  textFont(font);
  fill(0); 
  frameRate(1);
}

void draw() {
    background(0);
  
    camA=loadImage("http://207.251.86.248/cctv5.jpg");
    image(camA , 0,0);
    camB=loadImage("http://207.251.86.248/cctv7.jpg");
    image(camB , 352, 0);
    camC=loadImage("http://207.251.86.248/cctv13.jpg");
    image(camC , 0,240);
    camD=loadImage("http://207.251.86.248/cctv14.jpg");
    image(camD , 352, 240);
    
    

} 
