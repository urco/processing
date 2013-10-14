float [] randomCounts;

void setup(){
  size(200,200);
  randomCounts=new float[10]; //declara un array de de 10 elementos tipo float
}

void draw(){
  background(255);
  
  //genera un numero aleatorio e incrementa el contador
  
  int index=int (random(randomCounts.length));
  randomCounts[index]++; //establece que elemnto del array (barras) es afectada por el incremnto de tamanho
  
  //Draw a rectangle to graph results
  stroke (0);
  fill(175);
  int x=0;
  //for (int x=0;x < randomCounts.length;x++){
     rect(x*20,0,9,randomCounts[x]);
  //}

}


