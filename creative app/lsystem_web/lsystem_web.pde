/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49814*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Copyright by Diana Lange
// www.diana-lange.de
// http://www.flickr.com/photos/dianalange/

Tree t;
LSystem ls;

int mode = 0, iNum = 8;
int rad = 310;
float zoom = 1.0, totalHight = rad*2;
color eColor = color(178, 209, 209, 240);

void setup ()
{
  size (800, 800);
  smooth();
  createnewlSystem();
}

void draw ()
{
  background (247);

  noStroke();
  fill (eColor);
  ellipse (width/2, height/2, rad*2, rad*2);
  
translate ((float) t.getStartX()/(float) width*(width - zoom*width), ((float) t.getStartY()/(float) height)*(height - zoom*height)); 
 // translate ((float) t.getStartX()/(float) width*(width - zoom*width), 0); 
  scale (zoom);
  t.display();
}


void createnewlSystem ()
{
  switch (mode)
  {
  case 0: // tree
    Rule [] r = {
      new Rule("F", "FF"), 
      new Rule ("X", "F[+X]F[-X]+X")
      };
      RuleLib rl = new RuleLib (r, "X");
    ls = new LSystem (rl, iNum);
    t = new Tree (ls.getLSystem(), width/2, height/2+rad, 270, 20.0, 0.75, color (247));
    eColor = color(178, 209, 209, 240);
    break;

  case 1: // root
    Rule [] rr = {
      new Rule("F", "FF"), 
      new Rule ("X", "F-[[X]+X]+F[+FX]-X")
      };
      RuleLib rrl = new RuleLib (rr, "X");
    ls = new LSystem (rrl, iNum);
    t = new Tree (ls.getLSystem(), width/2, height/2-rad, 80, 22.5, 0.55, color (247));
    eColor = color(88, 78, 52, 210);
    break;
  }
  zoom = totalHight /  t.getHight();
 
}

