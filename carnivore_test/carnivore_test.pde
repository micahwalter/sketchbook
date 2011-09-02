// A Simple Carnivore Client -- print packets in Processing console
//
// Note: requires Carnivore Library for Processing v2.2.2 (http://r-s-g.org/carnivore)
//
// + Windows:  first install winpcap (http://winpcap.org)
// + Mac:      first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf*
//             (must be done each time you reboot your mac)

import org.rsg.carnivore.*;
import org.rsg.lib.Log;

void setup(){
  size(600, 400);
  background(255);
  Log.setDebug(true); // Uncomment for verbose mode
  CarnivoreP5 c = new CarnivoreP5(this); 
  //c.setVolumeLimit(4); //limit the output volume (optional)
  //c.setShouldSkipUDP(true); //tcp packets only (optional)
  
  PFont font;
  font = loadFont("Courier-48.vlw"); 
  textFont(font);
  fill(0); 
}

void draw(){}

// Called each time a new packet arrives
void packetEvent(CarnivorePacket p){
  
  println("(" + p.strTransportProtocol + " packet) " + p.senderSocket() + " > " + p.receiverSocket());
  //println("Payload: " + p.ascii());
  //println("---------------------------\n");
}
