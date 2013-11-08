PGraphics texture;
PGraphics mask;

PVector v1, v2, v3;
PVector s1, s2, s3;
PFont font;

static final int D_TRIANGLE = 1;
static final int D_TEXT = 2;

int m1, m2;

void setup()
{
  size(800, 500);
  PImage smallImage = loadImage("montaos.jpg");
  //font = loadFont("testtipo.vlw");
  smooth();
  mask = createGraphics(width, height, JAVA2D);

  // Make tiled texture
  texture = createGraphics(width, height, JAVA2D);
  texture.beginDraw();
  for (int x = 0; x < width; x += smallImage.width)
  {
    for (int y = 0; y < height; y += smallImage.height)
    {
      texture.image(smallImage, x, y);
    }
  }
  texture.endDraw();

  // Define a triangle
  v1 = new PVector(50, 50);
  v2 = new PVector(width - 50, 50);
  v3 = new PVector(width / 2, height / 2);
  m1 = m2 = 5;
}




void draw()
{
  background(230);

  drawTextured(D_TRIANGLE);
 
}



// I would pass an interface and a make drawing class instead
// but I wanted to make it simple here


void drawTextured(int drawing)
{
  mask.beginDraw();
 
  mask.background(0);
  mask.fill(255);
  mask.noStroke();
  mask.ellipse(width/2,height/2,60,60);
  
  mask.endDraw();

  PImage maskedResult = texture.get();
  maskedResult.mask(mask);
  image(maskedResult, 0, 0);
}
