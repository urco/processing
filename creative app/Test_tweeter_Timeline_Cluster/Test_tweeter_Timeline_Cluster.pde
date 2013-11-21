//Javier Rey Varela

import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;
import toxi.geom.*;
import toxi.physics2d.*;

VerletPhysics2D physics;
nodeUsers nodes;
clusterUsers cluster;
circleMask pic;
List<Status>statuses = null;
List<User> usuario=null;
String imgTemp = null;
TwitterFactory twitterFactory;
Twitter twitter;
PImage img; 

// Boolean that indicates whether we draw connections or not
boolean showPhysics = true;
boolean showParticles = true;


//Cluster clusterUsers;


void setup() { 
  
  smooth();
  size(1024, 800);    
  //background(0); 
  connectTwitter();
  nodes=new nodeUsers(Vec2D.randomVector());
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(10, 10, width-20, height-20));

  // Spawn a new random graph
  cluster = new clusterUsers(8, 600, new Vec2D(width/2, height/2));
  
}  

void draw() {     
  physics.update();
  smooth();
  background(230);
  nodes.getSearchTweets();
   // Display all points
  if (showParticles) {
    cluster.display();
  }

  // If we want to see the physics
  if (showPhysics) {
    cluster.showConnections();
  }
  //getSearchTweets(); 
  //getTimeline();
  delay(10);  
  
}  

// Initial connection
void connectTwitter() {  
 
  ConfigurationBuilder cb = new ConfigurationBuilder();  
  cb.setOAuthConsumerKey("uMjvPLmvcs7j4flrgqsSw");
  cb.setOAuthConsumerSecret("MhRJLl1I1gJeftRDEHS5ZvDtrRF1VYVpJNjE7SYDdj4");
  cb.setOAuthAccessToken("2151648294-wftVMnuuBp1cKMINr9VCxCchtHb3zGMx37nGZLV");
  cb.setOAuthAccessTokenSecret("OHI4xguKlyTKoemMMQsycLWUcmxhZYtxLl751biXJtu6K"); 
    
  twitterFactory = new TwitterFactory(cb.build());    
  twitter = twitterFactory.getInstance();  
  
  println("connected");
} 


// Get your tweets
void getTimeline() {     
  try {        
    statuses = twitter.getHomeTimeline();
  }   
  catch(TwitterException e) {         
    println("Get timeline: " + e + " Status code: " + e.getStatusCode());
  }     
  for (Status status:statuses) {               
    //println(status.getUser().getName() + ": " + status.getText());
    text(status.getUser().getName() + ": " + status.getText(), random(width), random(height), 300, 200);
  }
}  
// Search for tweets and user profile Image

/*void getSearchTweets() {           
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
      circleMask pic=new circleMask(60,img,random(width),random(height));
      pic.display();
      //img.resize(600,0);
      //image(img,random(width), random(height));
         
   }
  }   
  catch (TwitterException e) {            
    println("Search tweets: " + e);
  } 
  
}*/


void tweetear()
{
    try 
    {
        Status status = twitter.updateStatus("Isto vai indo!");
        System.out.println("Status updated to [" + status.getText() + "].");
    }
    catch (TwitterException te)
    {
        System.out.println("Error: "+ te.getMessage()); 
    }
}

void keyPressed() {
  if (key == 'c') {
    showPhysics = !showPhysics;
    if (!showPhysics) showParticles = true;
  } 
  else if (key == 'p') {
    showParticles = !showParticles;
    if (!showParticles) showPhysics = true;
  } 
  else if (key == 'n') {
    physics.clear();
    cluster = new clusterUsers(int(random(2, 20)), random(10, width/2), new Vec2D(width/2, height/2));
  }
}

