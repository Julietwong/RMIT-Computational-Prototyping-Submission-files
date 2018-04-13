
 class Particle {
  
  float x;
  float y;
  int x1;
  int y1;
  
  int speed_index = 0;
  float speedx;
  float speedy;

  int rotOne = 0;  
  int fade = 0;

  PShape star;
  float square = 0.5;
  
  
  float r = 255;
  float g = 255;
  float b = 255;
  float o =255;
  float r2 = 255;
  float g2 = 255;
  float b2 = 255;
  float o2 = 0;
  color strokeColour = color (r,g,b,o); 
  color fillColour = color (r2,g2,b2,o2);
  
  Particle() {
    speedx = random(-5.0, 5.0);
    speedy = random(1.0, 5.0);  
  }
  
  // Star construction ----
    void drawParticle(){
      star = createShape ();
      star.beginShape();
      strokeColour = color (r,g,b,o);
      fillColour = color (r2,g2,b2,o2);    
      star.fill(fillColour);
      star.stroke(strokeColour);
      star.vertex ((x1+ 1*square), (y1- 14*square));
      star.vertex ((x1+ 5*square), (y1- 4*square)); 
      star.vertex ((x1+ 14*square), (y1- 4*square)); 
      star.vertex ((x1+ 6*square), (y1+ 1*square));  
      star.vertex ((x1+ 10*square), (y1+ 11*square)); 
      star.vertex (x1, (y1 + 5*square)); 
      star.vertex ((x1- 10*square), (y1+ 11*square));   
      star.vertex ((x1 -6*square), (y1+ 1*square));   
      star.vertex ((x1- 15*square), (y1- 4*square));   
      star.vertex ((x1- 4*square), (y1- 4*square));   
      star.endShape(CLOSE);  
      shape(star, x,y);
    }
    
  // booleanKeys function ----    
    void setPosition(int _x, int _y){
      x = _x;
      y = _y;
    }
  
    void setSpeed(float _x, float _y){
      speedx = _x;
      speedy = _y;
    }
  
    void increaseSize(){
    square = (square + 0.05);
    }
  
    void decreaseSize(){
    square = (square - 0.05);
    }  
  
    void pulsingStars () {
    square = (frameCount*6) % 5;
    } 
    
  
    void vibrate(){
      x = x + speedx;
      y = y + speedy;
    }
  
    void update1(){
      fade++;
    }  
  
    void reDraw(){
      o = (int) fade%255;
      o2 = (int) fade%255;    
    }  
  
    void bouncing(){    
      x += speedx;
      y += speedy;    
      if ((x + square) <= 0 || x >= width) {
        speedx *= -1;
      }
      if ((y + square) <= 0 || y >= height){
        speedy *= -1;
      }
    }  
  
  // booleanColours function ----
    void defaultColour() {
      r= 255;
      g = 255;
      b = 255;
      r2 = 255;
      g2 = 255;
      b2 = 255;
      o2 = 0; 
      fillColour = color(255,255,255,0);
    }
  
    void multipleStrokeColours(){
      r = random (255);
      g = random (255);
      b = random (255);
      strokeColour = color (r,g,b); 
    }

    void multipleFillColours(){
      r2 = random (255);
      g2 = random (255);
      b2 = random (255);
      o2 = random (255);
      fillColour = color (r2,g2,b2,o2); 
    }
  }
