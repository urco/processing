import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.joints.*;

Physics physics;

void setup() {
  size(640,480,P3D);
  frameRate(60);
  initScene();
}


void initScene() {
  float gravX = 0.0;                 
  float gravY = -10.0;
  float screenAABBWidth = 2*width;   
  float screenAABBHeight = 2*height;
  float borderBoxWidth = width;      
  float borderBoxHeight = height;
  float pixelsPerMeter = 30;
  physics = new Physics(this, width, height,
                  gravX, gravY,
            screenAABBWidth, screenAABBHeight,
            borderBoxWidth, borderBoxHeight,
            pixelsPerMeter);
  physics.setDensity(1.0f);
}

void draw() {
  background(0);

  if (keyPressed) {
    if (key == '1') {
      physics.createCircle(mouseX, mouseY, random(5,10));
    } else if (key == '2') {
      float sz = random(5,10);
      physics.createRect(mouseX - sz, mouseY - sz, mouseX + sz, mouseY + sz);
    } else if (key == '3') {
      float sz = random(10,20);
      physics.createPolygon(mouseX,      mouseY, 
                            mouseX+sz,   mouseY, 
                            mouseX+sz*.5,mouseY-sz);
    } else if (key == '4') {
      int nVerts = floor(random(4,8));
      float rad = random(5,10);
      float[] vertices = new float[nVerts*2];
      for (int i=0; i<nVerts; ++i) {
        vertices[2*i] = mouseX + rad*sin(TWO_PI*i/nVerts);
        vertices[2*i+1] = mouseY + rad*cos(TWO_PI*i/nVerts);
      }
      physics.createPolygon(vertices);
    } else {
      //Reset everything
      physics.destroy();
      initScene();
    }
  }

}

