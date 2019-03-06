class Paper{
  PFont font;
  float y;
  float yOffset;
  float speed = 0;
  float width = 300;
  float height = paper_height;
  String title;
  int index = papers.size();
  float touchY;
  int r = (int)random(256);
  int g = (int)random(256);
  int b = (int)random(256);
  
  Paper(String title,float y){
    font = createFont("Arial",1);
    //font = createFont("標楷體",1);//chinese
    this.title = title;
    this.y = y;
  }
  void display(){
    bound();
    
    fill(255);
    rect(0,y,width-1,height);
    
    fill(0);
    textAlign(CENTER);// Set the alignment
    textFont(font,24);
    text(title,width/2,y+height/2);
    
    if(speed != 0){
      y += speed;
      if(speed > 0){
        speed -= 0.1;
      }else{
        speed += 0.1;
      }
      if(abs(speed) < 0.1)
        speed = 0;
    }
  }
  void touch(){
    if(speed == 0){
      yOffset = mouseY - y;
      //yOffset = coordY - y;
      touchY = mouseY;
    }
  }
  void move(){
    if(speed == 0 && mouseY > touchY){//only move down
      if(index == 0){
        y = mouseY - yOffset;
        //y = coordY - yOffset;
      }else{
        if(papers.get(index-1).y < 500 + papers_length){
          y = papers.get(index-1).y + height;
        }else{
          y = mouseY - yOffset;
        }
      }
    }
  }
  void afterMove(){
    if(speed == 0){
      if(mouseY - touchY > 50){
        speed = 25;
      }
    }
  }
  void bound(){
    if(y > 500 + papers_length){//out of bound
      if(index == papers.size()-1){
        y = papers.get(0).y - height;
      }else{
        y = papers.get(index+1).y - height;
      }
    }
  }
}
