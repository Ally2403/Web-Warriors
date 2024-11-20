import processing.sound.*;
WebWarriors game;
PImage backgroundImage1, backgroundImage2, backgroundImage3;
PImage character, combate, youWon, youLose, next, textBox;
PImage lifeBar0, lifeBar1, lifeBar2, lifeBar3, lifeBar4, lifeBar5, lifeBar6, lifeBar7, lifeBar8, lifeBar9, lifeBar10;
Character mainCharacter, enemy1, enemy2, enemy3, battleCharacter;
GifPlayer gifPlayer;
boolean showYouWon = false, showYouLose = false;
int startTime, finishTime;
float backgroundOffset = 0; // Ancho total de la imagen de principalPage
float backgroundWidth = 8000; // Ancho total de la imagen de principalPage
PFont mouse = null;
int indexBackground = 1;

boolean booleanBattle1 = false, booleanBattle2 = false, booleanBattle3 = false;
SimpleList battle1Texts, battle1xPositions, battle1yPositions, comments;
Battle battle1, battle2, battle3;

//JUANCHO STUFF
PImage principalPage, selectYourCharacter, howToPlay, credits, setting, characterVariable1, characterVariable2, characterVariable3, characterVariable4, characterVariable5, ok, start, okn, mapa = null;
int screen = 0, characterVariable = 1;
boolean oke = false;
boolean map1 = false, map2 = false, map3 = false;
boolean levelLocked2 = true, levelLocked3 = true;
DoublyList characterSelector;

Timer timer;
boolean test = false;
void setup(){
  mouse = createFont("PressStart2P.ttf", 20);
  size(1500, 720);
  combate = loadImage("Combate.png");
  combate.resize(1500, 720);
  youWon = loadImage("you won.png");
  youWon.resize(width, height);
  youLose = loadImage("you won.png");
  youLose.resize(width, height);
  next = loadImage("next.png");
  textBox = loadImage("textBox.png");
  
  principalPage = loadImage("Start.png");
  selectYourCharacter = loadImage("SelectYourCharacter.png");
  howToPlay = loadImage("How To Play.png");
  credits = loadImage("Credits.png");
  setting = loadImage("Settings.png");
  ok = loadImage("Ok.png");
  start = loadImage("Start.png");
  okn = loadImage("Okselect.png");
  mapa = loadImage("Mapa.png");
  
  lifeBar0 = loadImage("Z0.png");
  lifeBar0.resize(350, 40);
  lifeBar1 = loadImage("Z1.png");
  lifeBar1.resize(350, 40);
  lifeBar2 = loadImage("Z2.png");
  lifeBar2.resize(350, 40);
  lifeBar3 = loadImage("Z3.png");
  lifeBar3.resize(350, 40);
  lifeBar4 = loadImage("Z4.png");
  lifeBar4.resize(350, 40);
  lifeBar5 = loadImage("Z5.png");
  lifeBar5.resize(350, 40);
  lifeBar6 = loadImage("Z6.png");
  lifeBar6.resize(350, 40);
  lifeBar7 = loadImage("Z7.png");
  lifeBar7.resize(350, 40);
  lifeBar8 = loadImage("Z8.png");
  lifeBar8.resize(350, 40);
  lifeBar9 = loadImage("Z9.png");
  lifeBar9.resize(350, 40);
  lifeBar10 = loadImage("Z10.png");
  lifeBar10.resize(350, 40);
  
  game = new WebWarriors(this);
  game.addSong("music1.mp3");
  game.addSong("music2.mp3");
  
  //Plataformas
  
  // MAPA 1
  game.addPlatform(new Platform(1, 0, 625, 465, 15));
  game.addPlatform(new Platform(1, 465, 560, 168, 15));
  game.addPlatform(new Platform(1, 633, 484, 353, 15));
  game.addPlatform(new Platform(1, 986, 562, 166, 15));
  game.addPlatform(new Platform(1, 1154, 625, 1713, 15));
  game.addPlatform(new Platform(1, 1740, 500, 350, 15));
  game.addPlatform(new Platform(1, 2195, 370, 350, 15));
  game.addPlatform(new Platform(1, 2867, 565, 125, 15));
  game.addPlatform(new Platform(1, 2993, 492, 688, 55));
  game.addPlatform(new Platform(1, 3680, 630, 220, 15));
  game.addPlatform(new Platform(1, 3900, 545, 352, 15));
  game.addPlatform(new Platform(1, 4252, 630, 910, 15));
  game.addPlatform(new Platform(1, 5162, 580, 168, 15));
  game.addPlatform(new Platform(1, 5332, 500, 355, 15));
  game.addPlatform(new Platform(1, 5685, 575, 166, 15));
  game.addPlatform(new Platform(1, 5852, 627, 1240, 15));
  game.addPlatform(new Platform(1, 6074, 472, 352, 15));
  game.addPlatform(new Platform(1, 6527, 355, 352, 15));
  game.addPlatform(new Platform(1, 7096, 560, 126, 15));
  game.addPlatform(new Platform(1, 7223, 488, 688, 55));
 
  // MAPA 2
  game.addPlatform(new Platform(2, 0, 625, 3123, 15));
  game.addPlatform(new Platform(2, 3123, 590, 167, 15));
  game.addPlatform(new Platform(2, 3292, 515, 353, 15));
  game.addPlatform(new Platform(2, 3644, 590, 165, 15));
  game.addPlatform(new Platform(2, 3811, 625, 2441, 15));
  game.addPlatform(new Platform(2, 6252, 550, 127, 15));
  game.addPlatform(new Platform(2, 6378, 475, 688, 15));
  game.addPlatform(new Platform(2, 7065, 625, 935, 15));
  game.addPlatform(new Platform(2, 179, 512, 350, 15));
  game.addPlatform(new Platform(2, 573, 390, 182, 15));
  game.addPlatform(new Platform(2, 837, 290, 182, 15));
  game.addPlatform(new Platform(2, 1049, 465, 182, 15));
  game.addPlatform(new Platform(2, 1306, 365, 182, 15));
  game.addPlatform(new Platform(2, 1560, 230, 182, 15));
  game.addPlatform(new Platform(2, 1744, 445, 182, 15));
  game.addPlatform(new Platform(2, 1825, 170, 182, 15));
  game.addPlatform(new Platform(2, 2060, 445, 182, 15));
  game.addPlatform(new Platform(2, 4095, 465, 182, 15));
  game.addPlatform(new Platform(2, 4385, 350, 182, 15));
  game.addPlatform(new Platform(2, 4632, 435, 182, 15));
  game.addPlatform(new Platform(2, 4875, 285, 182, 15));
  game.addPlatform(new Platform(2, 5130, 165, 182, 15));
  game.addPlatform(new Platform(2, 5340, 490, 182, 15));
  game.addPlatform(new Platform(2, 5554, 330, 182, 15));
  game.addPlatform(new Platform(2, 5808, 210, 182, 15));
        
  // MAPA 3
  game.addPlatform(new Platform(3, 0, 625, 380, 15));
  game.addPlatform(new Platform(3, 380, 565, 170, 15));
  game.addPlatform(new Platform(3, 550, 490, 353, 15));
  game.addPlatform(new Platform(3, 905, 570, 165, 15));
  game.addPlatform(new Platform(3, 1070, 625, 334, 15));
  game.addPlatform(new Platform(3, 1427, 500, 47, 15));
  game.addPlatform(new Platform(3, 1560, 405, 47, 15));
  game.addPlatform(new Platform(3, 1692, 380, 47, 15));
  game.addPlatform(new Platform(3, 1803, 470, 47, 15));
  game.addPlatform(new Platform(3, 1923, 385, 47, 15));
  game.addPlatform(new Platform(3, 2030, 510, 47, 15));
  game.addPlatform(new Platform(3, 2162, 510, 47, 15));
  game.addPlatform(new Platform(3, 2278, 430, 47, 15));
  game.addPlatform(new Platform(3, 2409, 380, 47, 15));
  game.addPlatform(new Platform(3, 2540, 450, 47, 15));
  game.addPlatform(new Platform(3, 2666, 525, 47, 15));
  game.addPlatform(new Platform(3, 2781, 615, 47, 15));
  game.addPlatform(new Platform(3, 2914, 615, 47, 15));
  game.addPlatform(new Platform(3, 3045, 615, 47, 15));
  game.addPlatform(new Platform(3, 3140, 530, 47, 15));
  game.addPlatform(new Platform(3, 3262, 450, 47, 15));
  game.addPlatform(new Platform(3, 3393, 375, 47, 15));
  game.addPlatform(new Platform(3, 3527, 445, 382, 15));
  game.addPlatform(new Platform(3, 4022, 445, 47, 15));
  game.addPlatform(new Platform(3, 4166, 530, 47, 15));
  game.addPlatform(new Platform(3, 4271, 435, 47, 15));
  game.addPlatform(new Platform(3, 4402, 365, 47, 15));
  game.addPlatform(new Platform(3, 4566, 450, 47, 15));
  game.addPlatform(new Platform(3, 4772, 625, 1552, 15));
  game.addPlatform(new Platform(3, 5272, 460, 352, 15));
      
  backgroundImage1 = loadImage("FONDO MAPA VIDEOJUEGO "+ 1 +".png");
  backgroundImage2 = loadImage("FONDO MAPA VIDEOJUEGO "+ 2 +".png");
  backgroundImage3 = loadImage("FONDO MAPA VIDEOJUEGO "+ 3 +".png");
  
  mainCharacter = new Character(this, "F", 5, 0, 0, 5);
  
  battleCharacter = new Character(this, "B", 10, 200, 250, 5);
  enemy1 = new Character(this, "A", 10, 1000, 0, 5);
  enemy2 = new Character(this, "N", 10, 1000, 0, 5);
  enemy3 = new Character(this, "G", 13, 1000, 0, 5);
  
  battle1xPositions = new SimpleList();
  battle1xPositions.addNode(545);
  battle1xPositions.addNode(1000);
  battle1xPositions.addNode(545);
  battle1xPositions.addNode(1000);
  battle1xPositions.addNode(50);
  
  battle1yPositions = new SimpleList();
  battle1yPositions.addNode(537);
  battle1yPositions.addNode(537);
  battle1yPositions.addNode(630);
  battle1yPositions.addNode(630);
  battle1yPositions.addNode(537);
  
  // Crear listas de texto y posiciones para las batallas
  battle1Texts = new SimpleList();
  battle1Texts.addNode("1");
  battle1Texts.addNode("2");
  battle1Texts.addNode("3");
  battle1Texts.addNode("4");
  battle1Texts.addNode("");
  
  comments = new SimpleList();
  comments.addNode("buenos dias\ncomo estas\ncomo te llamas");
  comments.addNode("me gusta la papaaaaa");
  comments.addNode("3");
  comments.addNode("4");
  comments.addNode("5");
  
  // Crear batallas
  battle1 = new Battle(this, battle1Texts, battle1xPositions, battle1yPositions, game, comments, battleCharacter, enemy1);
  battle2 = new Battle(this, battle1Texts, battle1xPositions, battle1yPositions, game, comments, battleCharacter, enemy2); // Puedes personalizar otra batalla
  battle3 = new Battle(this, battle1Texts, battle1xPositions, battle1yPositions, game, comments, battleCharacter, enemy3);
  
  // Agregar batallas a WebWarriors
  game.addBattle(battle1);
  game.addBattle(battle2);
  
  characterSelector = new DoublyList();
  characterSelector.addNode(loadImage("SelPersonaje1.png"));
  characterSelector.addNode(loadImage("SelPersonaje2.png"));
  characterSelector.addNode(loadImage("SelPersonaje3.png"));
  characterSelector.addNode(loadImage("SelPersonaje4.png"));
  characterSelector.addNode(loadImage("SelPersonaje5.png"));
  
  timer = new Timer();
}

void draw(){
  
  background(0);
  if (screen == 0) {
    image(principalPage, 0, 0, width, height);
  } else if (screen == 1) {
    image(selectYourCharacter, 0, 0, width, height);
    if (!oke) {
      image(ok, (750-55), 600);
    } else {
      image(okn, (750-55), 600);
    }

    characterSelector.displayCharacter();
    
  } else if (screen == 2) {
    image(credits, 0, 0, width, height);
  } else if (screen == 3) {
    image(howToPlay, 0, 0, width, height);
  } else if (screen == 4) {
    image(setting, 0, 0, width, height);
  } else if (screen == 5) {
    image(mapa, 0, 0, width, height);
    if(map1){
        image(backgroundImage1, -backgroundOffset, 0);
        
        //BATALLAS EN JUEGO
        if (game.isBattleActive()) {
          timer.pause();
          game.updateBattle(mainCharacter.getLife());
        } else if(showYouWon){
          //se actualiza la vida después de la batalla
          mainCharacter.setLife(game.updateBattle(mainCharacter.getLife()));
          finishTime = millis() - startTime;
          if (finishTime < 5000) {
            image(youWon, 0, 0); // Muestra la imagen en (100, 100)
          } else {
            showYouWon = false; // Deja de mostrar la imagen después de 5 segundos
            timer.resume();
          }
        }else if(showYouLose){
          //se actualiza la vida después de la batalla
          mainCharacter.setLife(game.updateBattle(mainCharacter.getLife()));
          finishTime = millis() - startTime;
          if (finishTime < 5000) {
            image(youLose, 0, 0); // Muestra la imagen en (100, 100)
          } else {
            showYouLose = false; // Deja de mostrar la imagen después de 5 segundos
            
          }
        }else{
          mainCharacter.updateLifeBar(this);
          
          //JUEGO PLATAFORMAS
          mainCharacter.move(this, 1);
          mainCharacter.display(this);
          moveBackground();
          timer.time();
          // Mostrar plataformas
          Node platformNode = game.getPlatforms().PTR;
          while (platformNode != null) {
            Platform platform = (Platform) platformNode.info;
            if(platform.getIndex() == 1){
                platform.display(this);
            }
            platformNode = platformNode.next;
          }
          
          // Verificar colisión con plataformas
          if (CollisionDetector.isColliding(1, mainCharacter, (SimpleList)game.getPlatforms(), backgroundOffset)) {
            mainCharacter.setOnGround(true);
          } else {
            mainCharacter.setOnGround(false);
          }
          
          //CONTROL DE BATALLAS
          if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset >= 4036 && !booleanBattle1){
            print("llegue");
            game.setActiveBattle(0); // Comienza con la primera batalla
            game.startBattle();
            booleanBattle1 = true;
          }
          
          if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset == 1500 && test == false){
            print("vida - 1");
            mainCharacter.setLife(mainCharacter.getLife() - 1);
            test = true;
          }
          //verificar que se haya terminado el nivel para pasar al selector de niveles nuevamente
          if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset == 2000){
            map1 = false;
            levelLocked2 = false;
          }
        }
    }else if(map2 && !levelLocked2){ // mapaaaaaaa
      image(backgroundImage2, -backgroundOffset, 0);
      //BATALLAS EN JUEGO
        if (game.isBattleActive()) {
          timer.pause();
          game.updateBattle(mainCharacter.getLife());
        } else if(showYouWon){
          //se actualiza la vida después de la batalla
          mainCharacter.setLife(game.updateBattle(mainCharacter.getLife()));
          finishTime = millis() - startTime;
          if (finishTime < 5000) {
            image(youWon, 0, 0); // Muestra la imagen en (100, 100)
          } else {
            showYouWon = false; // Deja de mostrar la imagen después de 5 segundos
            timer.resume();
          }
        }else if(showYouLose){
          //se actualiza la vida después de la batalla
          mainCharacter.setLife(game.updateBattle(mainCharacter.getLife()));
          finishTime = millis() - startTime;
          if (finishTime < 5000) {
            image(youLose, 0, 0); // Muestra la imagen en (100, 100)
          } else {
            showYouLose = false; // Deja de mostrar la imagen después de 5 segundos
            
          }
      }else{
        mainCharacter.updateLifeBar(this);
        //JUEGO PLATAFORMAS
        mainCharacter.move(this, 2);
        mainCharacter.display(this);
        moveBackground();
        timer.time();
        // Mostrar plataformas
        Node platformNode = game.getPlatforms().PTR;
        while (platformNode != null) {
          Platform platform = (Platform) platformNode.info;
          if(platform.getIndex() == 2){
              platform.display(this);
          }
          platformNode = platformNode.next;
        }
        
        // Verificar colisión con plataformas
        if (CollisionDetector.isColliding(2, mainCharacter, (SimpleList)game.getPlatforms(), backgroundOffset)) {
          mainCharacter.setOnGround(true);
        } else {
          mainCharacter.setOnGround(false);
        }
        
        //CONTROL DE BATALLAS
        if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset >= 5000 && !booleanBattle2){
          print("llegue");
          game.nextBattle();
          booleanBattle2 = true;
        }
      }
    }else if(map3){
      image(backgroundImage3, -backgroundOffset, 0);
        //BATALLAS EN JUEGO
        if (game.isBattleActive()) {
          timer.pause();
          game.updateBattle(mainCharacter.getLife());
        } else if(showYouWon){
          //se actualiza la vida después de la batalla
          mainCharacter.setLife(game.updateBattle(mainCharacter.getLife()));
          finishTime = millis() - startTime;
          if (finishTime < 5000) {
            image(youWon, 0, 0); // Muestra la imagen en (100, 100)
          } else {
            showYouWon = false; // Deja de mostrar la imagen después de 5 segundos
            timer.resume();
          }
        }else if(showYouLose){
          //se actualiza la vida después de la batalla
          mainCharacter.setLife(game.updateBattle(mainCharacter.getLife()));
          finishTime = millis() - startTime;
          if (finishTime < 5000) {
            image(youLose, 0, 0); // Muestra la imagen en (100, 100)
          } else {
            showYouLose = false; // Deja de mostrar la imagen después de 5 segundos
            
          }
        }else{
          mainCharacter.updateLifeBar(this);
          //JUEGO PLATAFORMAS
          mainCharacter.move(this, 3);
          mainCharacter.display(this);
          moveBackground();
          timer.time();
          // Mostrar plataformas
          Node platformNode = game.getPlatforms().PTR;
          while (platformNode != null) {
            Platform platform = (Platform) platformNode.info;
            if(platform.getIndex() == 3){
                platform.display(this);
            }
            platformNode = platformNode.next;
          }
          
          // Verificar colisión con plataformas
          if (CollisionDetector.isColliding(3, mainCharacter, (SimpleList)game.getPlatforms(), backgroundOffset)) {
            mainCharacter.setOnGround(true);
          } else {
            mainCharacter.setOnGround(false);
          }
          
          //CONTROL DE BATALLAS
          if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset >= 7000 && !booleanBattle3){
            print("llegue");
            game.nextBattle();
            booleanBattle3 = true;
          }
        }
    }
  }
  
  textFont(mouse);
  text("mouseX "+ mouseX + " mouseY " + mouseY + " offsetX " + backgroundOffset + " Total " + (int(mouseX) + backgroundOffset), 20, 20);
}

void mousePressed() {
  
  float dx1 = 922, dy1 = 297, ix1 = 560, iy1 = 297;
  float dx2 = 974, dy2 = 358, ix2 = 509, iy2 = 358;
  float dx3 = 922, dy3 = 410, ix3 = 560, iy3 = 410;

  if (screen == 0) {
    if (mouseX>78 && mouseX<583 && mouseY>300 && mouseY<352) {
      screen = 1;
    } else if (mouseX>154 && mouseX<507 && mouseY>418 && mouseY<468) {
      screen = 2;
    } else if (mouseX>869 && mouseX<1426 && mouseY>356 && mouseY<412) {
      screen = 3;
    } else if (mouseX>945 && mouseX<1350 && mouseY>480 && mouseY<538) {
      screen = 4;
    }
  } else if (screen == 1) {
    if (isPointInTriangle(mouseX, mouseY, dx1, dy1, dx2, dy2, dx3, dy3)) {
      characterSelector.nextCharacter();
    } else if (isPointInTriangle(mouseX, mouseY, ix1, iy1, ix2, iy2, ix3, iy3)) {
      characterSelector.prevCharacter();
    } else if (mouseX > 20 && mouseX < 141 && mouseY > 29 && mouseY < 49) {
      screen = 0;
    } else if (mouseX > 694 && mouseX <792 && mouseY >600 && mouseY <650) {
      screen = 5;
      timer.start();
    }
  } else if(screen == 5 && !game.isBattleActive()){
      if(mouseX>290 && mouseX<378 && mouseY>509 && mouseY<556){
        map1 = true;
        map2 = false;
        map3 = false;
      }else if(mouseX>1141 && mouseX<1245 && mouseY>637 && mouseY<692){
        if(levelLocked2){
          
        }else{
          map1 = false;
          map2 = true;
          map3 = false;
        }
      }else if(mouseX>718 && mouseX<839 && mouseY>623 && mouseY<688){
        if(levelLocked3){
          
        }else{
          map1 = false;
          map2 = false;
          map3 = true;
        }
      }
  } else if (screen == 2 || screen == 3 || screen == 4) {
    if (mouseX > 20 && mouseX < 141 && mouseY > 29 && mouseY < 49) {
      screen = 0;
    }
  }
  
  if (game.isBattleActive()) {
    game.mousePressed();
  }
}

// Control de movimiento
void keyPressed() {
  // Activar las variables de movimiento al presionar teclas
  if (key == ' ' || key == 'W') {
    mainCharacter.setMoveUp(true);
  }
  if (key == 's' || key == 'S') {
    mainCharacter.setMoveDown(true);
  }
  if (key == 'a' || key == 'A') {
    mainCharacter.setMoveLeft(true);
  }
  if (key == 'd' || key == 'D') {
    mainCharacter.setMoveRight(true);
  }
  if (key == 'n') {  // Siguiente canción
    game.nextSong();
  } else if (key == 'p') {  // Canción anterior
    game.previousSong();
  }
}

void keyReleased() {
  // Desactivar las variables de movimiento al soltar teclas
  if (key == ' ' || key == 'W') {
    mainCharacter.setMoveUp(false);
  }
  if (key == 's' || key == 'S') {
    mainCharacter.setMoveDown(false);
  }
  if (key == 'a' || key == 'A') {
    mainCharacter.setMoveLeft(false);
  }
  if (key == 'd' || key == 'D') {
    mainCharacter.setMoveRight(false);
  }
}

void moveBackground(){
  if (mainCharacter.gifPlayer.getX() > width - 150 && backgroundOffset < backgroundWidth - width) {
    if (mainCharacter.getMoveRight()) {
      backgroundOffset += mainCharacter.getSpeed(); // Desplazar el principalPage a la derecha
    }  
  }
  if (mainCharacter.gifPlayer.getX() < 150 && backgroundOffset > 0) {
    if (mainCharacter.getMoveLeft()) {
      backgroundOffset -= mainCharacter.getSpeed(); // Desplazar el principalPage a la izquierda
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
