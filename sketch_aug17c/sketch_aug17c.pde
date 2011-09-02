size(210, 200);
PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Serif-48.vlw"); 
textFont(font); 
for (int i = 0; i < 256 ; i++) {
  text(binary(i), 10, 100);
}
