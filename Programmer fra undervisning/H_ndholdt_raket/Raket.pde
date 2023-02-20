class Raket {
  int r = int(random(0, 256));
  int g = int(random(0, 256));
  int b = int(random(0, 256));
  int eksplosionRadius = int(random(100, 300));
  int alpha = eksplosionRadius;
  int dia = 0;
  PVector hastighed;
  PVector placering;
  PVector længde = new PVector(20, 0);
  PVector efter;
  int krudt = int(random(30, 40));


  Raket(int xSt, int ySt, int xSl, int ySl) {
    hastighed = new PVector(xSt-xSl, ySt-ySl);
    hastighed.div(8);
    placering = new PVector(xSt, ySt);
    længde.rotate(hastighed.heading());
    efter = new PVector(dist(xSt, ySt, xSl, ySl), 0);
    efter.div(30);
    efter.rotate(hastighed.heading());
  }

  void drawRaket() {
    moveRaket();
  }

  void moveRaket() {
    if (krudt > 0 && længde.x + placering.x < width-20 && længde.x + placering.x > 20 && længde.y + placering.y < height-20 && længde.y + placering.y > 20) {
      placering.add(hastighed);
      strokeWeight(5);
      stroke(255);
      line(placering.x, placering.y, længde.x + placering.x, længde.y + placering.y);
      krudt--;
    } else {
      placering.add(efter);
      bang();
    }
  }

  void bang() {
    if (dia < eksplosionRadius) {
      pushMatrix();
      translate(længde.x + placering.x, længde.y + placering.y);

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
  
  boolean finished(){
   if (alpha <= 0){
     return true;
   } else{
    return false; 
   }
  }
}
