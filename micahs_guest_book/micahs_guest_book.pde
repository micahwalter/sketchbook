import java.awt.*;

TextField textField = new TextField("type here", 16);
Twitter myTwitter;
Tweet t;

void setup() {
  myTwitter = new Twitter("username", "password");
  size(600,400);
  noLoop();
  add(textField);
 
}

void draw() {
   try {
     
     String msg = "@micahwalter Glad we could make it!" ;
    
     
        println(msg);
        Status status = myTwitter.updateStatus(msg);
    
    }
    catch (TwitterException te) {
      println("Couldn't connect: " + te);
  }
}

