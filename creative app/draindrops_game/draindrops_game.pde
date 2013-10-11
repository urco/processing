Catcher catcher;
//Ball ball;
//Ball[] balls=new Ball[3];//se declara un vector que almacenara objetos de tipo Ball
//ball=new Ball(20);
Drop[] drops=new Drop[1000];
Tiempo timer;

int totalDrops=0;

void setup(){
  size(400,400);
  smooth();
  background(0);
  timer=new Timer(5000);
  timer.start();
}


void draw(){
 if (timer.isFinished()){ //comprueba si han transcurrido los 5 milisegundos
    background(random(255));
    timer.start(); //establece una nueva marca temporal para recalcular de nuevo el tiempo transcurrido
  }
  //inicializa(crea) una gota en la primera posición del array
  drops[totalDrops]=new Drop();
  totalDrops++;
  //si nosotros llegamos al final del array
  if (totalDrops>=drops.length){
    totalDrops = 0;   
 }
 //mueve y dibuja las gotas
 for (int i=0;i<totalDrops;i++) {
   drops[i].move();
   drops[i].display();
 }  
  stroke(0);
  fill(175);
  ellipse(mouseX,mouseY,64,64);
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


