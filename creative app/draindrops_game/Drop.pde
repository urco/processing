class Drop {
  float x,y;
  float speed;
  color c;
  float r;

Drop(){
  r=8; //todas las gotas tienen el mismo tamaño
  x=random(width);//empieza con una localizacion en el eje X aleatoria
  y-=r*4;//empieza una pequeña gota en el top de la ventana
  speed=random(1,5);//adquiere una velocidad aleatoria
  c=color(50,100,150);//color
}

//mueve la gota hacia abajo
void move(){
  y+=speed;// se incrementa la posición en el eje y por la velocidad.
}

//Comprueba si las gotas llegan al suelo

boolean reachedBottom(){
  //comprobamos si la gota abandona la ventana.
  if (y>height+r*4){
    return true;
  }else{
    return false;
  }
}
//dibujamos la gota
void display(){
 fill(50,100,150);
 noStroke();
 for(int i=2;1 < r;i++){
 ellipse(x,y+i*4,i*2,i*2); 
 }
}
