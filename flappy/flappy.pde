PImage img1, img2, img3, img4;

//Flappy Code
bird b = new bird();
pillar[] p = new pillar[3];
boolean end=false;
boolean intro=true;
int score=0;
void setup() {
  size(500, 800);
  for (int i = 0; i<3; i++) {
    p[i]=new pillar(i);
    PFont font = createFont("MS ゴシック", 40);
    textFont(font);
  }

  //original program
  //sound program
  minim1 = new Minim(this);
  //minim2 = new Minim(this);
  minim3 = new Minim(this);
  player1 = minim1.loadFile("jump.mp3");
  //player2 = minim2.loadFile("finish.mp3");
  player3 = minim3.loadFile("砂の惑星.mp3");

  img1 = loadImage("shibainu.png");
  img1.resize(100, 100);
  imageMode(CENTER);
  img2 = loadImage("2.png");
  img2.resize(1000, 1600);
  img3 = loadImage("hone.png");
  img3.resize(30,30);
  img4 = loadImage("born.png");
  img4.resize(150,150);
  
  player3.rewind();
  player3.play();
  player3.loop();
}
void draw() {
  image(img2, 0, 0);
  if (end) {
    b.move();
  }
  b.drawBird();
  if (end) {
    b.drag();
  }
  b.checkCollisions();
  for (int i = 0; i < 3; i++) {
    p[i].drawPillar();
    p[i].checkPosition();
  }
  fill(0);
  stroke(255);
  textSize(32);
  if (end) {
    rect(20, 20, 100, 50);
    fill(255);
    text(score, 30, 58);
  } else {
    rect(110, 100, 280, 50);
    rect(100, 200, 300, 50);
   // rect(85, 305, 350, 50);
    fill(255);
    if (intro) {
      text("フラッピーゲーム", 125, 140);
      text("クリックでスタート", 105, 240);
    //  text(
    } else {
      text("ゲームオーバー", 140, 140);
      text("点数", 180, 240);
      text(score, 280, 240);
      
      img1.resize(300,300);
      image(img1,150,400);
      image(img4,350,400);
      
    //  text("クリックでリスタート", 100, 340);
    }
  }
  image(img3,470,350);
}

void reset() {
  end = true;
  score = 0;
  b.yPos = 400;
  for (int i = 0; i<3; i++) {
    p[i].xPos+=550;
    p[i].cashed = false;
  }
}
void mousePressed() {
  b.jump();
  intro=false;
  player1.rewind();
  player1.play();
  if (end == false) {
    reset();
  }
}
void keyPressed() {
  b.jump(); 
  intro = false;
  player1.rewind();
  player1.play();
  if (end == false) {
    reset();
  }
}
/*
void mouseMoved(){
 b.jump();
 intro=false;
 player1.rewind();
 player1.play();
 if(end==false){
 reset();
 }
 }
 */
