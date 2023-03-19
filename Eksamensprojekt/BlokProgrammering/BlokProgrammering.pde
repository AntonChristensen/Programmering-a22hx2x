int grebetId = 0;

ArrayList<Blok> MaserBlokke = new ArrayList<Blok>();
ArrayList<Blok> Blokke = new ArrayList<Blok>();


void setup() {
  size(1200, 800);
  Blokke.add(new Blok(400, 200, 1));
  Blokke.add(new Blok(400, 500, 2));
}

void draw() {
  background(255);
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
    if (mouseX > part.xPos - part.brede/2 && mouseX < part.xPos + part.brede/2 && mouseY > part.yPos - part.hoejde/2 && mouseY < part.yPos + part.hoejde/2) {
      grebetId = part.id;
    }
  }


  //Laver blokke og ligger dem i listen
}


void mouseReleased() {
  grebetId = 0;
}
