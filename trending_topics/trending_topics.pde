
PFont font;
Twitter myTwitter;
Tweet t;
int timer;
int timelength = 30000;
String msg = "";

void setup() {
 
  size(800,600);
  frameRate(60);
  background(0);
  noCursor();
  
  font = loadFont("Courier-48.vlw");
  textFont(font);
  myTwitter = new Twitter("username", "password");
  
  timer = millis();
   printTweets();
}

void draw() {
  noFill();
  
  if (millis() - timer > timelength){
      timer = millis();
      background(0);
      printTweets();
  }
  
  text(msg , 20, 200, 780, 400);
  
}


void printTweets() {
   try {

    Trends trends = myTwitter.getTrends(); 
    String trendsArr[] = new String[trends.getTrends().length];
      for (int i = 0; i < trends.getTrends().length; i++) {
          trendsArr[i] = trends.getTrends()[i].getName();
      } 
    
    
    
    Query query = new Query(trendsArr[0]);
    query.setRpp(20);
    QueryResult result = myTwitter.search(query);

    ArrayList tweets = (ArrayList) result.getTweets();
    
    t = (Tweet) tweets.get(0);
    msg = t.getText();
   // msg = msg.replace("#" , "");
   // msg = msg.replace("RT" , "");
   // msg = msg.replace("@" , "_");
   // msg = msg.replace("Twitter" , "The Machine");
   // msg = msg.replace("twitter" , "The Machine");
    
    msg = replaceCharacters(msg);
    
    String[] hasURL = match(msg, "http://");
    if ( hasURL != null )
      msg = "You haven't bought anything in a while";
    
   }
   catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}


String replaceCharacters(String text) {
    
  text = text.replace("&lt;" , "<");
  text = text.replace("&gt;" , ">");
  text = text.replace("&amp;" , "&");
  text = text.replace("&quot;" , "\"");
  
  return text;
  
}

String replaceUserName(String text) {
  
  
  
  return text;
  
}
