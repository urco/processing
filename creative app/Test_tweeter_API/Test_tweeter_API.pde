import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
String searchString = " just landed";
List<Status> tweets;

int currentTweet;

void setup()
{

  size(800, 600);
  TweetConnection();
  getNewTweets();
  currentTweet = 0;
  thread("refreshTweets");
  
}


void draw()
{

  fill(0, 40);
  rect(0, 0, width, height);

  currentTweet = currentTweet + 1;

  if (currentTweet >= tweets.size())
  {
    currentTweet = 0;
  }

  Status status = tweets.get(currentTweet);

  fill(200);
  text(status.getText(), random(width), random(height), 300, 200);

  delay(250);
}


void getNewTweets()
{
  try 
  {
    Query query = new Query(searchString);

    QueryResult result = twitter.search(query);

    tweets = result.getTweets();
  } 
  catch (TwitterException te) 
  {
    System.out.println("Failed to search tweets: " + te.getMessage());
    System.exit(-1);
  }
}


void refreshTweets()
{
  while (true)
  {
    getNewTweets();

    println("Updated Tweets"); 

    delay(5000);
  }
}


void tweet()
{
    try 
    {
<<<<<<< HEAD
        Status status = twitter.updateStatus("prbando arte xenerativo nas redes sociais...");
=======
        Status status = twitter.updateStatus("This iis a tweet sent from Processing!");
>>>>>>> 5cd0cf57fc802e4f580c679d0d7731882bc816db
        System.out.println("Status updated to [" + status.getText() + "].");
    }
    catch (TwitterException te)
    {
        System.out.println("Error: "+ te.getMessage()); 
    }
}



void keyPressed()
{
    tweet();
}


void TweetConnection(){
  
ConfigurationBuilder cb=new ConfigurationBuilder();
  cb.setOAuthConsumerKey("uMjvPLmvcs7j4flrgqsSw");
  cb.setOAuthConsumerSecret("MhRJLl1I1gJeftRDEHS5ZvDtrRF1VYVpJNjE7SYDdj4");
  cb.setOAuthAccessToken("2151648294-wftVMnuuBp1cKMINr9VCxCchtHb3zGMx37nGZLV");
  cb.setOAuthAccessTokenSecret("OHI4xguKlyTKoemMMQsycLWUcmxhZYtxLl751biXJtu6K");

  TwitterFactory tf = new TwitterFactory(cb.build());

  twitter =tf.getInstance();


}
