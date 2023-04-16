//Controler

int grebetId = 0;   //For at Flere blokke ikke flyttes på samme tid
int givId = 1;

View View = new View();

ArrayList<Blok> VisuBlokke = new ArrayList<Blok>();  //liste med de blokke som kan vælges i menuen så jeg ikke skal programmere det visueller for blokkende to gange
ArrayList<Blok> Blokke = new ArrayList<Blok>();      //liste med de blokke som ikke er i et program
//ArrayList<Blok> ProgamBlokke = new ArrayList<Blok>();//liste med de blokke som programmet kører        Det er ikke nødvendigt da jeg bare tilføjer deres id til en liste



void setup() {
  size(1300, 800);
  VisuBlokke.add(new TegnForm(1125, 175, givId++));
  VisuBlokke.add(new FlytForm(1125, 300, givId++));
}

void draw() {
  background(255);
  View.drawView();
  for (int i = 0; i < Blokke.size(); i ++) {
    Blok Part = Blokke.get(i);
    Part.moveBlok(grebetId);
    Part.drawBlok();
  }
}




void mousePressed() {
  //laver ny blok og tilføjer til listen med blokke
  for (int i = 0; i < VisuBlokke.size(); i ++) {
    Blok Part = VisuBlokke.get(i);
    if (mouseX > Part.getXPos() - Part.getBrede()/2 && mouseX < Part.getXPos() + Part.getBrede()/2 && mouseY > Part.getYPos() - Part.getHoejde()/2 && mouseY < Part.getYPos() + Part.getHoejde()/2) {
      if (i == 0) {
        Blokke.add(new TegnForm(mouseX, mouseY, givId++));
      } else if (i == 1) {
        Blokke.add(new FlytForm(mouseX, mouseY, givId++));
      }
      grebetId = givId;
    }
  }


  // Tager id for det element som musen er over for at undgå at tage flere ting af gangen
  for (int i = 0; i < Blokke.size(); i ++) {
    Blok Part = Blokke.get(i);
    if (mouseX > Part.getXPos() - Part.getBrede()/2 && mouseX < Part.getXPos() + Part.getBrede()/2 && mouseY > Part.getYPos() - Part.getHoejde()/2 && mouseY < Part.getYPos() + Part.getHoejde()/2) {
      grebetId = Part.getId();
    }
  }

}


void mouseReleased() {
  grebetId = 0;
}
