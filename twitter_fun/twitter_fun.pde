
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Tweet;
import twitter4j.Twitter;
import twitter4j.TwitterException;

Twitter twitter;
int friendCount;
User[] friends;

twitter = new Twitter("username","password");
println("declared the object");

try { 
  friendCount = twitter.getFriends().size();
  println(friendCount);
  friends = new User[friendCount];
  
 for (int i = 0; i < friendCount; i++) { 
    friends[i] = (User)twitter.getFriends().get(i);
    println(friends[i]);
   println("\n"); 
  }
} 
catch (TwitterException e) {
  println(e.getStatusCode());
}
