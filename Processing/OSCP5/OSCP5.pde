import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;
int InPort=12000;
int OutPort=8000;
String OutIP="127.0.0.1";

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  //In Port
  oscP5 = new OscP5(this,InPort);
   //Out Port
  myRemoteLocation = new NetAddress(OutIP,OutPort);
}


void draw() {
  background(0);  
  
   if (keyPressed) {
    if (key == 's') {
        OscMessage myMessage = new OscMessage("/sendToUnity");
        myMessage.add("send content to Unity"); /* add an int to the osc message */
        /* send the message */
        oscP5.send(myMessage, myRemoteLocation); 
    }
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */

  //print(" addrpattern: "+theOscMessage.addrPattern());
  println(theOscMessage.get(0).stringValue());
  //theOscMessage.get(0).intValue();  
  //theOscMessage.get(0).floatValue()
  
}