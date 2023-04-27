class Blok {

  int xPos;
  int yPos;
  int xDifference;
  int yDifference;
  boolean moveKoert;
  

  int id;
  int blokBrede = 200;
  int blokHoejde = 70;
  color farve;



  Blok(int x, int y, int i) {
    xPos = x;  //startplacering i programmet
    yPos = y;  //startplacering i programmet
    id = i;    //blokkens Id
  }

  void knap(int placeringX, int placeringY) {
    fill(200);
    square(placeringX, placeringY, 20);
  }


  void drawBlok() {       //Denne er til at fylde ud med visualiseringen af blokken i nedarvning
  }

  void koerFunktion() {   //Denne er til at fylde ud med blokkens funktion i nedarvning
  }

  void moveBlok(int tagetId) {
    if (!moveKoert){
      xDifference = xPos - mouseX;
      yDifference = yPos - mouseY;
      moveKoert = true;
    }
    
    if (mousePressed && tagetId == id) {
      xPos = xDifference + mouseX;
      yPos = yDifference + mouseY;
    }
    
    if (!mousePressed){
      moveKoert = false;
    }
  }

  void sletTextfelt(int i) {  //til at fjerne textfelter når der cleares eller slettes en blok
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

  void setXPos(int nyXPos) {
    xPos = nyXPos;
  }

  void setYPos(int nyYPos) {
    yPos = nyYPos;
  }
  
  int getTextX(){
    return 0;       //De er her for at der kan loopes igennem alle blokke
  }
 
 int getTextY(){
    return 0;
  }
  
  int getTextXSlut(){
        return 0;
  }
  
  int getTextYSlut(){
    return 0;
  }
  
}


//-----------------------------TegnFirkant Blok-----------------------------//

class TegnKvadrat extends Blok {
  int tegnX;
  int tegnY;
  int brede;
  int hoejde;

  TegnKvadrat(int x, int y, int i) { //skal tage tre inputs fra initialiseringen af objektet
    super(x, y, i);
    farve = #7BE000; //grøn

    // de textfelter som information skal skrives i
    cp5.addTextfield(str(id) + "X").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial",17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "Y").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial",17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "B").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial",17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "H").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial",17)).setAutoClear(false);
  }


  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
    //tegnet for blokken
    fill(0);
    rectMode(CORNER);
    rect(xPos - blokBrede/2 + 5, yPos - blokHoejde/2 + 10, 30, 20);

    textSize(20);
    textAlign(LEFT);
    text("rect(   x   ,   y   ,   h   ,   b   )", xPos - blokBrede/2 + 5, yPos + 20);

    //tegn textfelterne på blokken
    cp5.getController(str(id)+"X").setVisible(true);
    cp5.getController(str(id)+"X").setPosition(xPos - blokBrede/2 + 45, yPos + 5);
    cp5.getController(str(id)+"Y").setVisible(true);
    cp5.getController(str(id)+"Y").setPosition(xPos - blokBrede/2 + 84, yPos + 5);
    cp5.getController(str(id)+"B").setVisible(true);
    cp5.getController(str(id)+"B").setPosition(xPos - blokBrede/2 + 123, yPos + 5);
    cp5.getController(str(id)+"H").setVisible(true);
    cp5.getController(str(id)+"H").setPosition(xPos - blokBrede/2 + 162, yPos + 5);
  }

  void aendreVærdier() {  //tager værdier fra brugeren/variabler og gemme dem så de kan bruges
    tegnX = int(cp5.get(Textfield.class, str(id)+"X").getText());
    tegnY = int(cp5.get(Textfield.class, str(id)+"Y").getText());
    brede = int(cp5.get(Textfield.class, str(id)+"B").getText());
    hoejde = int(cp5.get(Textfield.class, str(id)+"H").getText());
  }

  void koerFunktion() {
    aendreVærdier();  //opdaterer værdierne
    fill(0);
    square(tegnX + View.getVisuX(), tegnY + View.getVisuY(), brede);
  }

  void sletTextfelt(int i) {
    cp5.remove(str(i)+"X");
    cp5.remove(str(i)+"Y");
    cp5.remove(str(i)+"H");
    cp5.remove(str(i)+"B");
  }
  
  
  int getTextX(){
    return tegnX;
  }
  
  int getTextY(){
    return tegnY;
  }
  
  int getTextXSlut(){
    float[] xSlut = new float[2];
    xSlut = cp5.getController(str(id)+"H").getPosition();
    return(int(xSlut[0]) + cp5.getController(str(id)+"H").getWidth());
  }
  
  int getTextYSlut(){
    float[] xSlut = new float[2];
    xSlut = cp5.getController(str(id)+"H").getPosition();
    return(int(xSlut[1]) + cp5.getController(str(id)+"H").getHeight());
  }
  
  
}


//-----------------------------TegnCirkel Blok-----------------------------//

class TegnCirkel extends Blok {
  int tegnX;
  int tegnY;
  int brede;

  TegnCirkel(int x, int y, int i) { //skal tage tre inputs fra initialiseringen af objektet
    super(x, y, i);
    farve = #51E0A6; //cyan
  }


  void drawBlok() {
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);
    //tegnet for blokken
    fill(0);
    circle(xPos - blokBrede/2 + 25, yPos - blokHoejde/2 + 20, 30);
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

  FlytForm(int x, int y, int i) { //skal tage tre inputs fra initialiseringen af objektet
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
