PImage fondo, selectYourCharacter, howToPlay, credits, setting, personaje1, personaje2, personaje3, personaje4, personaje5, ok, start, okn, mapa = null;
int pantalla = 0, personaje = 1;
PFont mouse = null;
boolean oke = false;
boolean map1, map2, map3 =false;

void setup() {
  size(1500, 720);
  mouse = createFont("Arial Bold", 30);
  fondo = loadImage("Start.png");
  selectYourCharacter = loadImage("SelectYourCharacter.png");
  howToPlay = loadImage("How To Play.png");
  credits = loadImage("Credits.png");
  setting = loadImage("Settings.png");

  personaje1 = loadImage("SelPersonaje1.png");
  personaje2 = loadImage("SelPersonaje2.png");
  personaje3 = loadImage("SelPersonaje3.png");
  personaje4 = loadImage("SelPersonaje4.png");
  personaje5 = loadImage("SelPersonaje5.png");
  ok = loadImage("Ok.png");
  start = loadImage("Start.png");
  okn = loadImage("Okselect.png");

  mapa = loadImage("Mapa.png");
}

void draw() {
  background(0);
  if (pantalla == 0) {
    image(fondo, 0, 0, width, height);
  } else if (pantalla == 1) {
    image(selectYourCharacter, 0, 0, width, height);
    if (!oke) {
      image(ok, (750-55), 600);
    } else {
      image(okn, (750-55), 600);
    }

    if (personaje == 1) {
      image(personaje1, (750-280), 125);
    } else if (personaje == 2) {
      image(personaje2, (750-280), 125);
    } else if (personaje == 3) {
      image(personaje3, (750-280), 125);
    } else if (personaje == 4) {
      image(personaje4, (750-280), 125);
    } else if (personaje == 5) {
      image(personaje5, (750-280), 125);
    }
  } else if (pantalla == 2) {
    image(credits, 0, 0, width, height);
  } else if (pantalla == 3) {
    image(howToPlay, 0, 0, width, height);
  } else if (pantalla == 4) {
    image(setting, 0, 0, width, height);
  } else if (pantalla == 5) {
    image(mapa, 0, 0, width, height);
    if (map1) {
      image(setting, 0, 0, width, height);
      println();
      fill(255, 255, 0);
      rect(50, 300, 300, 50);  // Dibuja el cartel (ajusta posición y tamaño si es necesario)
      fill(0);
      textSize(16);
      textAlign(CENTER, CENTER);
      text("¡Has hecho clic aquí!", 200, 325);
    } else if (map2) {
      image(howToPlay, 0, 0, width, height);
    } else if (map3) {
      image(credits, 0, 0, width, height);
    }
  }

  textFont(mouse);
  text("mouseX "+ mouseX + " mouseY " + mouseY, 20, 20);
}

void mousePressed() {
  float dx1 = 922, dy1 = 297, ix1 = 560, iy1 = 297;
  float dx2 = 974, dy2 = 358, ix2 = 509, iy2 = 358;
  float dx3 = 922, dy3 = 410, ix3 = 560, iy3 = 410;

  if (pantalla == 0) {
    if (mouseX>78 && mouseX<583 && mouseY>300 && mouseY<352) {
      pantalla = 1;
    } else if (mouseX>154 && mouseX<507 && mouseY>418 && mouseY<468) {
      pantalla = 2;
    } else if (mouseX>869 && mouseX<1426 && mouseY>356 && mouseY<412) {
      pantalla = 3;
    } else if (mouseX>945 && mouseX<1350 && mouseY>480 && mouseY<538) {
      pantalla = 4;
    }
  } else if (pantalla == 1) {
    if (isPointInTriangle(mouseX, mouseY, dx1, dy1, dx2, dy2, dx3, dy3)) {
      switch (personaje) {
      case 1:
        personaje = 2;
        break;
      case 2:
        personaje = 3;
        break;
      case 3:
        personaje = 4;
        break;
      case 4:
        personaje = 5;
        break;
      case 5:
        personaje = 1;
      }
    } else if (isPointInTriangle(mouseX, mouseY, ix1, iy1, ix2, iy2, ix3, iy3)) {
      switch (personaje) {
      case 1:
        personaje = 5;
        break;
      case 2:
        personaje = 1;
        break;
      case 3:
        personaje = 2;
        break;
      case 4:
        personaje = 3;
        break;
      case 5:
        personaje = 4;
      }
    } else if (mouseX > 20 && mouseX < 141 && mouseY > 29 && mouseY < 49) {
      pantalla = 0;
    } else if (mouseX > 694 && mouseX <792 && mouseY >600 && mouseY <650) {
      pantalla = 5;
    }
  } else if (pantalla == 5) {
    if (mouseX>290 && mouseX<378 && mouseY>509 && mouseY<556) {
      map1 = true;
      map2 = false;
      map3 = false;
    } else if (mouseX>1141 && mouseX<1245 && mouseY>637 && mouseY<692) {
      map1 = false;
      map2 = true;
      map3 = false;
    } else if (mouseX>718 && mouseX<839 && mouseY>623 && mouseY<688) {
      map1 = false;
      map2 = false;
      map3 = true;
    }
  } else if (pantalla == 2 || pantalla == 3 || pantalla == 4) {
    if (mouseX > 20 && mouseX < 141 && mouseY > 29 && mouseY < 49) {
      pantalla = 0;
    }
  }
}

void mouseMoved() {
  if (mouseX > 694 && mouseX <792 && mouseY >600 && mouseY <650) {
    oke=true;
  } else {
    oke = false;
  }
}

boolean isPointInTriangle(float px, float py, float x1, float y1, float x2, float y2, float x3, float y3) {
  float areaOrig = abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));
  float area1 = abs((x1 - px) * (y2 - py) - (x2 - px) * (y1 - py));
  float area2 = abs((x2 - px) * (y3 - py) - (x3 - px) * (y2 - py));
  float area3 = abs((x3 - px) * (y1 - py) - (x1 - px) * (y3 - py));

  return abs(area1 + area2 + area3 - areaOrig) < 1.0;
}
