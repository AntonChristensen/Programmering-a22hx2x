int xStart, yStart, xSlut, ySlut;
boolean mouseReleased;
Raket enesteRaket;
ArrayList<Raket> raketter = new ArrayList<Raket>();

void setup() {
  size(800, 800);
  xStart = 0;
  yStart = 0;
  xSlut = 0;
  ySlut = 0;
  mouseReleased = false;
}

void draw() {
  //fill(0,10);
  //rect(0,0,width,height);
  background(0);
  if (mousePressed) {
    strokeWeight(2);
    stroke(255);
    line(xStart, yStart, mouseX, mouseY);
  }
  if (mouseReleased) {
    //enesteRaket.moveRaket();
    for (int i = 0; i < raketter.size(); i++) {
      Raket part = raketter.get(i);
      part.moveRaket();
    }
  }
}


void mousePressed() {
  xStart = mouseX;
  yStart = mouseY;

  for (int i = raketter.size() - 1; i >= 0; i--) {
    Raket part = raketter.get(i);
    if (part.finished()) {
      raketter.remove(i);
    }
  }
  println(raketter.size());
}

void mouseReleased() {
  //enesteRaket = new Raket(xStart, yStart, mouseX, mouseY);
  raketter.add(new Raket(xStart, yStart, mouseX, mouseY));
  mouseReleased = true;
}
