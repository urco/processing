class clusterUsers {

  // A cluster is a grouping of nodes
  ArrayList<nodeUsers> nodes;

  float diameter;

  // We initialize a Cluster with a number of nodes, a diameter, and centerpoint
  clusterUsers(int n, float d, Vec2D center) {

    // Initialize the ArrayList
    nodes = new ArrayList<nodeUsers>();

    // Set the diameter
    diameter = d;

    // Create the nodes
    for (int i = 0; i < n; i++) {
      // We can't put them right on top of each other
      nodes.add(new nodeUsers(center.add(Vec2D.randomVector())));
    }

    // Connect all the nodes with a Spring
    for (int i = 0; i < nodes.size()-1; i++) {
      VerletParticle2D ni = nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D nj = nodes.get(j);
        // A Spring needs two particles, a resting length, and a strength
        physics.addSpring(new VerletSpring2D(ni, nj, diameter, 0.01));
      }
    }
  }

  void display() {
    // Show all the nodes
    smooth();
    for (nodeUsers n : nodes) {
      n.getSearchTweets();
    }
  }


  // Draw all the internal connections
  void showConnections() {
    stroke(0, 150);
    strokeWeight(2);
    for (int i = 0; i < nodes.size()-1; i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {
        VerletParticle2D pj = (VerletParticle2D) nodes.get(j);

        line(pi.x, pi.y, pj.x, pj.y);
      }
    }
  }
}

