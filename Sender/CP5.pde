void controlp5init(){
  
  
   cp5 = new ControlP5(this);

 

  

  cp5.addSlider("slider1", 0, 300, slider1, 900/2+30, 60, 20, 500); 
 cp5.addSlider("slider2",-20, 20, slider2, 900/2+90, 81, 20, 479);  
 r = cp5.addRadioButton("radioButton")
         .setPosition(900/2+90,60)
         .setSize(20,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
      
         .addItem("ON",1)
        
         ;

 
  Button LoadButton = cp5.addButton("LOAD_FILE", 900/2+2, 900/2+2, 2, 146, 40);
  LoadButton.setCaptionLabel("LOAD IMAGE FILE (.SVG)");
  Button PrintButton = cp5.addButton("PRINTING", 900/2+2,900/2+2, 1250/2-42, 146, 40);
  PrintButton.setCaptionLabel("PRINT FILE");
}



void radioButton(int a) {
  println("a radio Button event: "+a);
  
}

