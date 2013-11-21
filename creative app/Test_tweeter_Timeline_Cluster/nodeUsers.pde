class nodeUsers extends VerletParticle2D {

  circleMask pic;
  
  nodeUsers(Vec2D pos) {
    super(pos);
    }
   


  // All we're doing really is adding a display() function to a VerletParticle
  /*void display() {
    fill(0,150);
    stroke(0);
    strokeWeight(2);
    //ellipse(x,y,16,16);
  }*/
  
  void getSearchTweets() {           
  //float x=random(width);
  //float y=random(height);

  try {        
    Query query = new Query("love");            
    QueryResult result = twitter.search(query);
   
       
    for (Status status : result.getTweets()) {              
      //println("@" + status.getUser().getScreenName() + ":" + status.getText());
      //text("@" + status.getUser().getScreenName() + ":" + status.getText(),random(width), random(height), 300, 200);
      imgTemp=status.getUser().getBiggerProfileImageURL();
      img = loadImage(imgTemp, "png"); 
      pic=new circleMask(60,img,random(width), random(height));
      pic.display();
      //img.resize(600,0);
      //image(img,random(width), random(height));
         
   }
  }   
  catch (TwitterException e) {            
    println("Search tweets: " + e);
  } 
  
}
}

