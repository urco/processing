class SZCubus extends SuperCreature {
 
  float cSize; // size of the body
 
  public SZCubus() {
    creatureAuthor  = "Javi";  // your name here, Steve
    creatureName    = "JaviCubus";         // the creature’s one goes here 
    creatureVersion = "1.0";           // a string of your choice
    setDate(2012, 9, 24); //Y,M,D      // just to keep track
 
    cSize = random(6, 30);             // each creature will have a slightly different size
  }
 
  void move() {
    // doesn’t move at all. Just stays in place for now…
  }
 
  void draw() {    
    // this shortcut function just translates, rotates and scales the model matrix
    // by the values contained in the superclass PVectors pos, rot and sca
    // it could also be done by hand, 
    // for example in a case where the creature is based on a particle system
    // and drawing has to be in world coordinates.
    applyTransforms(); 
 
    // let’s draw the creature body: a box to hounour the creature’s name
    noFill();
    stroke(255);
    strokeWeight(1);
    box(cSize);     
  }
}
