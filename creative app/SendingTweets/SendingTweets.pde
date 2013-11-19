import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;

void setup()
{
    size(800,600);

   ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("uMjvPLmvcs7j4flrgqsSw");
  cb.setOAuthConsumerSecret("MhRJLl1I1gJeftRDEHS5ZvDtrRF1VYVpJNjE7SYDdj4");
  cb.setOAuthAccessToken("2151648294-wftVMnuuBp1cKMINr9VCxCchtHb3zGMx37nGZLV");
  cb.setOAuthAccessTokenSecret("OHI4xguKlyTKoemMMQsycLWUcmxhZYtxLl751biXJtu6K");

    TwitterFactory tf = new TwitterFactory(cb.build());

    twitter = tf.getInstance();
}

void draw()
{

}

void tweet()
{
    try 
    {
        Status status = twitter.updateStatus("hoxe e venres!");
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
