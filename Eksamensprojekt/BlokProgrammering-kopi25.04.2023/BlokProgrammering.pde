//Controler

int grebetId = 0;   //For at Flere blokke ikke flyttes på samme tid
int givId = 1;

View View;      //deklarerer objektet med navn View til classen View

ArrayList<Blok> VisuBlokke;  //liste med de blokke som kan vælges i menuen så jeg ikke skal programmere det visueller for blokkene to gange
ArrayList<Blok> Blokke;      //liste med de blokke som er lavet og eksisterer
IntList Program;
//ArrayList Program;


void setup() {
  size(1300, 800);

  View = new View();
  VisuBlokke = new ArrayList<Blok>();
  Blokke = new ArrayList<Blok>();
  Program = new IntList();
  //Program = new ArrayList<Blok>();



  VisuBlokke.add(new TegnForm(1125, 175, givId++));
  VisuBlokke.add(new FlytForm(1125, 300, givId++));
}

void draw() {
  //background(255);

  View.drawView();
  View.opdaterBlokke();
}


void kørProgram() {
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

void stepProgram() {
}


void mousePressed() {
  //Tager id for det element som musen er over for at undgå at tage flere ting af gangen
  for (int i = Blokke.size(); i > 0; i--) {
    Blok Part = Blokke.get(i-1);
    if (mouseX > Part.getXPos() - Part.getBrede()/2 && mouseX < Part.getXPos() + Part.getBrede()/2 && mouseY > Part.getYPos() - Part.getHoejde()/2 && mouseY < Part.getYPos() + Part.getHoejde()/2) {
      grebetId = Part.getId();
      return; //slutter funktionen før den fortsætter
    }
  }


  //laver ny blok og tilføjer til listen med blokke
  for (int i = 0; i < VisuBlokke.size(); i ++) {
    Blok Part = VisuBlokke.get(i);
    if (mouseX > Part.getXPos() - Part.getBrede()/2 && mouseX < Part.getXPos() + Part.getBrede()/2 && mouseY > Part.getYPos() - Part.getHoejde()/2 && mouseY < Part.getYPos() + Part.getHoejde()/2) {
      if (i == 0) {
        Blokke.add(new TegnForm(mouseX, mouseY, givId));
      } else if (i == 1) {
        Blokke.add(new FlytForm(mouseX, mouseY, givId));
      }
      grebetId = givId;
      givId++;
    }
  }
}


void mouseReleased() {
  // Sætter blokke på Programmeringslisten
  if (mouseX > View.getProgX() && mouseX < View.getProgX() + View.getProgBrede() && mouseY > View.getProgY()) {

    if (Program.size() == 0) {
      for (int i = 0; i < Blokke.size(); i ++) {
        Blok Part = Blokke.get(i);
        if (Part.getId() == grebetId) {
          Part.setYPos(View.getProgY() + Part.getHoejde()/2 + 10);
          Part.setXPos(View.getProgX() + View.getProgBrede()/2);
        }
      }
    } else if (Program.size() > 0) {
      for (int i = 0; i < Blokke.size(); i ++) {
        Blok Part = Blokke.get(i);
        if (Part.getId() == grebetId) {
          Part.setYPos(View.getProgY() + Part.getHoejde()/2 + 10);
          Part.setXPos(View.getProgX() + View.getProgBrede()/2);
        }
      }
    }




    if (!Program.hasValue(grebetId)) {
      Program.append(grebetId);
    }
  }

  //fjerner en blok fra programmet når den flyttes ud af programmeringslisten
  if (!(mouseX > View.getProgX() && mouseX < View.getProgX() + View.getProgBrede() && mouseY > View.getProgY() && mouseY < View.getProgY() + View.getProgHoejde()) && Program.hasValue(grebetId)) {
    Program.remove(Program.index(grebetId));
  }


  grebetId = 0; //for at man ikke samler en blok op når der ikke trykkes på noget
}



void mouseClicked() {
  // Play knap
  if (mouseX > View.getPlayX() && mouseX < View.getPlayX() + View.getPlayBrede() && mouseY > View.getPlayY() && mouseY < View.getPlayY() + View.getPlayHoejde()) {
    kørProgram();
  }

  // Clear knap
  if (mouseX > View.getClearX() && mouseX < View.getClearX() + View.getClearBrede() && mouseY > View.getClearY() && mouseY < View.getClearY() + View.getClearHoejde()) {
    Program.clear();
    Blokke.clear();
    fill(255);
    rectMode(CORNER);
    rect(View.getVisuX(), View.getVisuY(), View.getVisuBrede(), View.getVisuHoejde());
  }
}
