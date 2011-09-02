Camera myCam;
PFont font;
Twitter myTwitter;
Tweet t;
int timer;
int timelength = 1000;
String msg = "";

void setup() {
  size(800,600);
  frameRate(60);
  background(0);
  
  myCam = new Camera("http://207.251.86.248/cctv12.jpg");
  font = loadFont("Courier-48.vlw");
  textFont(font);
  myTwitter = new Twitter("username", "password");
  
  timer = millis();
   myCam.display();
}

void draw() {
  noFill();
  
  image(myCam.cam, 0, 0, 800, 600);
  ellipse(mouseX, mouseY, 50, 50);
  
  if (millis() - timer > timelength){
      timer = millis();
      myCam.display();
  }
  
  text(msg , 20, 80, 780, 420);
  
}

void keyPressed() {
 // this statement dissables the escape key
 if (key == KeyEvent.VK_ESCAPE) key = 0; 
}


class Camera {
 String url;
 PImage cam;
 
 Camera( String aURL ) {
  url = aURL;
 }
 
 void display() {
   cam=loadImage(url);
   image(cam, 0,0, 800, 600);
 }
  
}

void printTweets() {
   try {

    Query query = new Query("stalker");
    query.setRpp(20);
    QueryResult result = myTwitter.search(query);

    ArrayList tweets = (ArrayList) result.getTweets();
    
    t = (Tweet) tweets.get(0);
    msg = t.getText();
    
   }
   catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}
