import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
String searchString = "LOMCE";
List<Status> tweets;

int currentTweet;

void setup()
{

size(800,600);
ConfigurationBuilder cb=new ConfigurationBuilder();
cb.setOAuthConsumerKey("uMjvPLmvcs7j4flrgqsSw");
cb.setOAuthConsumerSecret("MhRJLl1I1gJeftRDEHS5ZvDtrRF1VYVpJNjE7SYDdj4");
cb.setOAuthAccessToken("2151648294-hTY97KFpT98zjdIPhMIE25bXfi6nmGzVj0zOPUB");
cb.setOAuthAccessTokenSecret("jAbqWj0tRC5RJUguhj5EZK72xciwAKjcng8Jh93Fa4KY2");

TwitterFactory tf = new TwitterFactory(cb.build());

twitter =tf.getInstance();

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

        delay(30000);
    }
}

