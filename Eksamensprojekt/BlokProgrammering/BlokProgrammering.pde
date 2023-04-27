//Controler

import controlP5.*; // importerer biblioteket controlP5
ControlP5 cp5;

int grebetId = 0;   //For at få information om hvilken blok der er fat i
int givId = 1;      //Bruges til når nye blokke skal laves
int step = 0;       //Tæller hvilket step i programmet man er på så der kun vises det som der skal i det visuelle område

View View;          //instanserer klassen View så objektet View oprettes

ArrayList<Blok> VisuBlokke;  //instanserer liste med de blokke som kan vælges i menuen så jeg ikke skal programmere det visuelle for blokkene to gange
ArrayList<Blok> Blokke;      //instanserer liste med alle de blokke som er lavet og eksisterer
IntList Program;             //deklarerer liste over Id på de blokke som er i brugerens program



void setup() {
  size(1320, 810);

  View = new View();                   //initierer et View som styrer alt det visuelle
  VisuBlokke = new ArrayList<Blok>();  //initierer listen med Blokke i menuen
  Blokke = new ArrayList<Blok>();      //initierer listen med alle eksisterende blokke
  Program = new IntList();             //initierer listen over Id i brugerens program

  cp5 = new ControlP5(this);           //initierer min inputkontrol

  VisuBlokke.add(new TegnKvadrat(145, 150, givId++));    //Tilføjer blokkene til den Visuelle liste
  VisuBlokke.add(new TegnCirkel(145, 235, givId++));
  VisuBlokke.add(new FlytForm(145, 320, givId++));
}




void draw() {
  //background(255);
  //kørProgram();// ikke endelig løsning
  View.drawView();        //Tegner alt stillestående i programmet
  View.opdaterBlokke();   //Opdaterer placering og tegner bevægende blokke
}




//Kører igennem alle blokke i brugerens program og kører deres funktion
void koerProgram() {
  fill(255);
  rectMode(CORNER);
  rect(View.getVisuX(), View.getVisuY(), View.getVisuBrede(), View.getVisuHoejde());   //nulstiller det visuelle område
  for  (int i = 0; i < Program.size(); i++) {
    //println("Id fra program index:"+i+" Id:"+Program.get(i));
    for (int j = 0; j < Blokke.size(); j ++) {
      Blok Part = Blokke.get(j);
      if (Part.getId() == Program.get(i)) {
        //println("Id:"+Program.get(i)+" ; j:"+j);
        Part.koerFunktion();
      }
    }
  }
}




//Stepper igennem alle blokke i brugerens program og kører deres funktion
void stepProgram(int steppet) {
  fill(255);
  rectMode(CORNER);
  rect(View.getVisuX(), View.getVisuY(), View.getVisuBrede(), View.getVisuHoejde());   //nulstiller det visuelle område
  for  (int i = 0; i <= steppet; i++) {
    for (int j = 0; j < Blokke.size(); j ++) {
      Blok Part = Blokke.get(j);
      if (Part.getId() == Program.get(i)) {
        Part.koerFunktion();
      }
    }
  }
}




void mousePressed() {
  //Tager id for det element som musen er over for at undgå at tage flere ting af gangen
  for (int i = Blokke.size(); i > 0; i--) {    //Kører listen igennem bagfra for at man får fat i det element som tegnes øverst
    Blok Part = Blokke.get(i-1);
    if ((mouseX > Part.getXPos() - Part.getBrede()/2 && mouseX < Part.getXPos() + Part.getBrede()/2 && mouseY > Part.getYPos() - Part.getHoejde()/2 && mouseY < Part.getYPos() + Part.getHoejde()/2)) {
      grebetId = Part.getId();    //Tager id fra den blok som man har fat i
      return; //slutter mousePressed() før den fortsætter
    }
  }


  //laver ny blok og tilføjer til listen med blokke
  for (int i = 0; i < VisuBlokke.size(); i ++) {
    Blok Part = VisuBlokke.get(i);
    if (mouseX > Part.getXPos() - Part.getBrede()/2 && mouseX < Part.getXPos() + Part.getBrede()/2 && mouseY > Part.getYPos() - Part.getHoejde()/2 && mouseY < Part.getYPos() + Part.getHoejde()/2) {
      if (i == 0) {
        Blokke.add(new TegnKvadrat(mouseX, mouseY, givId));
      } else if (i == 1) {
        Blokke.add(new TegnCirkel(mouseX, mouseY, givId));
      } else if (i == 2) {
        Blokke.add(new FlytForm(mouseX, mouseY, givId));
      }
      grebetId = givId;   //Gør så man kan flytte på en blok lige efter man har levet den
      givId++;            //tæller givId op så den næste instans af en blok ikke har samme id som en eksisterende
    }
  }
}




void mouseReleased() {
  // Sætter blokke på Programmeringslisten hvis musen er over det område
  if (mouseX > View.getProgX() && mouseX < View.getProgX() + View.getProgBrede() && mouseY > View.getProgY() && mouseY < View.getProgY() + View.getProgHoejde()) {
    if (!Program.hasValue(grebetId) && grebetId != 0) {  //Sæt Id på listen hvis det ikke allerede er der
      Program.append(grebetId);
    }
  }


  //fjerner en blok fra programmet når den flyttes ud af programmeringslisten
  if (!(mouseX > View.getProgX() && mouseX < View.getProgX() + View.getProgBrede() && mouseY > View.getProgY() && mouseY < View.getProgY() + View.getProgHoejde()) && Program.hasValue(grebetId)) {
    Program.remove(Program.index(grebetId));
  }


  //sletter en blok fra Bloklisten når den flyttes over i VisuListen
  if ((mouseX > View.getBlokListeX() && mouseX < View.getBlokListeX() + View.getBlokListeBrede() && mouseY > View.getBlokListeY() && mouseY < View.getBlokListeY() + View.getBlokListeHoejde())) {
    for (int i = 0; i < Blokke.size(); i ++) {
      Blok Part = Blokke.get(i);
      if (Part.getId() == grebetId) {
        Part.sletTextfelt(Part.getId());
        Blokke.remove(Blokke.indexOf(Part));
      }
    }
  }


  grebetId = 0; //for at man ikke samler en blok op når der ikke trykkes på nogen
}



void mouseClicked() {
  // Play knap, kører programmet
  if (mouseX > View.getPlayX() && mouseX < View.getPlayX() + View.getPlayBrede() && mouseY > View.getPlayY() && mouseY < View.getPlayY() + View.getPlayHoejde()) {
    koerProgram();
    step = 0;
  }


  // Step knap kører programmet et step af gangen
  if (mouseX > View.getStepX() && mouseX < View.getStepX() + View.getStepBrede() && mouseY > View.getStepY() && mouseY < View.getStepY() + View.getStepHoejde()) {
    stepProgram(step);
    if (step < Program.size()-1) {          //-1 fordi index 1 er outOfBounds på længden 1 i stepProgrram()
      step++;
    } else if (step == Program.size()-1) {  //Starter step-sekvenesn forfra hvis slutningen af brugerens program er nået
      step = 0;
    }
  }


  // ClearAll knap
  if (mouseX > View.getClearAllX() && mouseX < View.getClearAllX() + View.getClearAllBrede() && mouseY > View.getClearAllY() && mouseY < View.getClearAllY() + View.getClearAllHoejde()) {
    Program.clear();

    for (int i = 0; i < Blokke.size(); i ++) { // løber alle blokke igennem og sletter textfelterne
      Blok Part = Blokke.get(i);
      Part.sletTextfelt(Part.getId());
    }
    Blokke.clear(); // sletter alle blokkene så de ikke tegnes igen

    fill(255);
    rectMode(CORNER);
    rect(View.getVisuX(), View.getVisuY(), View.getVisuBrede(), View.getVisuHoejde());

    step = 0;  //nulstiller stepknappen
  }


  //Clear Canvas knap
  if (mouseX > View.getClearCanvasX() && mouseX < View.getClearCanvasX() + View.getClearCanvasBrede() && mouseY > View.getClearCanvasY() && mouseY < View.getClearCanvasY() + View.getClearCanvasHoejde()) {
    fill(255);
    rectMode(CORNER);
    rect(View.getVisuX(), View.getVisuY(), View.getVisuBrede(), View.getVisuHoejde());
    
    step = 0;  //nulstiller stepknappen
  }
}
