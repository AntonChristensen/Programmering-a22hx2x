
PImage img;

void setup(){
  size(300,400);
  img = loadImage("blomst1.png");
}

void draw(){
  textAlign(CENTER, CENTER);
  textSize(44);
  blomster();
}


void blomster(){
  image(img, 0, 0);
  text("Mor", 150, 44);
}
