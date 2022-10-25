boolean morglad = false;       //Deklarering og initiering af booleans som skal bruges i programmet
boolean farglad = false;
boolean søsterglad = false;

boolean blomst = false;
boolean rydop = false;
boolean øl = false;
boolean græs = false;
boolean penge = false;
boolean tøj = false;

PImage glad;                  //Deklarering af billeder som skal bruges
PImage sur;

void setup() {
  glad = loadImage("glad.jpg");    //Billederne bliver loaded.
  sur = loadImage("Sur.jpg");

  size (400, 300);

  background(255);

  textAlign(CENTER);
  textSize(25);
}


void draw() {
  mor();
  far();
  søster();
  drawInterface();
}


void mor() {                                           //Funktionen for delen "mor" sørger for at ændre billede til glad/sur og ændre farven på felterne med blomt og rydop
  if (blomst && rydop && farglad && søsterglad) {      //Sætter morglad til true hvis blomst, rydop farglad og søsterglad alle er true
    morglad = true;
  } else {                                             //Ellers (så er mindst én af blomst, rydop farglad og søsterglad false) sættes morglad til false
    morglad = false;
  }

  if (morglad) {                                       //Ændre billedet alt efter om morglad er true eller false
    image(glad, 101, 1);
  } else {
    image(sur, 101, 1);
  }

  if (blomst) {                                       //Ændre billedet alt efter om blomst er true eller false
    fill(0, 255, 0);
    square(200, 0, 100);
  } else {
    fill(255);
    square(200, 0, 100);
  }

  if (rydop) {                                       //Ændre billedet alt efter om ryodop er true eller false
    fill(0, 255, 0);
    square(300, 0, 100);
  } else {
    fill(255);
    square(300, 0, 100);
  }
}


void far() {
  if (øl && græs && søsterglad) {
    farglad = true;
  } else {
    farglad = false;
  }

  if (farglad) {
    image(glad, 101, 101);
  } else {
    image(sur, 101, 101);
  }

  if (øl) {
    fill(0, 255, 0);
    square(200, 100, 100);
  } else {
    fill(255);
    square(200, 100, 100);
  }

  if (græs) {
    fill(0, 255, 0);
    square(300, 100, 100);
  } else {
    fill(255);
    square(300, 100, 100);
  }
}


void søster() {
  if (penge || tøj) {      //Her anvendes || "eller" fordi det kun er en som skal være true for at lillesøsker er glad
    søsterglad = true;
  } else {
    søsterglad = false;
  }


  if (søsterglad) {
    image(glad, 101, 201);
  } else {
    image(sur, 101, 201);
  }


  if (penge) {
    fill(0, 255, 0);
    square(200, 200, 100);
  } else {
    fill(255);
    square(200, 200, 100);
  }


  if (tøj) {
    fill(0, 255, 0);
    square(300, 200, 100);
  } else {
    fill(255);
    square(300, 200, 100);
  }
}



void mouseClicked() {   //Aktiveret

  if (mouseY >= 0 && mouseY < 100 && mouseX >= 200 && mouseX < 300) {    
    if (!blomst) {
      blomst = true;
    } else {
      blomst = false;
    }
  }


  if (mouseY >= 0 && mouseY < 100 && mouseX >= 300 && mouseX <= 400) {
    if (!rydop) {
      rydop = true;
    } else {
      rydop = false;
    }
  }


  if (mouseY >= 100 && mouseY < 200 && mouseX >= 200 && mouseX < 300) {
    if (!øl) {
      øl = true;
    } else {
      øl = false;
    }
  }


  if (mouseY >= 100 && mouseY < 200 && mouseX >= 300 && mouseX <= 400) {
    if (!græs) {
      græs = true;
    } else {
      græs = false;
    }
  }


  if (mouseY >= 200 && mouseY <= 300 && mouseX >= 200 && mouseX < 300) {
    if (!penge) {
      penge = true;
    } else {
      penge = false;
    }
  }


  if (mouseY >= 200 && mouseY <= 300 && mouseX >= 300 && mouseX <= 400) {  //tøj tænd/sluk
    if (!tøj) {
      tøj = true;
    } else {
      tøj = false;
    }
  }
}


void drawInterface() {        //Tegner linjerne og teksten på canvas
  line(0, 0, 400, 0);        //De horisontale "-" linjer
  line(0, 100, 400, 100);
  line(0, 200, 400, 200);

  line(100, 0, 100, 300);   //De vertikale "|" linjer
  line(200, 0, 200, 300);
  line(300, 0, 300, 300);

  fill(0);                  //Ordene som skal stå
  text("Mor", 50, 60);
  text("Far", 50, 160);
  text("Søster", 50, 260);

  text("Blomst", 250, 60);  //Kriterieer for mor
  text("Ryd op", 350, 60);

  text("Øl", 250, 160);     //Kriterieer for far
  text("Slå græs", 350, 160);

  text("Penge", 250, 260);  //Kriterieer for søster
  text("Tøj", 350, 260);
}
