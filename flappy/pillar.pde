class pillar {
  float xPos, opening;
  boolean cashed = false;
  pillar(int i) {
    xPos = 100+(i*200);
    opening = random(600)+100;
  }
  void drawPillar() {
    //original program
    stroke(0, 0, 255);
    strokeWeight(10);

    line(xPos, 0, xPos, opening-100);  
    line(xPos, opening+100, xPos, 800);
  }
  void checkPosition() {
    if (xPos<0) {
      xPos+=(200*3);
      opening = random(600)+100;
      cashed=false;
    } 
    if (xPos<250&&cashed==false) {
      cashed=true;
      score++;
    }
  }
}
