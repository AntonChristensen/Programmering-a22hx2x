//lav et rum //<>// //<>// //<>//
Room[] house = new Room[6];//Her deklareses en variabel af datatypen Room med navnet house


void setup() {
  size(800, 800);
  // der skal bruges 4 parametre
  house[0] = new Room("House", false, 100, 300);
  house[1] = new Room("Kitchen", false, 200, 300);
  house[2] = new Room("Livingroom", false, 300, 300);
  house[3] = new Room("Toilet", false, 100, 400);
  house[4] = new Room("Bedroom", false, 200, 400);
  house[5] = new Room("Bathroom", false, 300, 400);
}

void draw() {
  background(205);
  for (int i = 0; i < house.length; i++) {
    // tegn taget
    house[0].drawRoof();
    // tegn rum
    house[i].drawRoom();
  }
  checkHouse();
}

void mouseClicked() {
  house[0].onOff();
}
// der var 14 funktioner

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
