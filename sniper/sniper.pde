PImage cam;
int timer;
int timelength = 1000;
int rad;
int camNumb;


void setup() {
  rad = 75;
  noCursor();
  size(1920,1200);
  fill(0);
  stroke(0);
  timer = millis();
  camNumb = 5;
  
  cam=loadImage("http://207.251.86.248/cctv"+camNumb+"5.jpg");
}

void draw() {

  if (millis() - timer > timelength){
      timer = millis();
     cam=loadImage("http://207.251.86.248/cctv"+camNumb+".jpg");
  }
  
  image(cam , 0,0, width,height);
  beginShape();
  // outer shape
  vertex(0,0);
  vertex(width,0);
  vertex(width,height);
  vertex(0,height);
  vertex(0,0);  

  breakShape();
  //cutout
  vertex(mouseX,mouseY);
  vertex(mouseX,mouseY+rad);
  vertex(mouseX+rad,mouseY+rad);
  vertex(mouseX+rad,mouseY);
  endShape(CLOSE);

  line(0, mouseY+rad/2 , mouseX+rad, mouseY+rad/2);
  line(mouseX+rad/2 , 0 , mouseX+rad/2 , mouseY+rad);

}

void keyPressed() {
  if( key == CODED ) {
        if( keyCode == UP )
          rad=rad+10;
        else if( keyCode == DOWN )
         rad=rad-10;
        else if (keyCode == LEFT)
         camNumb=camNumb-1;
         else if (keyCode == RIGHT)
         camNumb=camNumb+1;
  }
}


