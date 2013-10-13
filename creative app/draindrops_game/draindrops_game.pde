
Catcher catcher;
Timer timer;
Drop[] drops;

int totalDrops=0;

void setup(){
  size(400,400);
  smooth();
  catcher=new Catcher(32);
  drops=new Drop[1000];
  timer=new Timer(300); //define un objeto timer que equivale a un intervalo. 

  timer.start();//establece una marca inicial de tiempo.
}


void draw(){
  background(255);
  catcher.setLocation(mouseX,mouseY);
  catcher.display();
  
  if (timer.isFinished()){
    drops[totalDrops]=new Drop();
    totalDrops++;
  //si nosotros llegamos al final del array
  if (totalDrops>=drops.length){
    totalDrops = 0;   
 }
 timer.start();
}


 //mueve y dibuja las gotas
 for (int i=0;i<totalDrops;i++) {
   drops[i].move();
   drops[i].display();
   if(catcher.intersect(drops[i])){
     drops[i].caught();
   }  
  }
}


