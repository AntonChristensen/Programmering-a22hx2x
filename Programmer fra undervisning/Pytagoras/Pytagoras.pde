
float a = 890.0;
float b = 730.0;
float c = 0.0;

fullScreen();
background(252, 207, 3);

strokeWeight(5);
line(100,100,100,100+a);
line(100,100+a,100+b,100+a);
line(100+b,100+a,100,100);

c = sqrt(pow(a,2)+pow(b,2));

textAlign(CENTER);
textSize(50);

text("a = "+a,100,125+a/2);
text("b = "+b,100+b/2,140+a);

textAlign(LEFT);
text("c = "+c,100+b/2,100+a/2);
