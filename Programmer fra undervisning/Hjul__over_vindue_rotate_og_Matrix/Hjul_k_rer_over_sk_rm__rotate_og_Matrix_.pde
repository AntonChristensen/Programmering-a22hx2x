float oldframe = 0.0;

void setup() {
  size(600, 400);
}

void draw() {
  background(255);

  sorthjul();
}

void sorthjul() {
  pushMatrix(); //gemmer kanvans placering
  translate(frameCount - oldframe, (height-50)); //flytter kanvas så 0,0 er på forskellen mellem framecont og oldframecont, height-50
  rotate(frameCount/70.0); //roterer kanvas omkring det nye 0,0

  strokeWeight(5); //sætter tykkelsen af de følgende linjer
  circle(0, 0, 100); //tegner en cirkel på nye punkt 0,0 med diameter 100
  
  for (int i = 0; i < 3; i++) { //tegner 3 linjer
    line(0, -50, 0, 0);
    rotate(radians(360/3));
  }

  
  popMatrix(); // sætter kanvas tilbage så 0,0 er i oprindeligt 0,0
  if (frameCount - oldframe > 650){
    oldframe = frameCount - oldframe + 50; //sætter oldframe så frameCount - oldframe i translate starter udenfor canvas i venstre side
  }
}
