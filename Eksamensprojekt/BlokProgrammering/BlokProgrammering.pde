//Controler

int grebetId = 0;   //For at Flere blokke ikke flyttes på samme tid
int givId = 1;
int xPlaceringProgram;

View View;      //deklarerer objektet med navn View til classen View

ArrayList<Blok> VisuBlokke;  //liste med de blokke som kan vælges i menuen så jeg ikke skal programmere det visueller for blokkende to gange
ArrayList<Blok> Blokke;      //liste med de blokke som ikke er i et program
//IntList Program;
ArrayList Program;


void setup() {
  size(1300, 800);

  View = new View();
  VisuBlokke = new ArrayList<Blok>();
  Blokke = new ArrayList<Blok>();
  //Program = new IntList();
  Program = new ArrayList<Blok>();

  xPlaceringProgram = View.getProgX() + 20;  //bruges til at have en rækkefølge i programmeringsruden

  VisuBlokke.add(new TegnForm(1125, 175, givId++));
  VisuBlokke.add(new FlytForm(1125, 300, givId++));
}

void draw() {
  background(255);
  View.drawView();
  View.opdaterBlokke();
}


void kørProgram() {
  for  (int i = 0; i < Program.size(); i++) {
    
  }
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
  if (mouseX > View.getProgX() && mouseX < View.getProgX() + View.getProgBrede() && mouseY > View.getProgY() && mouseY < View.getProgY() + View.getProgHoejde()) {
    if (!Program.hasValue(grebetId)) {
      Program.append(grebetId);
    }
    //Blokke.getXPos();
  }

  grebetId = 0; //for at man ikke samler en blok op når der ikke trykkes på noget
}
