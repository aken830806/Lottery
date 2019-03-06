ArrayList<Paper> papers;
Boolean touching = false;
float papers_length = 0;
float paper_height = 1500*3/5;
Boolean autoRoll = true;

void setup() {
  size(900, 1500);
  papers = new ArrayList<Paper>();
  //papers.add(new Paper("apple", height/4));
  //papers.add(new Paper("banana", papers.get(papers.size()-1).y+paper_height));
  //papers.add(new Paper("car", papers.get(papers.size()-1).y+paper_height));
  //papers.add(new Paper("door", papers.get(papers.size()-1).y+paper_height));
  //papers.add(new Paper("eclipse", papers.get(papers.size()-1).y+paper_height));
  papers.add(new Paper("哆啦A夢", height/4));
  papers.add(new Paper("雞飛狗跳", papers.get(papers.size()-1).y+paper_height));
  papers.add(new Paper("喜怒哀樂", papers.get(papers.size()-1).y+paper_height));
  papers.add(new Paper("小熊維尼", papers.get(papers.size()-1).y+paper_height));
  
  papers_length = paper_height * (papers.size()-1);
  if (papers_length >= height) {
    papers_length -= height;
  } else {
    papers_length = 0;
  }
}

void draw() {
  for (Paper paper : papers) {
    paper.display();
  }
  stroke(255,0,0);
  strokeWeight(10);
  line(0,200,width,200);
  line(0,1200,width,1200);
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
}
void touchMove() {
  if (touching) {
    for (Paper paper : papers) {
      paper.move();
    }
  }
}
void touchEnd() {
  touching = false;
  for (Paper paper : papers) {
      paper.afterMove();
  }
}
