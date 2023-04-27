class View {
  int blokListeX = 30;
  int blokListeY = 100;
  int blokListeBrede = 230;
  int blokListeHoejde = 695;

  int progX = blokListeX + blokListeBrede + 30;
  int progY = 100;
  int progBrede = blokListeBrede;
  int progHoejde = blokListeHoejde;

  int visuX = progX + progBrede + 50;
  int visuY = 100;
  int visuBrede = 700;
  int visuHoejde = 600;

  int playX = progX;
  int playY = progY-70;
  int playBrede = 100;
  int playHoejde = 50;

  int stepBrede = playBrede;
  int stepHoejde = playHoejde;
  int stepY = playY;
  int stepX = progX + progBrede - stepBrede;

  int clearX = blokListeX;
  int clearY = playY;
  int clearBrede = blokListeBrede/2 - 5;
  int clearHoejde = playHoejde;

  int yPlaceringProgram = progY + 15;  //bruges til at have en rækkefølge i programmeringsruden


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


    //tegn blokke på programmeringslisten
    for (int i = 0; i < Program.size(); i++) {
      for (int j = 0; j < Blokke.size(); j ++) {
        Blok Part = Blokke.get(j);
        if (Part.getId() == Program.get(i)) {
          Part.setXPos(View.getProgX() + View.getProgBrede()/2);
          Part.setYPos(View.getProgY() + Part.getHoejde()/2 + 15 + (Part.getHoejde()  + 15) * i);
        }
      }
    }
  }

  int getVisuX() {
    return visuX;
  }

  int getVisuY() {
    return visuY;
  }

  int getVisuBrede() {
    return visuBrede;
  }

  int getVisuHoejde() {
    return visuHoejde;
  }

//-------------------------------------------//

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

//-------------------------------------------//

  int getPlayX() {
    return playX;
  }

  int getPlayY() {
    return playY;
  }

  int getPlayBrede() {
    return playBrede;
  }

  int getPlayHoejde() {
    return playHoejde;
  }

//-------------------------------------------//

  int getStepX() {
    return stepX;
  }

  int getStepY() {
    return stepY;
  }

  int getStepBrede() {
    return stepBrede;
  }

  int getStepHoejde() {
    return stepHoejde;
  }
  
//-------------------------------------------//

  int getClearX() {
    return clearX;
  }

  int getClearY() {
    return clearY;
  }

  int getClearBrede() {
    return clearBrede;
  }

  int getClearHoejde() {
    return clearHoejde;
  }
  
//-------------------------------------------//

  int getBlokListeX() {
    return blokListeX;
  }

  int getBlokListeY() {
    return blokListeY;
  }

  int getBlokListeBrede() {
    return blokListeBrede;
  }

  int getBlokListeHoejde() {
    return blokListeHoejde;
  }


  void opdaterBlokke() { //Står for at flytte og tegne blokke
    for (int i = 0; i < Blokke.size(); i ++) {
      Blok Part = Blokke.get(i);
      Part.moveBlok(grebetId);
      Part.drawBlok();
    }
  }
}
