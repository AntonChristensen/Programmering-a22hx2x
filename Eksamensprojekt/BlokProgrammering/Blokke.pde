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
    fill(102, 178, 255);
    rectMode(CENTER);
    rect(xPos, yPos, brede, hoejde);
  }

  void moveBlok(int tagetId) {
    if (mousePressed && tagetId == id) {
      xPos = mouseX;
      yPos = mouseY;
    }
  }

  int getId() {
    return id;
  }

  int getXPos() {
    return xPos;
  }

  int getYPos() {
    return yPos;
  }

  int getBrede() {
    return brede;
  }

  int getHoejde() {
    return hoejde;
  }
}// her slutter class Blok



class TegnForm extends Blok {
  int xStart = 200;
  int yStart = 200;
  int firkantBrede = 100;
  int firkantHoejde = 100;


  TegnForm(int x, int y, int i) {
    super(x, y, i);
  }

  void tegnFirkant() {
    rect(xStart, yStart, firkantBrede, firkantHoejde);
  }
}
