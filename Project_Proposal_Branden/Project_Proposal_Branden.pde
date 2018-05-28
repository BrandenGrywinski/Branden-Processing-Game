PImage knight;
PImage knightcrouch;
PImage knightded;
PImage knighthit;
PImage Boss1;
PImage logo;
PImage headboss;
int Stage;
int knightalive;
int kHP;
int bags;
//Knight X and Knight Y Value
int Kx, Ky;
//Head Boss X and Head Boss Y Value
int Hx, Hy;
float pct;
//room 2 timer
int room2t;
int bossTimer;


void setup() {
  fullScreen();
  knight = loadImage("knightstanding.png");
  knightcrouch = loadImage("knightcrouch.png");
  knightded = loadImage("knightded.png");
  knighthit = loadImage("knighthit.png");
  logo = loadImage("The Nine.png");
  headboss = loadImage("headboss.png");
  Kx = 300;
  Ky = 570;
  Hx = 900;
  Hy = 300;
  kHP = 100;
  knightalive = 1;
  Stage = 0;
  room2t = 0;
  bossTimer = 0;
}
void draw() {

  //1366 x 768 Resolution


  if (Stage == 0 ) {
    background(#030303);
    image(logo, 300, 130);
    textSize(30);
    text("Load World", 575, 400);
    text("Controls", 590, 480);
    text("Exit Game", 580, 560);
    if (mousePressed && abs(mouseX -660)<88 && abs(mouseY - 390)<30) {
      Stage = 1;
    }
    if (mousePressed && abs(mouseX -670)<70 && abs(mouseY - 470)<30) {
      Stage = 2;
    }
    if (mousePressed && abs(mouseX -660)<88 && abs(mouseY - 550)<30) {
      exit();
    }
  }
  if (Stage == 2) {
    background(#767272);
  }

  if (Stage == 3) {

    room2t++;
    bossTimer++;
    if (room2t == 1 ) {
      Kx = 30;
    }

    background(#0E4040);
    pushMatrix();
    scale(-1, 1);
    image(headboss, -Hx, Hy);
    image(knight, -Kx, Ky);
    popMatrix();
    fill(0);
    text("HP: ", 1200, 40);
    fill(#FF0000);
    text(kHP, 1260, 40);

    if ( kHP == 0) {
      knightalive = 0;
    }
    if (knightalive == 0) {
      knight = knightded;
      fill(0);
      textSize(56);
      text("You Have Died!", 500, 300);
      text("Press 'R' to Reset", 500, 500);
    }
    //Boundries
    if (Kx == 1380) {
      Kx = Kx -5;
    }
    if (Kx == 40) {
      Kx = Kx +5;
    }
    if (Ky == 0) {
      Ky = Ky +5;
    }
    if (Ky == 700) {
      Ky = Ky -5;
    }

    if (knightalive == 0) {
      if (key == 'r' || key == 'R') {
        setup();
        Stage = 1;
        kHP = 100;
      }
    }

    if (keyPressed) {


      if (knightalive == 1) {

        if (key == 'd' || key == 'D') {
          pushMatrix();
          scale(-1, 1);
          image(knight, -Kx, Ky);
          popMatrix();
          Kx = Kx +5;
        }
        if (key == 'a' || key == 'A') {
          scale(1, 1);
          image(knight, Kx - 55, Ky);
          Kx = Kx-5;
        }
        if (key == 'w' || key == 'W') {
          Ky = Ky-5;
        }
        if (key == 's' || key == 'S') {
          Ky = Ky+5;
        }
      }
    }
  }

  if (Stage == 1) {

    Room2(Kx, Ky);
    background(#39A53D);
    pushMatrix();
    scale(-1, 1);
    image(knight, -Kx, Ky);
    popMatrix();
    fill(0);
    text("HP: ", 1200, 40);
    fill(#FF0000);
    text(kHP, 1260, 40);
    fill(#B28741);
    rect(1350, 250, 20, 300);
    rect(-5, 250, 20, 300);
    rect(520, -5, 300, 20);
    rect(520, 750, 300, 20);
    fill(0);
    text("LOCKED", 600, 730);

    if ( kHP == 0) {
      knightalive = 0;
    }
    if (knightalive == 0) {
      knight = knightded;
      fill(0);
      textSize(56);
      text("You Have Died!", 500, 300);
      text("Press 'R' to Reset", 500, 500);
    }
    //Boundries
    if (Kx == 1380) {
      Kx = Kx -5;
    }
    if (Kx == 40) {
      Kx = Kx +5;
    }
    if (Ky == 0) {
      Ky = Ky +5;
    }
    if (Ky == 700) {
      Ky = Ky -5;
    }

    if (knightalive == 0) {
      if (key == 'r' || key == 'R') {
        setup();
        Stage = 1;
        kHP = 100;
      }
    }

    if (keyPressed) {


      if (knightalive == 1) {

        if (key == 'd' || key == 'D') {
          pushMatrix();
          scale(-1, 1);
          image(knight, -Kx, Ky);
          popMatrix();
          Kx = Kx +5;
        }
        if (key == 'a' || key == 'A') {
          scale(1, 1);
          image(knight, Kx - 55, Ky);
          Kx = Kx-5;
        }
        if (key == 'w' || key == 'W') {
          Ky = Ky-5;
        }
        if (key == 's' || key == 'S') {
          Ky = Ky+5;
        }
      }
    }
  }
}

//Door Functions
void Room2(int Kx, int Ky) {
  if (abs(Kx-1380)<30 &&(abs(Ky-430)<120)) {
    Kx = 30;
    Stage = 3;
    bossTimer++;
  }
}