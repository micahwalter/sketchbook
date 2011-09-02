PImage cam;

void setup() {
size(400,400);
fill(0);
stroke(255);

cam=loadImage("http://207.251.86.248/cctv5.jpg");


}

void draw() {
image(cam , 0,0);
beginShape();
// outer shape

vertex(0,0);
vertex(400,0);
vertex(400,400);
vertex(0,400);
vertex(0,0);  

breakShape();
//cutout

vertex(mouseX,mouseY);
vertex(mouseX+50,mouseY);
vertex(mouseX+50,mouseY+50);
vertex(mouseX,mouseY+50);
endShape(CLOSE); 
}
