
 class circleMask{

  PGraphics photo;
  PGraphics mask;
  float radius;
  PImage image;
  float x;
  float y;
  
 circleMask (float TempRadius,PImage TempImage,float tempX,float tempY){
   //photo=TempPhoto;
   radius=TempRadius;    
   image=TempImage;
   x=tempX;
   y=tempY;   
   
   mask=createGraphics(width,height,JAVA2D);    
   photo=createGraphics(width,height,JAVA2D);
   photo.beginDraw();
   photo.image(image,x-40,y-40);
   photo.endDraw();    
  }

  void display(){
  mask.beginDraw(); 
  mask.background(0);
  mask.fill(255);
  mask.noStroke();
  mask.ellipse(x,y,radius,radius);  
  mask.endDraw();  
  PImage maskedResult=photo.get();
  maskedResult.mask(mask);
  image(maskedResult,x,y);    
  }

}
