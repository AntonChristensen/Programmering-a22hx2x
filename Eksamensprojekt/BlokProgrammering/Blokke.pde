class Blok {

  int xPos;            //X koordinatet til blokken
  int yPos;            //Y koordinatet til blokken
  int xDifference;     //når en blok tages noteres differencen fra position til mus
  int yDifference;
  boolean moveKoert;   //holder styr på om en blok er blevet flyttet


  int id;                //blokkens unikke id
  int blokBrede = 200;   //fysisk brede af blokken
  int blokHoejde = 70;   //fysisk højde af blokken
  color farve;           //bruges til at holde farven af en blok


  //Constuctor
  Blok(int x, int y, int i) {
    xPos = x;  //startplacering i programmet
    yPos = y;  //startplacering i programmet
    id = i;    //blokkens Id
  }


  void drawBlok() {       //Denne er til at fylde ud med visualiseringen af blokken i nedarvning
  }

  void koerFunktion() {   //Denne er til at fylde ud med blokkens funktion i nedarvning
  }

  void moveBlok(int tagetId) {      //står for at flytte en blok
    if (!moveKoert) {               //hvis blokken lige er taget, gemmes differencen i placering til musen
      xDifference = xPos - mouseX;
      yDifference = yPos - mouseY;
      moveKoert = true;
    }

    if (mousePressed && tagetId == id) {   //Flytter blokken til musen hvis det er den blok man har fat i
      xPos = xDifference + mouseX;
      yPos = yDifference + mouseY;
    }

    if (!mousePressed) {
      moveKoert = false;
    }

    //sørger for at hvis en blok flyttes i det visuelle område at det opdateres
    if (xPos + blokBrede/2 > View.getVisuX() && grebetId == id) {
      koert = false;          //koert nulstilles for at det visuelle område opdateres
    }
  }

  void sletTextfelt(int i) {  //til at fjerne textfelter når der cleares eller slettes en blok
  }


  //getters og setters
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
}


//-----------------------------TegnFirkant Blok-----------------------------//

class TegnKvadrat extends Blok {
  int tegnX;
  int tegnY;
  int brede;
  int hoejde;

  TegnKvadrat(int x, int y, int i) { //skal tage tre inputs ffor initialiseringen af objektet
    super(x, y, i);
    farve = #7BE000; //grøn

    // de textfelter som information skal skrives i
    cp5.addTextfield(str(id) + "X").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "Y").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "B").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "H").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
  }


  void drawBlok() {   //Tegner hele blokken
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);

    //tegnet for blokken
    fill(0);
    rectMode(CORNER);
    rect(xPos - blokBrede/2 + 5, yPos - blokHoejde/2 + 10, 30, 20);

    //beskrivelse af input
    textSize(20);
    textAlign(LEFT);
    text("   x       y       b       h", xPos - blokBrede/2 + 45, yPos - 2);
    text("rect(   x   ,   y   ,   b   ,   h   )", xPos - blokBrede/2 + 5, yPos + 20);

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


  //tager værdier fra brugeren/variabler og gemme dem så de kan bruges
  void aendreVærdier() {
    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"X").getText())) {    //hvis variablen findes så brug dens værdi
      tegnX = Variabler.get(cp5.get(Textfield.class, str(id)+"X").getText());
    } else {                                                                    //ellers brug den værdi feltet har (bogstaver har værdien 0)
      tegnX = int(cp5.get(Textfield.class, str(id)+"X").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"Y").getText())) {
      tegnY = Variabler.get(cp5.get(Textfield.class, str(id)+"Y").getText());
    } else {
      tegnY = int(cp5.get(Textfield.class, str(id)+"Y").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"B").getText())) {
      brede = Variabler.get(cp5.get(Textfield.class, str(id)+"B").getText());
    } else {
      brede = int(cp5.get(Textfield.class, str(id)+"B").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"H").getText())) {
      hoejde = Variabler.get(cp5.get(Textfield.class, str(id)+"H").getText());
    } else {
      hoejde = int(cp5.get(Textfield.class, str(id)+"H").getText());
    }
  }


  void koerFunktion() {
    aendreVærdier();  //opdaterer værdierne
    if (Variabler.hasKey("farveR")) {                                                    //Hvis der er en anden farve i directory brug den
      fill(Variabler.get("farveR"), Variabler.get("farveG"), Variabler.get("farveB"));
    } else {
      fill(0);
    }
    rect(tegnX + View.getVisuX(), tegnY + View.getVisuY(), brede, hoejde);
  }

  void sletTextfelt(int i) {
    cp5.remove(str(i)+"X");
    cp5.remove(str(i)+"Y");
    cp5.remove(str(i)+"H");
    cp5.remove(str(i)+"B");
  }
}


//-----------------------------TegnCirkel Blok-----------------------------//

class TegnCirkel extends Blok {
  int tegnX;
  int tegnY;
  int diameter;

  TegnCirkel(int x, int y, int i) { //skal tage tre inputs fra initialiseringen af objektet
    super(x, y, i);
    farve = #51E0A6; //cyan

    // de textfelter som information skal skrives i
    cp5.addTextfield(str(id) + "X").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "Y").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "D").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
  }


  void drawBlok() {  //tegner hele blokken
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);

    //tegnet for blokken
    fill(0);
    circle(xPos - blokBrede/2 + 20, yPos - blokHoejde/2 + 20, 26);

    //beskrivelse af input
    textSize(20);
    textAlign(LEFT);
    text("x       y       d", xPos - blokBrede/2 + 70, yPos - 2);
    text("circle(   x   ,   y   ,   d    )", xPos - blokBrede/2 + 5, yPos + 20);

    //tegn textfelterne på blokken
    cp5.getController(str(id)+"X").setVisible(true);
    cp5.getController(str(id)+"X").setPosition(xPos - blokBrede/2 + 57, yPos + 5);
    cp5.getController(str(id)+"Y").setVisible(true);
    cp5.getController(str(id)+"Y").setPosition(xPos - blokBrede/2 + 96, yPos + 5);
    cp5.getController(str(id)+"D").setVisible(true);
    cp5.getController(str(id)+"D").setPosition(xPos - blokBrede/2 + 135, yPos + 5);
  }

  void aendreVærdier() {  //tager værdier fra brugeren/variabler og gemme dem så de kan bruges
    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"X").getText())) {
      tegnX = Variabler.get(cp5.get(Textfield.class, str(id)+"X").getText());
    } else {
      tegnX = int(cp5.get(Textfield.class, str(id)+"X").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"Y").getText())) {
      tegnY = Variabler.get(cp5.get(Textfield.class, str(id)+"Y").getText());
    } else {
      tegnY = int(cp5.get(Textfield.class, str(id)+"Y").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"D").getText())) {
      diameter = Variabler.get(cp5.get(Textfield.class, str(id)+"D").getText());
    } else {
      diameter = int(cp5.get(Textfield.class, str(id)+"D").getText());
    }
  }


  void koerFunktion() {
    aendreVærdier();  //opdaterer værdierne
    if (Variabler.hasKey("farveR")) {
      fill(Variabler.get("farveR"), Variabler.get("farveG"), Variabler.get("farveB"));
    } else {
      fill(0);
    }
    circle(tegnX + View.getVisuX(), tegnY + View.getVisuY(), diameter);
  }


  void sletTextfelt(int i) {
    cp5.remove(str(i)+"X");
    cp5.remove(str(i)+"Y");
    cp5.remove(str(i)+"D");
  }
}


//----------------------------- SkiftFarve Blok-----------------------------//

class SkiftFarve extends Blok {
  int farveR;
  int farveG;
  int farveB;


  SkiftFarve(int x, int y, int i) { //skal tage tre inputs fra initialiseringen af objektet
    super(x, y, i);
    farve = #FFFFFF; //hvid

    // de textfelter som information skal skrives i
    cp5.addTextfield(str(id) + "R").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "G").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
    cp5.addTextfield(str(id) + "B").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);
  }

  void drawBlok() {  //tegner hele blokken
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);

    //beskrivelse af input
    fill(0);
    textSize(20);
    textAlign(LEFT);
    text("R       G       B", xPos - blokBrede/2 + 57, yPos - 2);
    text("fill(   x   ,   y   ,   r    )", xPos - blokBrede/2 + 20, yPos + 20);

    //tegn textfelterne på blokken
    cp5.getController(str(id)+"R").setVisible(true);
    cp5.getController(str(id)+"R").setPosition(xPos - blokBrede/2 + 49, yPos + 5);
    cp5.getController(str(id)+"G").setVisible(true);
    cp5.getController(str(id)+"G").setPosition(xPos - blokBrede/2 + 88, yPos + 5);
    cp5.getController(str(id)+"B").setVisible(true);
    cp5.getController(str(id)+"B").setPosition(xPos - blokBrede/2 + 127, yPos + 5);
  }


  void aendreVærdier() {  //tager værdier fra brugeren/variabler og gemme dem så de kan bruges
    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"R").getText())) {
      farveR = Variabler.get(cp5.get(Textfield.class, str(id)+"R").getText());
    } else {
      farveR = int(cp5.get(Textfield.class, str(id)+"R").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"G").getText())) {
      farveG = Variabler.get(cp5.get(Textfield.class, str(id)+"G").getText());
    } else {
      farveG = int(cp5.get(Textfield.class, str(id)+"G").getText());
    }

    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"B").getText())) {
      farveB = Variabler.get(cp5.get(Textfield.class, str(id)+"B").getText());
    } else {
      farveB = int(cp5.get(Textfield.class, str(id)+"B").getText());
    }
  }


  void koerFunktion() {  //Opretter eller ændre de variabler som holder farveværdier
    aendreVærdier();
    Variabler.set("farveR", farveR);
    Variabler.set("farveG", farveG);
    Variabler.set("farveB", farveB);
  }


  void sletTextfelt(int i) {
    cp5.remove(str(i)+"R");
    cp5.remove(str(i)+"G");
    cp5.remove(str(i)+"B");
  }
}

//----------------------------- Variabel Blok-----------------------------//

class Variabel extends Blok {
  String Navn;
  int Vaerdi;


  Variabel(int x, int y, int i) { //skal tage tre inputs fra initialiseringen af objektet
    super(x, y, i);
    farve = #919AF7; //blå

    // de textfelter som information skal skrives i
    cp5.addTextfield(str(id) + "N").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);    //Navn
    cp5.addTextfield(str(id) + "V").setSize(30, 20).setVisible(false).setLabel("").setFont(createFont("arial", 17)).setAutoClear(false);    //Værdi
  }

  void drawBlok() {  //tegner hele blokken
    fill(farve);
    rectMode(CENTER);
    rect(xPos, yPos, blokBrede, blokHoejde);

    //beskrivelse af input
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Navn     Værdi", xPos, yPos - 5);
    text("N     =       V", xPos, yPos + 20);

    //tegn textfelterne på blokken
    cp5.getController(str(id)+"N").setVisible(true);
    cp5.getController(str(id)+"N").setPosition(xPos - blokBrede/2 + 50, yPos + 3);
    cp5.getController(str(id)+"V").setVisible(true);
    cp5.getController(str(id)+"V").setPosition(xPos - blokBrede/2 + 115, yPos + 3);
  }


  void aendreVærdier() {
    Navn = cp5.get(Textfield.class, str(id)+"N").getText();
    
    if (Variabler.hasKey(cp5.get(Textfield.class, str(id)+"V").getText())) {
      Vaerdi = Variabler.get(cp5.get(Textfield.class, str(id)+"V").getText());
    } else {
      Vaerdi = int(cp5.get(Textfield.class, str(id)+"V").getText());
    }
  }


  void koerFunktion() {   //Opretter eller ændre variablen i directory Variabler
    aendreVærdier();
    Variabler.set(Navn, Vaerdi);
  }


  void sletTextfelt(int i) {
    cp5.remove(str(i)+"N");
    cp5.remove(str(i)+"V");
  }
}
