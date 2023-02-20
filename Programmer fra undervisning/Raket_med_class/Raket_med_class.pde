Raket thansen;
Raket[] batteri1 = new Raket[9];
Raket[] batteri2 = new Raket[9];
Raket[] batteri3 = new Raket[19];

void setup() {
  size(800, 800);

  //Batteri1
  for (int i = 0; i < batteri1.length; i++) {
    if (boolean(int(random(2)))) {
      batteri1[i] = new RaketCirkel(5, int(random(130, 130)), int(random(100, 200)), i*10+50);
    } else {
      batteri1[i] = new RaketStjerne(5, int(random(130, 130)), int(random(100, 200)), i*10+50);
    }
  }

  //Batteri2
  for (int i = 0; i < batteri2.length; i++) {
    if (boolean(int(random(2)))) {
      batteri2[i] = new RaketCirkel(5, int(random(130, 130)), int(random(100, 200)), i*10+50);
    } else {
      batteri2[i] = new RaketStjerne(5, int(random(130, 130)), int(random(100, 200)), i*10+50);
    }
  }

  //Batteri3
  for (int i = 0; i < batteri3.length; i++) {

    if (i < 9) {
      if (boolean(int(random(2)))) {
        batteri3[i] = new RaketCirkel(5, int(random(130, 130)), int(random(100, 200)), i*-8+126);
      } else {
        batteri3[i] = new RaketStjerne(5, int(random(130, 130)), int(random(100, 200)), i*-8+126);
      }
    } else {

      {
        if (boolean(int(random(2)))) {
          batteri3[i] = new RaketCirkel(5, int(random(100, 100)), int(random(100, 200)), (i-9)*8+54);
        } else {
          batteri3[i] = new RaketStjerne(5, int(random(100, 100)), int(random(100, 200)), (i-9)*8+54);
        }
      }
    }
  }
}

void draw() {
  //background(255);
  fill(255,10);
  rect(0,0,width,height);

  for (int i = 0; i < batteri1.length; i++) {
    if (frameCount > i * 10) {
      batteri1[i].skydRaket();
    }
  }

  if (frameCount > 250) {
    for (int i = 0; i < batteri2.length; i++) {
      batteri2[i].skydRaket();
    }
  }

  if (frameCount > 500) {
    for (int i = 0; i <batteri3.length; i++) {
      if (frameCount > (i * 5) + 500) {
        batteri3[i].skydRaket();
      }
    }
  }
}
