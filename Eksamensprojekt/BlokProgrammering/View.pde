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

  int clearAllX = blokListeX;
  int clearAllY = playY;
  int clearAllBrede = blokListeBrede/2 - 5;
  int clearAllHoejde = playHoejde;

  int clearCanvasBrede = blokListeBrede/2 - 5;
  int clearCanvasHoejde = playHoejde;
  int clearCanvasX = blokListeX + blokListeBrede - clearCanvasBrede;
  int clearCanvasY = playY;

  boolean stepKoert = false;  // er Step blevet kørt?
  int tegnStep = step;        //kopi af step for at tegne markering


  //Cunstuctor
  View() {
  }



  void nulstilKanvas() {
    fill(255);
    rectMode(CORNER);
    rect(visuX, visuY, visuBrede, visuHoejde);   //nulstiller det visuelle område
  }




  void drawView() {

    //Tegner baggrunden i programmet når programmet ikke er kørt
    if (!koert) {
      background(255);
    }

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


    //clear all
    fill(255, 0, 0, 190);
    rect(clearAllX, clearAllY, clearAllBrede, clearAllHoejde);
    textAlign(CORNER);
    fill(255);
    textSize(clearAllHoejde * 0.7);
    text("Clear", clearAllX +5, clearAllY + clearAllHoejde/2 +5);
    textSize(clearAllHoejde * 0.6);
    text("all", clearAllX + clearAllBrede/2 + 18, clearAllY + clearAllHoejde-2);


    //clear canvas
    fill(255, 0, 0, 190);
    rect(clearCanvasX, clearCanvasY, clearCanvasBrede, clearCanvasHoejde);
    textAlign(CORNER);
    fill(255);
    textSize(clearCanvasHoejde * 0.7);
    text("Clear", clearCanvasX +5, clearCanvasY + clearCanvasHoejde/2 +5);
    textSize(clearCanvasHoejde * 0.6);
    text("canvas", clearCanvasX + 20, clearCanvasY + clearCanvasHoejde-2);


    //tegner alle blokke i Visumenu
    for (int i = 0; i < VisuBlokke.size(); i ++) {
      Blok Part = VisuBlokke.get(i);
      Part.drawBlok();
    }


    //tegner markeringen ved step
    if (Program.size() != 0 && stepKoert) {
      fill(0, 100);
      rectMode(CENTER);
      Blok StepPart = Blokke.get(tegnStep);
      rect(progX + progBrede/2, progY + StepPart.getHoejde()/2 + 15 + (StepPart.getHoejde()  + 15) * tegnStep, StepPart.getBrede() + 15/2, StepPart.getHoejde() + 15/2);
    }


    //tegn blokke på programmeringslisten
    for (int i = 0; i < Program.size(); i++) {
      for (int j = 0; j < Blokke.size(); j ++) {
        Blok Part = Blokke.get(j);
        if (Part.getId() == Program.get(i)) {
          Part.setXPos(progX + progBrede/2);
          Part.setYPos(progY + Part.getHoejde()/2 + 15 + (Part.getHoejde()  + 15) * i);
        }
      }
    }
  }




  void opdaterBlokke() {    //Står for at flytte og tegne blokke og starte baggrundstegner igen
    for (int i = 0; i < Blokke.size(); i ++) {
      Blok Part = Blokke.get(i);
      Part.moveBlok(grebetId);
      Part.drawBlok();
    }
  }




  //------ Her starter getter og setters ------//

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

  int getClearAllX() {
    return clearAllX;
  }

  int getClearAllY() {
    return clearAllY;
  }

  int getClearAllBrede() {
    return clearAllBrede;
  }

  int getClearAllHoejde() {
    return clearAllHoejde;
  }

  //-------------------------------------------//

  int getClearCanvasX() {
    return clearCanvasX;
  }

  int getClearCanvasY() {
    return clearCanvasY;
  }

  int getClearCanvasBrede() {
    return clearCanvasBrede;
  }

  int getClearCanvasHoejde() {
    return clearCanvasHoejde;
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

  //-------------------------------------------//

  void setTegnStep(int nyTegnStep) {
    tegnStep = nyTegnStep;
  }

  void setStepKoert(boolean nyStepKoert) {
    stepKoert = nyStepKoert;
  }
}
