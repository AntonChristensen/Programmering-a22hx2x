class Blok {
  int xPos;
  int yPos;
  int id;
  int brede = 200;
  int hoejde = 100;



  Blok(int x, int y, int i) {
    xPos = x;
    yPos = y;
    id = i;
  }

  void drawBlok() {
    fill(102,178,255);
    rectMode(CENTER);
    rect(xPos, yPos, brede, hoejde);
  }

  void moveBlok(int tagetId) {
    if (mousePressed && tagetId == id) {
      xPos = mouseX;
      yPos = mouseY;
    }
  }
}
