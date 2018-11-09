
void initserial(){
  
  // List all the available serial ports:
  println(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[4], 9600);
  
  while ( init ==0) {
    if( myPort.available()>0){
    char ch = myPort.readChar();
    println(ch);
     if (ch== 'R'){
      myPort.write(1+"N"+1+"E");
     
       init=1      ;}
    }
  } 
  
  myPort.bufferUntil('R'); 
  println("ready to roll!");
  ready=1;
}


void resetserial(){
  myPort.clear();

  myPort.stop();
  
  initserial(); }
      
      
      
      
void serialEvent(Serial p) {
  ready=1;
}

      
      
public void Reset() {
 resetserial();
}

