class Room {
  //klssens tilstand
  //der er 6 atributter, de bruges til at fortælle størelsen, tilstanden af lyset, rummets navn og hvor øverst venste hjørne er
  boolean light; //er lyset tændt eller slukket
  String name; // rummets navn
  float xPos, yPos; // x og y pos for rummets øverste venstre hjørne
  int height = 100; // konstant højden på rummet
  int width = 100; // konstant bredden på rummet
  //der er 2 konstanter
  //de 4 atributter som er variabler sættes via parametrene

  //konstruktør
  Room(String n, boolean onOff, float x, float y) {
    name = n;
    light = onOff;
    xPos = x;
    yPos = y;
  }

  // settters
  void setLight(boolean l) {
    light = l;
  }

  void setName(String n) {
    name = n;
  }

  // getters
  boolean isLightOn() {
    return light;
  }

  String getRoomName() {
    return name;
  }

  void drawRoom() {
    if (light)
      fill(205);
    else
      fill(100);
    //the upper-left corner, the third sets the width, and the fourth sets the height.
    rect(xPos, yPos, width, height);
    textSize(15);
    fill(250);
    text(name, xPos+10, yPos+30);
  }

  void drawRoof() {
    // tegn taget
    fill(50);
    triangle(50, 290, 250, 150, 450, 290);
  }

  void checkHouse() {
    boolean found = false;
    for (int i = 0; i < house.length; i++) {
      if (house[i].isLightOn() == true) {
        println("WOW turn off the light in the "+house[i].getRoomName());
        found = true;
      }
    }
    if (!found) {
      println("All right! You'r ready to go!");
    } else {
      println("You forgot something");
    }
  }

void onOff(){
 //farve til rect
  fill(105);
  rect(80, 680, 300, 30);
  //ryd op
  fill(250);

  // find ud af om vi tænder eller slukker lyset
  for (int i = 0; i < house.length; i++) {
    if (house[i].isRoomClicked(mouseX, mouseY))
      if (house[i].light) {
        house[i].setLight(false);
        text("Turning off the light in "+house[i].getRoomName(), 100, 700);
      } else {
        house[i].setLight(true);
        text("Turning on the light in "+house[i].getRoomName(), 100, 700);
      }
  } 
}

  boolean isRoomClicked(float x, float y) {
    if ((x > xPos) && (x < xPos+width) && (y>yPos) && (y < yPos+height))
      return true;
    else
      return false;
  }
}
