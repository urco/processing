import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;


List<Status>statuses = null;
List<User> usuario=null;
String imgTemp = null;
TwitterFactory twitterFactory;
Twitter twitter;
PImage img; 

void setup() {     
  size(800, 600);    
  background(0); 
  
  connectTwitter(); 
  
}  

void draw() {     
  background(0);
  getSearchTweets(); 
  //getTimeline();
  delay(250);  
  
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
// Search for tweets

void getSearchTweets() {           
  try {        
    Query query = new Query("lomce");            
    QueryResult result = twitter.search(query);
   
       
    for (Status status : result.getTweets()) {              
      //println("@" + status.getUser().getScreenName() + ":" + status.getText());
      text("@" + status.getUser().getScreenName() + ":" + status.getText(),random(width), random(height), 300, 200);
      imgTemp=status.getUser().getBiggerProfileImageURL();
      img = loadImage(imgTemp, "png"); 
      //img.resize(600,0);
      image(img,0,0);   
   }
  }   
  catch (TwitterException e) {            
    println("Search tweets: " + e);
  }
}
