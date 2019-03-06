ArrayList<Paper> papers;
Boolean touching = false;
float papers_length = 0;
float paper_height = 500*3/5;
Boolean autoRoll = true;

void setup() {
  size(300, 500);
  papers = new ArrayList<Paper>();
  papers.add(new Paper("apple", height/4));
  papers.add(new Paper("banana", papers.get(papers.size()-1).y+paper_height));
  papers.add(new Paper("car", papers.get(papers.size()-1).y+paper_height));
  papers.add(new Paper("door", papers.get(papers.size()-1).y+paper_height));
  
  papers_length = paper_height * (papers.size()-1);
  if (papers_length >= height) {
    papers_length -= height;
  } else {
    papers_length = 0;
  }
}

void draw() {
  //fill(235, 240, 242);
  //rect(0, 0, width, height);
  for (Paper paper : papers) {
    paper.display();
  }
  //line(0,0,coordX,coordY);
}
void mousePressed() {
  for (Paper paper : papers) {
    paper.touch();
  }
}

void mouseDragged() {
  for (Paper paper : papers) {
    paper.move();
  }
}

void mouseReleased() {
  if(autoRoll){
    for (Paper paper : papers) {
      paper.afterMove();
    }
  }
}

void touchStart() {
  touching = true;
  for (Paper paper : papers) {
    paper.touch();
  }
  println("touchStart");
}
void touchMove() {
  if (touching) {
    for (Paper paper : papers) {
      paper.move();
    }
    println("touchMove");
  }
}
void touchEnd() {
  touching = false;
  println("touchEnd");
}
