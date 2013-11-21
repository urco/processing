class NodeUsers extends VerletParticle2D {
int a;
  NodeUsers(Vec2D pos,int tempa) {
    super(pos/a);
    tempa=a;
  }

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    fill(0,150);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,16,16);
  }
}

