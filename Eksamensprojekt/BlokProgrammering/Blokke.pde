class Blok {
  int xPos;
  int yPos;
  int id;
  int brede = 200;
  int hoejde = 100;
  color farve;



  Blok(int x, int y, int i) {
    xPos = x;
    yPos = y;
    id = i;
  }

  void drawBlok() {       //Denne er til at fylde ud med visualiseringen af blokken i nedarvning
  }

  void koerFunktion() {   //Denne er til at fylde ud med blokkens funktion i nedarvning
  }

  void moveBlok(int tagetId) {
    if (mousePressed && tagetId == id) {
      xPos = mouseX;
      yPos = mouseY;
      println(tagetId);
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
}
// her slutter class Blok

//-----------------------------TegnForm Blok-----------------------------//

class TegnForm extends Blok {
  String Form;

  TegnForm(int x, int y, int i) {
    super(x, y, i);
    farve = #7BE000;
  }


  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, brede, hoejde);
  }

  void koerFunktion(int tegnX, int tegnY) {
    
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
    rect(xPos, yPos, brede, hoejde);
  }

  void koerFunktion() {
  }
}
