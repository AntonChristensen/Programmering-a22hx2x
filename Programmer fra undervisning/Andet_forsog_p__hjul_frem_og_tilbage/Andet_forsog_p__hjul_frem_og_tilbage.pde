
float x = -75;
float x1 = -50;
char rl = 'r';
int j = 0;
float oldframe = 0.0;

void setup() {
  size(400, 200);
}


void draw() {
  background(255);

  sorthjul();
  rodthjul();
}
/*
void sorthjul() {
  stroke(0.0);
  pushMatrix(); //gemmer kanvans placering
  translate(x, (height-50)); //flytter kanvas så 0,0 er på x, height-50
  rotate(frameCount/70.0); //roterer kanvas omkring det nye 0,0

  strokeWeight(5); //sætter tykkelsen af de følgende linjer
  circle(0, 0, 100); //tegner en cirkel på nye punkt 0,0 med diameter 100

  for (int i = 0; i < 3; i++) { //tegner 3 linjer
    line(0, -50, 0, 50);
    rotate(radians(360/3));
  }

  x = x + 1; //flytter hjul
  popMatrix(); // sætter kanvas tilbage så 0,0 er i oprindeligt 0,0

  if (x > width + 50) {
    x = -50;
  }
}
*/

void rodthjul() {
  stroke(250, 0, 0);
  pushMatrix(); //gemmer kanvans placering
  translate(frameCount - oldframe, (height-50)); //flytter kanvas så 0,0 er på x, height-50

  strokeWeight(5); //sætter tykkelsen af de følgende linjer
  circle(0, 0, 100); //tegner en cirkel på nye punkt 0,0 med diameter 100

  if (rl == 'r') {
    x1 = x1 + 1;
    rotate(frameCount/70.0); //roterer kanvas omkring det nye 0,0
  } else {
    x1 = x1 - 1;
    rotate(-frameCount/70.0); //roterer kanvas negativt omkring det nye 0,0
  }

  j =0;
  while (j < 3) { //tegner 3 linjer
    line(0, -50, 0, 50);
    rotate(radians(360/3));
    j++;
  }

  if (x1 > width-50) {
    rl = 'l';
  } else if (x1 < 50) {
    rl = 'r';
  }

if (frameCount - oldframe > 650){
    oldframe = frameCount - oldframe + 50; //sætter oldframe så frameCount - oldframe i translate starter udenfor canvas i venstre side
  }

  popMatrix(); // sætter kanvas tilbage så 0,0 er i oprindeligt 0,0
  
  
  
  
  
}
