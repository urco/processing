long lastTime = 0;
void setup() {
  lastTime = millis();
}
void draw() {
  if ( millis() - lastTime > 5000 ) {
    println( "do things every 5 seconds" );
    lastTime = millis();
  }
}
