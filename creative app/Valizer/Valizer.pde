/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/9405*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
 * V-a-lizer
 * by Matt Katz
 * after I saw this http://youthoughtwewouldntnotice.com/blog3/?p=1963
 * I wanted to do it.
 */


PImage source;
PImage table;
PImage maskImg;
boolean render;
boolean showOriginal;
int bands;
int bandLength;
int bandSpace;
int bandSourceDist;
float bandSlope;
ScrollPanel panel;

void setup(){
  size(403,603);
  source = loadImage("janice3.jpg");
  //comment out the previous size and uncomment this
  //if you are playing with various photos in 
  //processing ide
  //size(source.width, source.height);
  //print(source.width);
  //print (source.height);
  background(source);
  smooth();
  render = true;
  showOriginal = true;
  bands = 12;
  bandLength = 60;
  bandSpace = 8;
  bandSourceDist = 50;
  panel = new ScrollPanel(4);
  //panel.addBar("bands", 0,20,width,10,16,width);
  panel.addIBar("Bands", 12);
  panel.addIBar("Length",100);
  panel.addIBar("Space", 16);
  panel.addIBar("Offset",100);
  panel.addBBar("Slope",10);
}
void keyPressed(){
  println("pressed " + key);
  if(key == 'g'){
   render = !render; 
   if(render){background(255);}else{background(source);}
   println("render is " + render);
  }

}


void draw(){
  //panel.displayScrolls();
  //info("1");
  panel.updateScrolls();
  if(panel.overScrolls()){
   panel.displayScrolls();
  }
  else if(mousePressed){
    showOriginal = !showOriginal;
    render = true;
  }
  
  if(render){
    if(showOriginal){
      revertBack();
    }
    else{
      background(0);
      makePic(mouseX, mouseY);
    }

  render = false;
  
  if(! online){
    saveFrame("seriousbusiness-####.jpg");
  }
  }

}

void updateValuesFromPanel(){
  bands = (int)panel.getVal("Bands");
  bandLength = (int)panel.getVal("Length");
  bandSpace = (int)panel.getVal("Space");
  bandSourceDist = (int)panel.getVal("Offset");
  bandSlope = panel.getVal("Slope");
   
}

void revertBack(){
 background(source); 
}

PImage makeMask(int mX, int mY){
  updateValuesFromPanel();
  PGraphics buf = createGraphics(width,height,P3D);
  PImage img;
  int left = mX;
  int right = width - mX;
  int mid = width/2;
  
  buf.beginDraw();
  
  for(int band = 0; band < bands; band++){
       int yOut = mY + band* (bandLength + bandSpace);
       color maskColor = color(255,255,255, 255);
       stroke(maskColor);
       fill(maskColor);
       int rise = floor(mid * bandSlope);
       
       quad(left,yOut,  left,yOut + bandLength, mid , yOut + rise + bandLength,   mid ,yOut+ rise); 
       quad(mid,yOut+rise,mid,yOut+rise+bandLength, right,yOut + bandLength, right, yOut);
       

     }
     buf.endDraw();
     img = buf.get(0,0,buf.width,buf.height);
     return img;
}
void makePic(int mX, int mY ){
  updateValuesFromPanel();
  PGraphics buf = createGraphics(width,height,P3D);
  PImage img;
  img = makeMask( mX,  mY);
     //image(img,0,0);
     img.mask(source);
     
     //source.mask(img);
     
     image(img,0,0);
     filter(INVERT);
     
  //}
}



