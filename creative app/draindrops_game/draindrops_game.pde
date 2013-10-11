Catcher catcher;
//Ball ball;
Ball[] balls=new Ball[3];//se declara un vector que almacenara objetos de tipo Ball
//ball=new Ball(20);

void setup(){
  size(200,200);
  smooth();
  for(int i=0;i<balls.length-1;i++){
    balls[i]=new Ball(random(10,50)); //se inicializa el vector con 3 objetos de tipo Ball
  }
}

void draw(){
  background(255);
  stroke(0);
  fill(175);
  ellipse(mouseX,mouseY,64,64);
  for(int i=0;i<balls.length-1;i++){
  balls[i].move();
  if (balls[i].intersect(balls[i+1])){
  balls[i].highlight();
   }
  balls[i].display();  
 }

}


class Catcher{
 float r; //radius
 float x,y; //location
  
  Catcher(float tempR){
    r=tempR;
    x=0;
    y=0;
 }

void setLocation(float tempX, float tempY){
  x=tempX;
  y=tempY;
}

void display(){
  stroke(0);
  fill(175);
  ellipse(x,y,r*2,r*2);
  }

}
