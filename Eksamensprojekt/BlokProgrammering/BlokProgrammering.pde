int grebetId = 0;

View View = new View();

ArrayList<Blok> MaserBlokke = new ArrayList<Blok>();
ArrayList<Blok> Blokke = new ArrayList<Blok>();



void setup() {
  size(1300, 800);
  Blokke.add(new TegnForm(1125, 175, 1, "FIRKANT"));
  Blokke.add(new FlytForm(1125, 300, 2));
}

void draw() {
  background(255);
  View.drawView();
  for (int i = 0; i < Blokke.size(); i ++) {
    Blok part = Blokke.get(i);
    part.moveBlok(grebetId);
    part.drawBlok();
  }



  //Tegner visualisering af masterblokke
  
  
  
}

void mousePressed() {

  // Tager id for det element som musen er over for at undgå at tage flere ting af gangen
  for (int i = 0; i < Blokke.size(); i ++) {
    Blok part = Blokke.get(i);
    if (mouseX > part.getXPos() - part.getBrede()/2 && mouseX < part.getXPos() + part.getBrede()/2 && mouseY > part.getYPos() - part.getHoejde()/2 && mouseY < part.getYPos() + part.getHoejde()/2) {
      grebetId = part.getId();
    }
  }


  //Laver blokke og ligger dem i listen
}


void mouseReleased() {
  grebetId = 0;
}
