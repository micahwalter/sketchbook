Twitter myTwitter;
Tweet t;

void setup() {
  myTwitter = new Twitter("username", "password");
  frameRate(1);
 
}

void draw() {
   try {
     
     String msg = hour() + ":" + minute() + ":" + second() + " Tweet and ReTweet were sitting on a fence. Tweet jumped off. Who was left?" ;
    
     if ((second() == 30 ) || (second() == 0 )) {
        println(msg);
        Status status = myTwitter.updateStatus(msg);
     }
    }
    catch (TwitterException te) {
      println("Couldn't connect: " + te);
  }
}

