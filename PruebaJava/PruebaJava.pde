PImage fondo, selectYourCharacter, howToPlay, credits, setting, personaje1, personaje2, personaje3, personaje4, personaje5, ok, start, okn = null;
int pantalla = 0, personaje = 1;
PFont mouse = null;
boolean oke = false;

void setup(){
  size(1500, 800);
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
}

void draw(){
  background(0);
  if(pantalla == 0){
    image(fondo, 0, 0, width, height);
    
  }else if(pantalla == 1){
    image(selectYourCharacter, 0, 0, width, height);
    if (!oke){
    image(ok, (750-55), 644);
    }else{
    image(okn, (750-55), 644);
    }
    
    if(personaje == 1){
      image(personaje1, (750-280), 150);
      
    }else if(personaje == 2){
      image(personaje2, (750-280), 150);
      
    }else if(personaje == 3){
      image(personaje3, (750-280), 150);
      
    }else if(personaje == 4){
      image(personaje4, (750-280), 150);
      
    }else if (personaje == 5){
      image(personaje5, (750-280), 150);
      
    }
    
  }else if(pantalla == 2){
    image(credits, 0, 0, width, height);
    
  }else if (pantalla == 3) {
    image(howToPlay, 0, 0, width, height);
    
  }else if(pantalla == 4){
    image(setting, 0, 0, width, height);
  }
  
  textFont(mouse);
  text("mouseX "+ mouseX + " mouseY " + mouseY, 20, 20);
  
}

void mousePressed(){
    // Coordenadas del triángulo de la flecha derecha (ajusta según tu diseño)
    float dx1 = 922, dy1 = 322, ix1 = 560, iy1 = 322;
    float dx2 = 974, dy2 = 383, ix2 = 509, iy2 = 383;
    float dx3 = 922, dy3 = 435, ix3 = 560, iy3 = 435;
    
  if(pantalla == 0){
    if(mouseX>77 && mouseX<583 && mouseY>334 && mouseY<391){
      pantalla = 1;
      
    }else if(mouseX>154 && mouseX<507 && mouseY>464 && mouseY<521){
      pantalla = 2;
    
    }else if(mouseX>869 && mouseX<1426 && mouseY>394 && mouseY<451){
      pantalla = 3;
      
    }else if(mouseX>945 && mouseX<1350 && mouseY>534 && mouseY<597){
      pantalla = 4;
    }
    
  }else if (pantalla == 1) {
        if (isPointInTriangle(mouseX, mouseY, dx1, dy1, dx2, dy2, dx3, dy3)) {
          switch (personaje){
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
        }else if(isPointInTriangle(mouseX, mouseY, ix1, iy1, ix2, iy2, ix3, iy3)){
          switch (personaje){
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
        } else if (mouseX > 20 && mouseX < 141 && mouseY > 31 && mouseY < 55){
          pantalla = 0;
        } else if (mouseX > 694 && mouseX <792 && mouseY >644 && mouseY <694){
          pantalla = 5;
        }
    } else if (pantalla == 2 || pantalla == 3 || pantalla == 4) {
        if (mouseX > 20 && mouseX < 141 && mouseY > 31 && mouseY < 55) {
            pantalla = 0;
        }
    }
}

void mouseMoved(){
  if(mouseX > 694 && mouseX <792 && mouseY >644 && mouseY <694){
    oke=true;
  }
}

boolean isPointInTriangle(float px, float py, float x1, float y1, float x2, float y2, float x3, float y3) {
    float areaOrig = abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));
    float area1 = abs((x1 - px) * (y2 - py) - (x2 - px) * (y1 - py));
    float area2 = abs((x2 - px) * (y3 - py) - (x3 - px) * (y2 - py));
    float area3 = abs((x3 - px) * (y1 - py) - (x1 - px) * (y3 - py));
    
    return abs(area1 + area2 + area3 - areaOrig) < 1.0;
}
