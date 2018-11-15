import processing.video.*;

Movie myMovie;
PImage mS;

void setup(){
  size(640, 360);
  myMovie= new Movie(this,"PARKOUR vs BREAKDANCE  Epic Battle.mp4"); 
  myMovie.loop();

}

void movieEvent(Movie movie) {
  movie.read();
  mS = movie.get();
  mS.resize(width,height);
}

//PLAYTHING VALUES
float fireRate = 10;  //frequency of falling raindrops
float colorRate = .01; //how often the bg changes
int sizeCap = 10;        //how big the raindrops can be
int speedCap = 5;     //how fast the rain falls
color bg = color(0);  //background color
float bgOpacity = 30;  //smaller values create longer raindrops
float rainOpacity = 50; //how bold the raindrops are, also contributes to how long they are 

//containers for all of the raindrops
ArrayList<Circ> circles = new ArrayList<Circ>();
ArrayList<Circ> deleter = new ArrayList<Circ>();

void draw(){
  if(mS != null){
    rainGlass(mS);
  }
}

void rainGlass(PImage image){
  noStroke();
  fill(bg,bgOpacity);
  rect(0,0,width,height);
  loadPixels();
  
  //generating the raindrops above the screen
  if(random(1)<fireRate){
    circles.add(new Circ(int(random(width)),-50,int(random(sizeCap)),int(random(1,speedCap))));
    for(int i = 1; i<fireRate;i++){
      circles.add(new Circ(int(random(width)),-50,int(random(sizeCap)),int(random(1,speedCap))));
    }
  }
  /* //changing the background color at random
  if(random(1)<colorRate){
    //bg = color(random(255),30);
  }*/
  
  //rendering the circles and managing their deletion
  for(Circ c: circles){
    float x = c.xPos;
    float y = c.yPos;
    int loc = int(x + y*width);
    if(y>=0 && y<height){
      fill(image.pixels[loc],rainOpacity);
    }
    c.render();
  }
  
  //deleting each circle when it needs to be deleted
  for(Circ d: deleter){
    int deleteIndex = circles.indexOf(d);
    circles.remove(deleteIndex);
  }
  
  //"emptying the wastebin"
  deleter.clear();
}

void mouseClicked(){
  saveFrame("/output/capture####.jpg");
}
