
class Ball{
  float r; //radius
  float x,y; //location
  float xspeed,yspeed; //speed
  color c= color(100,50);
  
  //constructor
  Ball(float tempR){
    r=tempR;
    x=random(width);
    y=random(height);
    xspeed=random(-5,10);
    yspeed=random(-5,5);
  }

void move(){
  x +=xspeed; //increment x
  y +=yspeed;//increment y
  
  //check horizontal edges
if (x> width || x<0){
    xspeed *= -1;  
  }
//check vertical edges
if (y > height || y < 0){
yspeed *= -1;
  }
}
void highlight(){
c=color(255, 204, 0);
}

//draw the ball
void display(){
  stroke(255);
  fill(100,50);
  ellipse(x,y,r*2,r*2);
  c=color(100,50);
 }

boolean intersect(Ball b){
  b=new Ball(100);
  float distance=dist(x,y,b.x,b.y);
  if (distance < r + b.r){
  return true;
  }else{
    return false;
  } 
 }
}



