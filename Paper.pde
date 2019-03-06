class Paper{
  PFont font;
  float y;
  float yOffset;
  float speed = 0;
  float width = 900;
  float height = paper_height;
  String title;
  int index = papers.size();
  float touchY;
  int r = (int)random(256);
  int g = (int)random(256);
  int b = (int)random(256);
  
  Paper(String title,float y){
    //font = createFont("Arial",1);
    font = createFont("標楷體",1);//chinese
    this.title = title;
    this.y = y;
  }
  void display(){
    bound();
    
    if(y > -200 && y < 700){
      fill(235, 240, 242);
    }else{
      fill(255);
    }
    stroke(0);
    strokeWeight(1);
    rect(0,y,width-1,height);
    
    fill(0);
    textAlign(CENTER);// Set the alignment
    textFont(font,72);
    text(title,width/2,y+height/2);
    
    if(speed != 0){
      y += speed;
      if(speed > 0){
        speed -= 0.3;
      }
      if(abs(speed) < 0.3)
        speed = 0;
    }
  }
  void touch(){
    if(speed == 0){
      yOffset = coordY - y;
      touchY = coordY;
    }
  }
  void move(){
    if(speed == 0 && coordY > touchY){//only move down
      if(index == 0){
        y = coordY - yOffset;
      }else{
        if(papers.get(index-1).y < 1500 + papers_length){
          y = papers.get(index-1).y + height;
        }else{
          y = coordY - yOffset;
        }
      }
    }
  }
  void afterMove(){
    if(speed == 0){
      if(coordY - touchY > 50){
        if(index != 0){
          speed = papers.get(0).speed;
        }else{
          speed = 50 + random(50);
        }
      }
    }
  }
  void bound(){
    if(y > 1500 + papers_length){//out of bound
      if(index == papers.size()-1){
        y = papers.get(0).y - height;
      }else{
        y = papers.get(index+1).y - height;
      }
    }
  }
}
