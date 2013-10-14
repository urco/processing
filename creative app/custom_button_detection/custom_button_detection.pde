//Perlin noise with a circle and smooth transition

float time=0.0;
float increment=0.01;
Circle circulo;
float angle;


void setup(){
  size(200,200);
  smooth();
  noStroke();
  colorMode(HSB);  
}//func

void draw(){
  background(255);
  
  float n=noise(time)*width/3;
  
  //with each clycle, increment the "time"
  time+=increment;  
  angle+=0.09;
  circulo=new Circle(n,angle);//Draw the ellipse withe size determined by Perlin noise
  
  if (circulo.overCircle(mouseX,mouseY)){
  circulo.changeColor();
  }else{
  circulo.display();
  }  
}//func


class Circle{
  
  float radio=0.0;
  float x=0;   
  float y=0;
  float angle=0;
   
  Circle(float tempRadio,float tempAngle){
    radio=tempRadio;
    angle=tempAngle;
    x=width/2;
    y=height/2;
 }
  
  boolean overCircle(float tempX,float tempY){ 
   
    float pos_mouseX=tempX;
    float pos_mouseY=tempY;
    float xBound=x+radio;
    float yBound=y+radio;
    
    //The mouseOver detection is not working fine
    if (pos_mouseX>x && pos_mouseX<xBound && pos_mouseY>y && pos_mouseY<yBound){
    println("coincide"+ pos_mouseX); 
    return true;     
   }
    println("no coincide"+ pos_mouseY);
    return false;
    
 }
 
  void changeColor(){
    
    fill(sin(angle),255,255);  
    ellipse(x,y,radio*3,radio*3);
    
  }
  
  void display() {
  fill(130,255,255);  
  ellipse(x,y,radio*3,radio*3);
  }

}//class


