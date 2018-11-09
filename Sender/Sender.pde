import controlP5.*; 
import java.util.Collections;
import processing.serial.*;
import geomerative.*;
import javax.swing.UIManager; 
import javax.swing.JFileChooser; 



// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
int[] points = new int[900*1250];
Serial myPort;
int ready=0;
boolean finished=false;
int init=0;
ControlP5 cp5; 
boolean fileLoaded;
int printing=0;

RadioButton r;

PImage img;
int step=1;
 int colorpix;
 float slider1 = 255;
float slider2 = 00;

void setup(){
    RG.init(this);
    img= loadImage("ex1.png");
   img.resize(int(img.width/(4*step)),int(img.height/(4*step)));
  img.filter(GRAY);
  img.filter(INVERT);
  // Initilaize the sketch
  size(int(900/2)+150, int(1250/2), JAVA2D); 
  frameRate(24);
 controlp5init();
 
  // Choice of colors


  // Enable smoothing


  //initserial();
}

void draw(){
  
  switch(printing) {
  case 0: 
    //println("Calculating");  // Does not execute
     // Clean frame
  background(230);
    //svg.draw();
  
  fill(100);
  rect(900/2,0,150,1250/2);
  // Set the origin to draw in the middle of the sketch

  text("Benjamin Poilvé, 2013, wwww.theelectricsquid.com",10,1250/2-10);

  
 
 
 
   for( int y=0; y<img.height; y=y+1){
    for( int x=0; x<img.width; x=x+1){
      
   colorpix =  int(red(img.get(x,y)));
    if(colorpix>int((slider1/8)*1+slider2)){
       point(4*step*x+2*step,4*step*y);
       
     }
     
     if(colorpix>int((slider1/8)*2+slider2)){
       point(4*x*step,4*y*step+2*step);
       
     }
       if(colorpix>int((slider1/8)*3+slider2)){
         point(4*x*step,4*y*step);
       
     }
       if(colorpix>int((slider1/8)*4+slider2)){
          point(4*x*step+2*step,4*y*step+2*step);
       
     }
       if(colorpix>int((slider1/8)*5+slider2)){
           point(4*x*step+3*step,4*y*step+1*step);
       
     }
       if(colorpix>int((slider1/8)*6+slider2)){
       point(4*x*step+1*step,4*y*step+3*step);
     }
       if(colorpix>int((slider1/8)*7+slider2)){
        point(4*x*step+1*step,4*y*step+1*step);
     }
       if(colorpix>int((slider1/8)*8+slider2)){
        point(4*x*step+3*step,4*y*step+3*step);
     }
    
    
    }
   }
    break;
    
    
    
  case 1: 
    println("Printing");  
    text("printing in progress",10,10);
    break;
  }

 
}
