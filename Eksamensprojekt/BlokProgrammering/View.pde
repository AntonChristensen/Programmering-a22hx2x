class View {
  int progX = 50;
  int progY = 100;
  int progBrede = 250;
  int progHoejde = 600;

  int visuX = progX + progBrede + 50;
  int visuY = 100;
  int visuBrede = 600;
  int visuHoejde = 600;

  int blokListeX = visuX + visuBrede + 50;
  int blokListeY = 100;
  int blokListeBrede = progBrede;
  int blokListeHoejde = progHoejde;

  int playX = progX;
  int playY = progY-70;
  int playBrede = 100;
  int playHoejde = 50;

  int stepBrede = playBrede;
  int stepHoejde = playHoejde;
  int stepY = playY;
  int stepX = progX + progBrede - stepBrede;

  int delX = blokListeX;
  int delY = playY;
  int delBrede = blokListeBrede/2 - 5;
  int delHoejde = playHoejde;

  int clearX = blokListeX + delBrede + 10;
  int clearY = playY;
  int clearBrede = blokListeBrede/2 - 5;
  int clearHoejde = playHoejde;

  //Cunstuctor
  View() {
  }

  void drawView() {

    //Visuel område til at vise koden
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(0, 0, width, visuY);
    rect(visuX + visuBrede, 0, width, height);
    rect(0, visuY + visuHoejde, width, height);
    rect(0, 0, visuX, height);
    stroke(0);
    noFill();
    rect(visuX, visuY, visuBrede, visuHoejde);

    //Forklaring til det visuelle område
    textAlign(CENTER, BOTTOM);
    textSize(30);
    fill(0);
    text("(0,0)", visuX, visuY);
    text("("+visuBrede+",0)", visuX + visuBrede, visuY);
    textAlign(CENTER, TOP);
    text("(0,"+visuHoejde+")", visuX, visuY + visuHoejde);


    //programmeringsliste
    fill(240);
    rect(progX, progY, progBrede, progHoejde);


    //Blokliste
    fill(240);
    rect(blokListeX, blokListeY, blokListeBrede, blokListeHoejde);


    //Playknappen
    fill(0);
    rect(playX, playY, playBrede, playHoejde);
    textAlign(CENTER);
    fill(255);
    textSize(playHoejde);
    text("Play", playX+playBrede/2, playY+playHoejde-12);


    //Stepknappen
    fill(0);
    rect(stepX, stepY, stepBrede, stepHoejde);
    textAlign(CENTER);
    fill(255);
    textSize(stepHoejde);
    text("Step", stepX+stepBrede/2, stepY+stepHoejde-12);


    //Delete område
    fill(255, 0, 0, 190);
    rect(delX, delY, delBrede, delHoejde);
    textAlign(CENTER);
    fill(255);
    textSize(delHoejde * 0.85);
    text("Delete", delX+delBrede/2, delY+delHoejde-7);


    //clear
    fill(255, 0, 0, 190);
    rect(clearX, clearY, clearBrede, clearHoejde);
    textAlign(CENTER);
    fill(255);
    textSize(clearHoejde * 0.85);
    text("Clear", clearX+clearBrede/2, clearY+clearHoejde-7);


    //tegn de blokke man kan trække
    for (int i = 0; i < VisuBlokke.size(); i ++) {
      Blok Part = VisuBlokke.get(i);
      Part.drawBlok();
    }
  }

  int getVisuX() {
    return visuX;
  }

  int getVisuY() {
    return visuY;
  }

  
  int getProgX() {
    return progX;
  }
  
  int getProgY() {
    return progY;
  }
  
  int getProgBrede() {
    return progBrede;
  }
  
  int getProgHoejde() {
    return progHoejde;
  }
}
