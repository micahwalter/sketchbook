Twitter myTwitter;
Tweet t;

void setup() {
  myTwitter = new Twitter("username", "password");
  size(1300 , 900);
  PFont font;
  font = loadFont("Serif-16.vlw"); 
  textFont(font);
  fill(0); 
  frameRate(0.0333);
};

void draw() {
   background(255);
   try {

    Query query = new Query("brb");
    query.setRpp(20);
    QueryResult result = myTwitter.search(query);

    ArrayList tweets = (ArrayList) result.getTweets();

    for (int i = 0; i < tweets.size(); i++) {
      t = (Tweet) tweets.get(i);
      String msg = t.getText();
      String[] hasURL = match(msg, "http://");
      if (hasURL == null) {
        text(msg , 10, 50+i*40);
      }
      else {
        text("" , 10, 50+i*40);
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
};
