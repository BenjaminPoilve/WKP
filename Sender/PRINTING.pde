void PRINTING(){
   printing=1;
  float pagelength=900.0;
  float pagewidth=1250.0;
 float proportionx=1.0;
 float proportiony=0.61;

    ArrayList[] linesarray = new ArrayList[int(pagelength)];
    
    for(int j = 0;j< int(pagelength);j++){
   linesarray[j] = new ArrayList();
   }


   
      println("printing File (SVG)");
     // sort(particles);
      println(points.length);
      for ( int i = 0; i < points.length; i++) {
         println(i+" ");
         print(points[2*i]);  //y
         println(points[2*i+1]);  //x
        linesarray[int(points[2*i]*proportiony)].add(int(points[2*i+1]*proportionx));  
       
      }
    
   for(int j = 0;j<int(pagelength);j++){
   Collections.sort(linesarray[j]);
   print(j);
   println(linesarray[j]);
   }
   
   
   
   int n=0;
  while(n<pagelength){
    if(ready==1){
      ready=0;
      println("Nextline"+n);
      if(linesarray[n].isEmpty()){
        myPort.write("E") ; }
      else{
        for(int c=0; c<linesarray[n].size();c++){
          
          myPort.write(linesarray[n].get(c)+"N") ; 
          
          
        }
       myPort.write("E") ;       
      }
    n=n+1;
    }   
  } 
     printing=0;
}
