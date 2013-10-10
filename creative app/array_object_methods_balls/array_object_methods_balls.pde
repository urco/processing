Ball[] balls = new Ball[1];
float gravity = 0.1;

void setup(){
  size(200,200);
  smooth();
  frameRate(25);
  balls[0] = new Ball (100,0,40);
}

void draw(){
  background(100);
  // Update and display all balls
for (int i =0;i<balls.length;i++){
  balls[i].gravity();
  balls[i].move();
  balls[i].display();
  }  
}

/*void mousePressed(){
  //a new ball object
Ball b= new Ball(mouseX,mouseY,10);
//Append to array
balls= (Ball[]) append (balls,b);
}*/

void mouseReleased(){
  //a new ball object
Ball b= new Ball(mouseX,mouseY,40);
//Append to array
balls= (Ball[]) append (balls,b);
}

class Ball {
  float x;
  float y;
  float speed;
  float w;

  Ball (float tempX, float tempY, float tempW){
    x=tempX;
    y=tempY;
    w=tempW;
    speed=0;
  }

void gravity(){
  //add gravity to speed
  speed=speed+gravity;
}  


void move(){
  y=y+speed;
  //if square reaches the bottom
  //Reverse speed
  if (y > height){
    speed = speed * -0.95;
    y=height;
  }
}  


void display(){
  //display the circle
  fill(255);
  noStroke();
  ellipse(x,y,w,w);
  }
 }
