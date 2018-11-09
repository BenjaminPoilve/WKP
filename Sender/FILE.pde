void LOAD_FILE(float theValue) {  
  println(":::LOAD SVG FILE:::");
  selectInput("Select a svg file to open:", "fileSelected");
} //End Load File

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    String loadPath =selection.getAbsolutePath();
   
    println("Loaded file: " + loadPath); 


    String[] p = splitTokens(loadPath, ".");
    boolean fileOK = false;

    if ( p[p.length - 1].equals("png")|| p[p.length - 1].equals("jpg"))
      fileOK = true;

    println("File OK: " + fileOK); 

    if (fileOK) {
     
      img = loadImage(loadPath);
      fileLoaded = true;
      img.resize(int(img.width/(4*step)),int(img.height/(4*step)));
  img.filter(GRAY);
  img.filter(INVERT);
 
    }
    else {
      // Can't load file
      println("ERROR: BAD FILE TYPE");

    } 
  }
}


