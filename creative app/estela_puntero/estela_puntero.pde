Point point;

void setup() {
  size (200,200);
  smooth ();
  point = new Point();
} 
 
 void draw(){
   background(255);
   point.collectPos(); 
   
 }

