void setup() {
  size(800, 600);
}


void draw() {

  head(width/4);
  head(width*0.75);
}


void head(float x) {
  circle(x, 300, 300); //hoved
  square(x-90, 210, 70);//venstre øje
  square(x+20, 210, 70);//højre øje
  circle(x, 300, 100);//næse

  arc(x, 360, 170, 170, 0, PI, CLOSE); //mund

  //hat
  strokeWeight(10);
  line(x-150, 180, x+150, 180);
  fill(0, 0, 0);
  rect(x-90, 20, 180, 160);

  strokeWeight(1);
  line(x, 0, x, 600);
  line(x-200, 300, x+200, 300);

  strokeWeight(4);
  fill(255);
}

/* én gut
 circle(x, 300, 300); //hoved
 square(110, 210, 70);//venstre øje
 square(220, 210, 70);//højre øje
 circle(200, 300, 100);//næse
 
 arc(200, 360, 170, 170, 0, PI, CLOSE); //mund
 
 //hat
 strokeWeight(10);
 line(50, 180, 350, 180);
 fill(0, 0, 0);
 rect(110, 20, 180, 160);
 
 strokeWeight(1);
 line(200, 0, 200, 600);
 line(0, 300, 400, 300);
 
 strokeWeight(4);
 fill(255);
 */
