import twitter4j.conf.*;
import twitter4j.internal.async.*;
import twitter4j.internal.org.json.*;
import twitter4j.internal.logging.*;
import twitter4j.json.*;
import twitter4j.internal.util.*;
import twitter4j.management.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import twitter4j.util.*;
import twitter4j.internal.http.*;
import twitter4j.*;
import twitter4j.internal.json.*;
 
Status status; 
String userName ="@urco82"; 
java.util.List statuses = null;
Twitter twitter;
int numTweets = 100;
String[] twArray = new String[numTweets];


void setup(){
  
ConfigurationBuilder cb = new ConfigurationBuilder();
 
cb.setOAuthConsumerKey("uMjvPLmvcs7j4flrgqsSw");
cb.setOAuthConsumerSecret("MhRJLl1I1gJeftRDEHS5ZvDtrRF1VYVpJNjE7SYDdj4");
cb.setOAuthAccessToken("2151648294-wftVMnuuBp1cKMINr9VCxCchtHb3zGMx37nGZLV");
cb.setOAuthAccessTokenSecret("OHI4xguKlyTKoemMMQsycLWUcmxhZYtxLl751biXJtu6K");
  
twitter = new TwitterFactory(cb.build()).getInstance(); 

 
} 
  
void draw(){
  size(600,400);
  fill(0, 40);
 //text(getTimeline(), width/2, height/2);
  getTimeline();

}  

void getTimeline(){

  try {
    statuses = twitter.getUserTimeline(userName);
  } 
  catch(TwitterException e) {
  }
 
  for (int i=0; i<statuses.size(); i++) {
    status = (Status)statuses.get(i);
    //println(status.getUser().getName() + ": " + status.getText());
    twArray[i] = status.getUser().getName() + ": " + status.getText();
    if(twArray[i] != null){
   // return twArray;
    println(twArray);
    }else{
     exit();
    }
   }
 
} 
