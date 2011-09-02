//
// Roomba UI mockup
//
//  Tod E. Kurt, tod@todbot.com
//

boolean usemouse = true;
boolean toggleDraw = false;

float radius = 20.0;
int max_speed = 7;
float angle, delta_theta = 2*PI/20;
float xp,yp, dx,dy,c,speed;
PFont fontA;
//PSound soundA;   // yeah this is a bad idea
PImage roombapic;

RoombaComm  roombaComm;

void setup() 
{
  size(350, 350);
  stroke(100);
  background(153);
  ellipseMode(CENTER_RADIUS);
  rectMode(CENTER);
  smooth();
  frameRate(20);
  xp = width/2;
  yp = height/2;
  fontA = loadFont("CourierNewPSMT-24.vlw"); //CourierNew36.vlw, Ziggurat-HTF-Black-32.vlw");
  //soundA = loadSound("todwhir.wav");
  //roombapic = loadImage("roomba-sm.png");

  roombaComm = new RoombaComm();
  
}

int gridspacing = 50;
void drawGridlines() 
{
  stroke(120); strokeWeight(1);  
  for( int i=0; i< 10; i++ ) {
    line(0, i*gridspacing, width, i*gridspacing);
    line(i*gridspacing,0, i*gridspacing, height);
  }
}

void drawRoomba(float xp, float yp, float angle)
{
  translate(xp,yp);
  rotate(angle);
  
  if( toggleDraw ) {
    image( roombapic, -radius,-radius);
  } 
  else {  
    noStroke();
    fill(45);
    ellipse(0, 0, radius, radius);
    fill(70);
    ellipse(0, 0, radius-3, radius-3);
    fill(160);
    rect(-radius+12,0, 15,4); 
    fill(100);
    rect(radius/2,0, 4,4); 
  }
}

void drawJoystick(float c, float d)
{
  int jposx0 = width-50, jposy0 = height/2; 
  int jposx1 = int(jposx0 + (d*30)), jposy1 = int(jposy0 - (c*30));
  fill(160);  noStroke();
  rect(jposx0,jposy0, 40,40);
  stroke(100); strokeWeight(4);   
  line( jposx0, jposy0, jposx1, jposy1 );  
  strokeWeight(8);
  line( jposx1, jposy1, jposx1, jposy1 );  
}

void drawStatus()
{ 
  textFont(fontA, 10);
  fill(160);  noStroke();
  rect(width-50,35, 90,60);
  
  fill(0); stroke(100); strokeWeight(5);
  
  text("cliff", width-63, 14);
  line(width-90,20,width-87,12);  // left
  line(width-80,12,width-70,12);  // left
  line(width-30,12,width-20,12);  // right
  line(width-10,20,width-13,12);  // left

  text("bump", width-60, 24);
  if( roombaComm.bumpLeft()  ) stroke(255,0,0); else stroke(100);
  line(width-80,25,width-70,22);  // left
  if( roombaComm.bumpRight() ) stroke(255,0,0); else stroke(100);
  line(width-30,22,width-20,25);  // right

  text("wheel", width-65, 44);  
  if( roombaComm.wheelDropLeft()  ) stroke(255,0,0); else stroke(100);
  line(width-80,42,width-70,42);  // left
  if( roombaComm.wheelDropRight() ) stroke(255,0,0); else stroke(100);
  line(width-30,42,width-20,42);  // right
  if( roombaComm.wheelDropCenter()) stroke(255,0,0); else stroke(100);
  line(width-52,32,width-48,32);  // caster

  text("dirt", width-60,54);
  int dirt = roombaComm.dirt();
  if( dirt > 200 ) stroke(0,0,dirt+50); else stroke(100);
  line(width-80,52,width-70,52); 
  line(width-30,52,width-20,52); 

  textFont(fontA, 12);
  text("sensors",       width-73,65 );
  text("status: demo demo demo",        10,12 );
        
  text("use arrow keys to drive",  10,height-38);
  text("space to stop, / to reset",10,height-28);
  text("comma toggles view",       10,height-18);
  text("sensor lights are random",     10,height-8);
  text("angle:"+int(angle*360/TWO_PI), width-90,height-18);
  text("speed:"+speed, width-90,height-8);
}

void draw() 
{ 
  //background(153);

  //drawGridlines();
  //drawStatus();
  //drawJoystick( c/max_speed, angle/TWO_PI );
      
  if( usemouse ) {
    angle = ((float)mouseX / width) * TWO_PI - PI;
    if( mousePressed ) {
      dx = -max_speed * cos(angle);
      dy = -max_speed * sin(angle);     
      xp = xp + dx;
      yp = yp + dy;
      println("angle: "+angle+"  x,y:"+xp+","+yp+" sin,cos:"+sin(angle)+","+cos(angle)+", dx,dy:"+dx+","+dy);
    }
  }
  else {
    if( keyPressed ) {
      if( key == CODED ) {
        if( keyCode == UP )
          c++;
        else if( keyCode == DOWN )
        
          c--;
        else if( keyCode == LEFT ) 
         angle -= delta_theta;
        else if( keyCode == RIGHT ) 
         angle += delta_theta;
      } else if( key == ' ' ) {
        c = 0;
      } else if( key == '/' ) {
        xp = width/2;
        yp = height/2;
      } else if( key == ',' ) {
        toggleDraw = !toggleDraw;
      }
      if( c>max_speed ) c=max_speed; if( c<-max_speed ) c=-max_speed;
      angle %= TWO_PI;
    }
    dx = -c * cos(angle);
    dy = -c * sin(angle);
    xp = xp + dx;
    yp = yp + dy;
    speed = c;  //sqrt(dx*dx + dy*dy);
  }

  // torroidial mapping, sir
  if( xp > width ) xp = 0; if( xp < 0 ) xp = width;
  if( yp > width ) yp = 0; if( yp < 0 ) yp = height;
  
  drawRoomba(xp,yp,angle);
  
}


class RoombaComm
{
  RoombaComm() {
    
  }
  
  boolean bumpLeft() {
    return ( xp < gridspacing || xp > width-gridspacing ); 
  }
  
  boolean bumpRight() {
    return ( yp < gridspacing || yp > height-gridspacing );
  }
  
  boolean wheelDropLeft() {
    return int(xp) % gridspacing == 0;
  }
  boolean wheelDropRight() {
    return int(yp) % gridspacing == 0;
  }
  boolean wheelDropCenter() {
    return int(yp%20)==0 && int(yp%20)==0;
  }
  int dirt() {
    return int(random(255));
  }
  
}


