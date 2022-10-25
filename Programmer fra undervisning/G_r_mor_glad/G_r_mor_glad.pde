boolean morglad = false;
boolean farglad = false;
boolean søsterglad = false;

boolean blomst = false;
boolean oprydet = false;
boolean øl = false;
boolean græs = false;
boolean penge = false;
boolean tøj = false;

PImage blomstpic;
PImage oprydetpic;
PImage ølpic;
PImage græspic;
PImage pengepic;
PImage tøjpic;


void setup() {
  blomstpic = loadImage("blomst.png");
  oprydetpic = loadImage("oprydet.png");
  ølpic = loadImage("øl.png");
  græspic = loadImage("græs.png");
  pengepic = loadImage("penge.png");
  tøjpic = loadImage("tøj.png");

  size (400, 300);
  
  background(255);
  line(0, 0, 400, 0);
  line(0, 100, 400, 100);
  line(0, 200, 400, 200);
  line(200, 0, 200, 300);
  line(300, 0, 300, 300);

  textAlign(CENTER);
  textSize(50);
}

void draw() {
  mor();
  far();
  søster();
}


void mor() {
  if (blomst && oprydet && farglad && søsterglad) {
    morglad = true;
  } else {
    morglad = false;
  }


  skiftfarve(morglad);
  rect(0, 0, 200, 100); //kasse til "mor"
  fill(0);
  text("Mor", 100, 70);

  skifttint(blomst);
  //  rect(200, 0, 100, 100); //kasse til blomst
  image(blomstpic, 201, 1);

  skifttint(oprydet);
  //  rect(300, 0, 100, 100); // kasse til oprydtet
  image(oprydetpic, 301, 1);
}


void far() {
  if (øl && græs && søsterglad) {
    farglad = true;
  } else {
    farglad = false;
  }


  skiftfarve(farglad);
  rect(0, 100, 200, 100); //kasse til "far"
  fill(0);
  text("Far", 100, 170);

  skifttint(øl);
  //  rect(200, 100, 100, 100); //kasse til Øl
  image(ølpic, 201, 101);

  skifttint(græs);
  //  rect(300, 100, 100, 100); // kasse til græsset er slået
  image(græspic, 301, 101);
}


void søster() {
  if (penge || tøj) {
    søsterglad = true;
  } else {
    søsterglad = false;
  }


  skiftfarve(søsterglad);
  rect(0, 200, 200, 100); //kasse til "søster"
  fill(0);
  text("Søster", 100, 270);

  skifttint(penge);
  //  rect(200, 200, 100, 100); //kasse til penge
  image(pengepic, 201, 201);

  skifttint(tøj);
  //  rect(300, 200, 100, 100); // kasse til tøj
  image(tøjpic, 301, 201);
}



void mouseClicked() {

  if (mouseY >= 0 && mouseY < 100) {   //mor
    if (mouseX >= 200 && mouseX < 300) { //blomst tænd/sluk
      if (!blomst) {
        blomst = true;
      } else {
        blomst = false;
      }
    }

    if (mouseX >= 300 && mouseX <= 400) {  //oprydet tænd/sluk
      if (!oprydet) {
        oprydet = true;
      } else {
        oprydet = false;
      }
    }
  }

  if (mouseY >= 100 && mouseY < 200) {   //far
    if (mouseX >= 200 && mouseX < 300) { //øl tænd/sluk
      if (!øl) {
        øl = true;
      } else {
        øl = false;
      }
    }

    if (mouseX >= 300 && mouseX <= 400) {  //græs tænd/sluk
      if (!græs) {
        græs = true;
      } else {
        græs = false;
      }
    }
  }

  if (mouseY >= 200 && mouseY <= 300) {   //søster
    if (mouseX >= 200 && mouseX < 300) { //penge tænd/sluk
      if (!penge) {
        penge = true;
      } else {
        penge = false;
      }
    }

    if (mouseX >= 300 && mouseX <= 400) {  //tøj tænd/sluk
      if (!tøj) {
        tøj = true;
      } else {
        tøj = false;
      }
    }
  }
}


void skiftfarve(boolean tjek) {
  if (tjek) {
    fill(0, 255, 0);
  } else {
    fill(255);
  }
}

void skifttint(boolean tjek) {
  if (tjek) {
    tint(0, 255, 0);
  } else {
    tint(255);
  }
}
