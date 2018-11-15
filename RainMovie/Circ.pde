class Circ{
  float xPos, yPos, size;
  float speed;
  
  Circ(float x,float y,float s, float sp){
    xPos = x;
    yPos = y;
    size = s;
    speed = sp;
  }
  
  void render(){
    
    ellipse(xPos,yPos,size,size);
    yPos+=speed;
  }

}
