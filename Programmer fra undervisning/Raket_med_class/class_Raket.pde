class Raket {
  int r = int(random(0, 256));
  int g = int(random(0, 256));
  int b = int(random(0, 256));
  int krudt;
  float vinkel;
  int eksplosionRadius;
  boolean spraeng = false;
  int dia = 0;
  int alpha;



  PVector placering = new PVector(width/2, height);
  PVector hastighed;
  PVector vind = new PVector(0.7, 0);

  Raket (int h, int k, int e, float v) {
    hastighed = new PVector(h, 0); //hastigheden af raketten
    krudt = k; // afstand fra startpunkt til eksplotion
    eksplosionRadius = e;  //slutradius for eksplotionen
    alpha = e; // for at fade hastighed passer med slutradius
    hastighed.rotate(radians(-v)); //roterer rakettens affyringsvinkel
  }

void reset(){
}


  void skydRaket() {
    moveRaket();
  }

  void moveRaket() {
    if (krudt > 0 && placering.y > 0) {
      placering.add(hastighed);
      fill(0);
      noStroke();
      circle(placering.x, placering.y, 10);
      krudt--;
    } else {
      eksplosion();
      placering.add(vind);
    }
  }

  void eksplosion() {
  }
}

//-----------------------------RaketCirkel-----------------------------//
class RaketCirkel extends Raket {
  RaketCirkel(int h, int k, int e, float v) {
    super( h, k, e, v);
  }

  void eksplosion() {

    if (dia < eksplosionRadius) {
      fill(r, g, b, alpha);
      noStroke();
      circle(placering.x, placering.y, dia);
      dia++;
      alpha--;
    }
  }
}


//-----------------------------Raketstjerne-----------------------------//
class RaketStjerne extends Raket {

  RaketStjerne(int h, int k, int e, float v) {
    super( h, k, e, v);
  }

  void eksplosion() {
    if (dia < eksplosionRadius) {
      pushMatrix();
      translate(placering.x, placering.y);

      for (int i = 0; i < 100; i++) {
        rotate(1);
        strokeWeight(2);
        stroke(r, g, b, alpha);
        line(0, 0, 0, dia/2);
      }
      dia++;
      alpha--;
      popMatrix();
    }
  }
}
