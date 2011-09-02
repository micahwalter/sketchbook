Twitter myTwitter;
Tweet t;

PImage cam1;
PImage cam2;
PImage cam3;
PImage cam4;
PImage cam5;
PImage cam6;
PImage cam7;
PImage cam8;
PImage cam9;
PImage cam10;
PImage cam11;
PImage cam12;
PImage cam13;
PImage cam14;
PImage cam15;
PImage cam16;
PImage cam17;
PImage cam18;
PImage cam19;
PImage cam20;

int offset = 0;
int timer;
int timelength = 5000;

void setup() {
  
  size(1750,960);
  frameRate(60);
  PFont font;
  font = loadFont("AmericanTypewriter-Light-12.vlw"); 
  textFont(font);
  fill(255); 
  myTwitter = new Twitter("username", "password");
  
  cam1=loadImage("http://207.251.86.248/cctv1.jpg");
  cam2=loadImage("http://207.251.86.248/cctv2.jpg");
  cam3=loadImage("http://207.251.86.248/cctv3.jpg");
  cam4=loadImage("http://207.251.86.248/cctv4.jpg");
  cam5=loadImage("http://207.251.86.248/cctv5.jpg");
  cam6=loadImage("http://207.251.86.248/cctv6.jpg"); 
  cam7=loadImage("http://207.251.86.248/cctv7.jpg"); 
  cam8=loadImage("http://207.251.86.248/cctv8.jpg");
  cam9=loadImage("http://207.251.86.248/cctv9.jpg");
  cam10=loadImage("http://207.251.86.248/cctv10.jpg");
  cam11=loadImage("http://207.251.86.248/cctv11.jpg");
  cam12=loadImage("http://207.251.86.248/cctv12.jpg");
  cam13=loadImage("http://207.251.86.248/cctv13.jpg");
  cam14=loadImage("http://207.251.86.248/cctv14.jpg");
  cam15=loadImage("http://207.251.86.248/cctv15.jpg");
  cam16=loadImage("http://207.251.86.248/cctv16.jpg");
  cam17=loadImage("http://207.251.86.248/cctv17.jpg");
  cam18=loadImage("http://207.251.86.248/cctv18.jpg");
  cam19=loadImage("http://207.251.86.248/cctv19.jpg");
  cam20=loadImage("http://207.251.86.248/cctv20.jpg");
  
   timer = millis();
 

}

void draw() {
  background(0);
  offset = mouseX;
  image(cam1 , 0+offset,0);
   image(cam2 , 350+offset, 0);
    image(cam3 , 700+offset,0);
     image(cam4 , 1050+offset, 0);
     image(cam5 , 1400+offset, 0);
     image(cam6 , 0+offset,240);
     image(cam7 , 350+offset, 240);
      image(cam8 , 700+offset,240);
       image(cam9 , 1050+offset, 240);
       image(cam10 , 1400+offset, 240);
        image(cam11 , 0+offset,480);
        image(cam12 , 350+offset, 480);
         image(cam13 , 700+offset,480);
         image(cam14 , 1050+offset, 480);
         image(cam15 , 1400+offset, 480);
         image(cam16 , 0+offset,720);
         image(cam17 , 350+offset, 720);
          image(cam18 , 700+offset,720);
          image(cam19 , 1050+offset, 720);
          image(cam20 , 1400+offset, 720);
  if (millis() - timer > timelength){
      timer = millis();
  cam1=loadImage("http://207.251.86.248/cctv1.jpg");
  cam2=loadImage("http://207.251.86.248/cctv2.jpg");
  cam3=loadImage("http://207.251.86.248/cctv3.jpg");
  cam4=loadImage("http://207.251.86.248/cctv4.jpg");
  cam5=loadImage("http://207.251.86.248/cctv5.jpg");
  cam6=loadImage("http://207.251.86.248/cctv6.jpg"); 
  cam7=loadImage("http://207.251.86.248/cctv7.jpg"); 
  cam8=loadImage("http://207.251.86.248/cctv8.jpg");
  cam9=loadImage("http://207.251.86.248/cctv9.jpg");
  cam10=loadImage("http://207.251.86.248/cctv10.jpg");
  cam11=loadImage("http://207.251.86.248/cctv11.jpg");
  cam12=loadImage("http://207.251.86.248/cctv12.jpg");
  cam13=loadImage("http://207.251.86.248/cctv13.jpg");
  cam14=loadImage("http://207.251.86.248/cctv14.jpg");
  cam15=loadImage("http://207.251.86.248/cctv15.jpg");
  cam16=loadImage("http://207.251.86.248/cctv16.jpg");
  cam17=loadImage("http://207.251.86.248/cctv17.jpg");
  cam18=loadImage("http://207.251.86.248/cctv18.jpg");
  cam19=loadImage("http://207.251.86.248/cctv19.jpg");
  cam20=loadImage("http://207.251.86.248/cctv20.jpg");
  
  }

 // printTweets();
 
} 

void printTweets() {

  try {

    Query query = new Query("traffic");
    query.setRpp(20);
    QueryResult result = myTwitter.search(query);

    ArrayList tweets = (ArrayList) result.getTweets();
    int tweetnumber = 0;
    for (int i = 0; i < 5; i++) {
      for ( int j = 0; j < 4; j++) {
        t = (Tweet) tweets.get(tweetnumber);
        tweetnumber++;
        String msg = t.getText();
        String[] hasURL = match(msg, "http://"); 
        if (hasURL == null) {
          fill(0 , 80);
          noStroke(); 
          rect(15+i*350, 15+j*240, 305, 65);
          fill(255);
          text(msg , 20+i*350, 20+j*240, 300, 60);
        }
        else {
          text("" ,20+i*350,20+j*240, 300 , 60);
        }
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };

}

