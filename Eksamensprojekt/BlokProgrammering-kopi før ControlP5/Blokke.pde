class Blok {
  int xPos;
  int yPos;
  int sidstXPos;
  int sidstYPos;
  
  int id;
  int blokBrede = 200;
  int blokHoejde = 70;
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
  
  void setXPos(int nyXPos){
    xPos = nyXPos;
  }
  
  void setYPos(int nyYPos){
    yPos = nyYPos;
  }
  
}


//-----------------------------TegnFirkant Blok-----------------------------//

class TegnKvadrat extends Blok {
  int tegnX;
  int tegnY;
  int brede;

  TegnKvadrat(int x, int y, int i) { //skal tage to inputs
    super(x, y, i);
    farve = #7BE000; //grøn
  }


  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
    //tegnet for blokken
    fill(0);
    rectMode(CORNER);
    rect(xPos - blokBrede/2 +10, yPos - blokHoejde/2 + 10, 30, 20);
    
    textSize(20);
    textAlign(LEFT);
    text("rect(x,y,h,b)", xPos - blokBrede/2 +10, yPos - blokHoejde/2 + 55);
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


//-----------------------------TegnCirkel Blok-----------------------------//

class TegnCirkel extends Blok {
  int tegnX;
  int tegnY;
  int brede;

  TegnCirkel(int x, int y, int i) { //skal tage to inputs
    super(x, y, i);
    farve = #51E0A6; //cyan
  }


  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
    //tegnet for blokken
    fill(0);
    circle(xPos - blokBrede/2 + 25,yPos - blokHoejde/2 + 20, 30);
  }

  void aendreVærdier() {  //skal tage værdier fra brugeren/variabler og gemme dem så de kan bruges
    tegnX = 50;
    tegnY = 50;
    brede = 50;
  }

  void koerFunktion() {
    aendreVærdier();  //opdaterer værdierne
    fill(0);
    circle(tegnX + View.getVisuX(), tegnY + View.getVisuY(), brede);
  }
}


//-----------------------------FlytForm Blok-----------------------------//

class FlytForm extends Blok {

  FlytForm(int x, int y, int i) {
    super(x, y, i);
    farve = #E33CDB; //lilla
  }

  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
  }

  void koerFunktion() {
  }
}
