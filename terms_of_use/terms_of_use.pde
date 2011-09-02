HashMap words;  // HashMap object

String[] tokens;  // Array of all words from input file
int counter;

PFont f;

void setup() {
  size(700, 500);
  words = new HashMap();
 frameRate(60);
  // Load file and chop it up
  String[] lines = loadStrings("http://www.micahwalter.com/processing/terms_of_use/data/foia.txt");
  String allText = join(lines, " ");
  tokens = splitTokens(allText, " ,.?!:;[]-");
  f = createFont("HelveticaNeue", 48, true); 
  
}

void draw() {
 background(0);
  fill(255);
  
  // Look at words one at a time
  String s = tokens[counter];
  counter = (counter + 1) % tokens.length;

  // Is the word in the HashMap
  if (words.containsKey(s)) {
    // Get the word object and increase the count
    // We access objects from a HashMap via its key, the String
    Word w = (Word) words.get(s);
    w.count(); 
  } else {
    // Otherwise make a new word
    Word w = new Word(s);
    // And add to the HashMap
    // put() takes two arguments, "key" and "value"
    // The key for us is the String and the value is the Word object
    words.put(s, w);    
  }

  // Make an iterator to look at all the things in the HashMap
  Iterator i = words.values().iterator();

  // x and y will be used to locate each word
  float x = 0;
  float y = 60;

  while (i.hasNext()) {
    // Look at each word
    Word w = (Word) i.next();
    
    // Only display words that appear 3 times
    if (w.count > 3) {
      // The size is the count
      int fsize = constrain(w.count, 0, 100);
      textFont(f, fsize);
      fill(fsize+60);
      text(w.word, random(width), random(height));
      // Move along the x-axis
      //x += textWidth(w.word + " ");
    }
    
    // If x gets to the end, move Y
    if (x > width) {
      //x = 0;
      y += 60;
      // If y gets to the end, we're done
      if (y > height) {
        break; 
      }
    }
  } 
}



class Word {
  
  int count;
  String word;
  
  Word(String s) {
    word = s;
    count = 1;
  }
  
  void count() {
    count++;
  }

}  
