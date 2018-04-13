 ArrayList<Particle> particles;

 Particle p;

 // "stardrawing" refers to removing welcoming page ----
   boolean startdrawing;
  
 // "keys" - size, postition, motion functions ----
   boolean [] keys;
 
 // "colours" - colour change function ----
   boolean [] colours;

 // Welcome image ----
   PImage img;

 // Activation text colour variables ----
   float G1 = 255; 
   float B1 = 255;
   float G2 = 255; 
   float B2 = 255;
   float G3 = 255; 
   float B3 = 255;
   float G4 = 255; 
   float B4 = 255;
   float G5 = 255; 
   float B5 = 255;
   float G6 = 255; 
   float B6 = 255;
   float G7 = 255; 
   float B7 = 255;
   float G8 = 255; 
   float B8 = 255;

 // setup ----
   void setup(){
     img = loadImage("cover.jpg");
     welcome();
     background(0);
     size(900,660);
     smooth();

     particles = new ArrayList<Particle>();
  
     // "keys" - size, postition, motion functions ----
       keys=new boolean[7];
       keys[0]=false;
       keys[1]=false;
       keys[2]=false;
       keys[3]=false; 
       keys[4]=false; 
       keys[5]=false;
     
     // "colours" - colour change function ----
       colours=new boolean[3];
       colours[0]=false;
       colours[1]=false;
       colours[2]=false;
    }
    
  // Welcome text message-----
    void welcome(){
      image(img, 0, 0, width, height);
      startdrawing=true;
  
      String s0 = "Welcome to Interactive Stars Particles! Press 'Spacebar' to start";
      fill (0);
      textSize (24);
      text (s0, 50, (height/2), 451, 100);
      frameRate(100);
    }  

  // draw ---- 
   void draw(){   
     if (startdrawing){
       welcome();
     }
     else{ 
       background(0);
       
       // Basic Instructions Text ---
         String s1 = "INSTRUCTION ";
         fill (255);
         textSize (10);
         text (s1, (width - 250), 50, 200, 300);
   
         String s2 = "Click and drag mouse to draw";
         fill (255);
         textSize (10);
         text (s2, (width - 250), 70, 200, 300);
   
         String s3 = "Delete key to clear sketch";
         fill (255);
         textSize (10);
         text (s3, (width - 250), 85, 200, 300); 
   
         String s4 = "Press to activate/disativate functions: ";
         fill (255);
         textSize (10);
         text (s4, (width - 250), 110, 200, 300);
   
         String s5 = "m: multiple stroke colours ";
           if (colours[0]) {
             G1 = 0;
             B1 = 0;
           }
           else {
             G1 = 255;
             B1 = 255;
           }   
         fill (255,G1,B1);
         textSize (10);
         text (s5, (width - 250), 125, 200, 300); 
   
         String s6 = "M: multiple fill colours ";
           if (colours[1]) {
             G2 = 0;
             B2 = 0; 
           }
           else {
             G2 = 255;
             B2 = 255;
           }   
         fill (255,G2,B2);
         textSize (10);
         text (s6, (width - 250), 140, 200, 300);
         
         String s7 = "d: default colour setting ";
         fill (255);
         textSize (10);
         text (s7, (width - 250), 155, 200, 300);     
        
         String s8 = "1: increase size";
           if (keys[0]) {
             G3 = 0;
             B3 = 0;
           }
           else {
             G3 = 255;
             B3 = 255;
           }   
         fill (255,G3,B3);
         textSize (10);
         text (s8, (width - 250), 173, 200, 300);
         
         String s9 = " 2: decrease size";
           if (keys[1]) {
             G4 = 0;
             B4 = 0;
           }
           else {
             G4 = 255;
             B4 = 255;
           }   
         fill (255,G4,B4);
         textSize (10);
         text (s9, (width - 150), 173, 200, 300);
         
         String s10 = "3: vibrate";
           if (keys[2]) {
             G5 = 0;
             B5 = 0;
           }
           else {
             G5 = 255;
             B5 = 255;
           }   
         fill (255,G5,B5);
         textSize (10);
         text (s10, (width - 250), 188, 200, 300);
         
         String s11 = "4: pulsing effect ";
           if (keys[3]) {
             G6 = 0;
             B6 = 0;
           }
           else {
             G6 = 255;
             B6 = 255;
           }   
         fill (255,G6,B6);
         textSize (10);
         text (s11, (width - 147), 188, 200, 300);
         
         String s12 = "5: fade and redraw";
           if (keys[4]) {
             G7 = 0;
             B7 = 0;
           }
           else {
             G7 = 255;
             B7 = 255;
           }   
         fill (255,G7,B7);
         textSize (10);
         text (s12, (width - 250), 203, 200, 300);
         
         String s13 = "6: bouncing";
           if (keys[5]) {
             G8 = 0;
             B8 = 0;
           }
           else {
             G8 = 255;
             B8 = 255;
           }    
         fill (255,G8,B8);
         textSize (10);
         text (s13, (width - 147), 203, 200, 300);    
           }
    
       // update and draw particles
         for(int i = 0; i < particles.size();i++ ){

           Particle p = particles.get(i);
           p.update1();
           p.drawParticle();
           
           //"keys" - size, postition, motion functions ----     
           // increaseSize - Press "1" ----
             if (keys[0]){
               p.increaseSize();
             } 
           // increaseSize - Press "2" ----
             if (keys[1]){
               p.decreaseSize();
             } 
           // Star vibrates - Press "3" ----
             if (keys[2]){
               p.setSpeed(random(-5.0,5.0),random(-5.0,5.0));
               p.vibrate();
             }   
           // pulsingStars - Press "4" ---- 
             if (keys[3]){
               p.pulsingStars ();
             }
           // Star reDraw - Press "5" ---- 
             if (keys[4]){
               p.reDraw ();
             }
           // Star bouncing - Press "6" ---- 
             if (keys[5]){
               p.bouncing ();
             }    
             
           // "colours" - colour change function ----      
           // multipleStrokeColours - Press "m" ---- 
             if (colours[0]){
               p.multipleStrokeColours (); 
             } 
           // mutilpleFillColours - Press "M" ----
             if (colours[1]){
               p.multipleFillColours ();      
             }
           // defaultColour - Press "d" ----             
             if (colours[2]){
               p.defaultColour ();
             } 
         }
      }

  // mouseDragged: Adding stars ---- 
    void mouseDragged(){
      p = new Particle();
      p.setPosition(mouseX,mouseY);
      particles.add(p);    
    }
 
  // keyPressed: Activate and disactivate functions ---- 
    void keyPressed(){
      if (keyCode == 32) {
        startdrawing=false;
      }
      if(key == DELETE){
        particles.clear();
      }  
      
      // booleanKeys -----
      if (key == '1'){
        keys[0]=!keys[0];
      }
      if (key == '2'){
        keys[1]=!keys[1];
      }
      if (key == '3'){
        keys[2]=!keys[2];
      }
      if (key == '4'){
        keys[3]=!keys[3];
      }
      if (key == '5'){
        keys[4]=!keys[4];
      }
      if (key == '6'){
        keys[5]=!keys[5];
      }

      //booleanColours ----
      if (key == 'm'){
        colours[0]=!colours[0];
        colours [2] =false;
      }
      if (key == 'M'){
        colours[1]=!colours[1];
        colours [2] = false;
      }
      if (key == 'd'){
        colours[2]= true;
        colours [0] = false;
        colours [1] = false;
      }
    }
