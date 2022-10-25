int x = 100;
char rl = 'r';

void setup() {
  size(900, 400, P3D);
  frameRate(60);
  //translate(200,200);
}

void draw() {
  background(25);

  pushMatrix();

  translate(x, 200);
  rotate(frameCount*1.5);
  box(150);
  popMatrix();
  
   if (rl == 'r') {
    x = x + 2;
  }
  if (x > width - 100) {
    rl = 'l';
  }
  if (rl == 'l') {
    x = x - 2;
  }
  if (x < 100){
    rl = 'r';
  }
} 
