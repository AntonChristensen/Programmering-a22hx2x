class Blok {
  int xPos;
  int yPos;
  int id;
  int blokBrede = 200;
  int blokHoejde = 100;
  color farve;



  Blok(int x, int y, int i) {
    xPos = x;  //startplacering i programmet
    yPos = y;  //startplacering i programmet
    id = i;    //blokkens Id
  }

  void drawBlok() {       //Denne er til at fylde ud med visualiseringen af blokken i nedarvning
  }

  void koerFunktion() {   //Denne er til at fylde ud med blokkens funktion i nedarvning
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
    return blokBrede;
  }

  int getHoejde() {
    return blokHoejde;
  }
}
// her slutter class Blok

//-----------------------------TegnForm Blok-----------------------------//

class TegnForm extends Blok {
  int tegnX;
  int tegnY;
  int brede;

  TegnForm(int x, int y, int i) { //skal tage to inputs
    super(x, y, i);
    farve = #7BE000;
  }


  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
  }

  void aendreVærdier() {  //skal tage værdier fra brugeren/variabler og gemme dem så de kan bruges
    tegnX = 50;
    tegnY = 50;
    brede = 50;
  }

  void koerFunktion() {
    aendreVærdier();  //opdaterer værdierne
    fill(0);
    square(tegnX + View.getVisuX(), tegnY + View.getVisuY(), brede);
  }
}


//-----------------------------FlytForm Blok-----------------------------//

class FlytForm extends Blok {

  FlytForm(int x, int y, int i) {
    super(x, y, i);
    farve = #E33CDB;
  }

  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
  }

  void koerFunktion() {
  }
}
