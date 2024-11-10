import processing.sound.*;
WebWarriors game;
PImage backgroundImage;
PImage character, combate, youWon, youLose, next, textBox;
Character mainCharacter, enemy1, battleCharacter;
GifPlayer gifPlayer;
boolean showYouWon = false, showYouLose = false;
int startTime, finishTime;
float backgroundOffset = 0; // Ancho total de la imagen de fondo
float backgroundWidth = 8000; // Ancho total de la imagen de fondo
PFont mouse = null;

boolean booleanBattle1 = false, booleanBattle2 = false, booleanBattle3 = false;
SimpleList battle1Texts, battle1xPositions, battle1yPositions, comments;
Battle battle1, battle2;

void setup(){
  mouse = createFont("PressStart2P.ttf", 20);
  size(1500, 720);
  backgroundImage = loadImage("FONDO MAPA VIDEOJUEGO.png");
  combate = loadImage("Combate.png");
  combate.resize(1500, 720);
  youWon = loadImage("you won.png");
  youWon.resize(width, height);
  youLose = loadImage("you won.png");
  youLose.resize(width, height);
  next = loadImage("next.png");
  textBox = loadImage("textBox.png");
  
  game = new WebWarriors(this);
  game.addSong("music1.mp3");
  game.addSong("music2.mp3");
  
  //Plataformas
  game.addPlatform(new Platform(0, 625, 465, 15));
  game.addPlatform(new Platform(465, 560, 168, 15));
  game.addPlatform(new Platform(633, 484, 353, 15));
  game.addPlatform(new Platform(986, 562, 166, 15));
  game.addPlatform(new Platform(1154, 625, 1713, 15));
  game.addPlatform(new Platform(1740, 500, 350, 15));
  game.addPlatform(new Platform(2195, 370, 350, 15));
  game.addPlatform(new Platform(2867, 565, 125, 15));
  game.addPlatform(new Platform(2993, 492, 688, 55));
  game.addPlatform(new Platform(3680, 630, 220, 15));
  game.addPlatform(new Platform(3900, 545, 352, 15));
  game.addPlatform(new Platform(4252, 630, 910, 15));
  game.addPlatform(new Platform(5162, 580, 168, 15));
  game.addPlatform(new Platform(5332, 500, 355, 15));
  game.addPlatform(new Platform(5685, 575, 166, 15));
  game.addPlatform(new Platform(5852, 627, 1240, 15));
  game.addPlatform(new Platform(6074, 472, 352, 15));
  game.addPlatform(new Platform(6527, 355, 352, 15));
  game.addPlatform(new Platform(7096, 560, 126, 15));
  game.addPlatform(new Platform(7223, 488, 688, 55));
  
  mainCharacter = new Character(this, "F", 5, 0, 0, 5);
  
  battleCharacter = new Character(this, "B", 10, 200, 300, 5);
  enemy1 = new Character(this, "A", 10, 1000, 0, 5);
  
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
  battle1 = new Battle(this, battle1Texts, battle1xPositions, battle1yPositions, game, comments);
  battle2 = new Battle(this, battle1Texts, battle1xPositions, battle1yPositions, game, comments); // Puedes personalizar otra batalla
  
  // Agregar batallas a WebWarriors
  game.addBattle(battle1);
  game.addBattle(battle2);
  
}

void draw(){
  image(backgroundImage, -backgroundOffset, 0);
  //BATALLAS EN JUEGO
  if (game.isBattleActive()) {
    game.updateBattle();
    battleCharacter.display(this);
    enemy1.display(this);
  } else if(showYouWon){
    finishTime = millis() - startTime;
    if (finishTime < 5000) {
      image(youWon, 0, 0); // Muestra la imagen en (100, 100)
    } else {
      showYouWon = false; // Deja de mostrar la imagen después de 5 segundos
    }
  }else if(showYouLose){
    finishTime = millis() - startTime;
    if (finishTime < 5000) {
      image(youLose, 0, 0); // Muestra la imagen en (100, 100)
    } else {
      showYouLose = false; // Deja de mostrar la imagen después de 5 segundos
    }
  }else{
    //JUEGO PLATAFORMAS
    mainCharacter.move(this);
    mainCharacter.display(this);
    moveBackground();
    
    // Mostrar plataformas
    Node platformNode = game.getPlatforms().PTR;
    while (platformNode != null) {
      Platform platform = (Platform) platformNode.info;
      platform.display(this);
      platformNode = platformNode.next;
    }
    
    // Verificar colisión con plataformas
    if (CollisionDetector.isColliding(mainCharacter, game.getPlatforms(), backgroundOffset)) {
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
    }else if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset >= 5000 && !booleanBattle2){
      print("llegue");
      game.nextBattle();
      booleanBattle2 = true;
    }else if(mainCharacter.gifPlayer.getX() + mainCharacter.gifPlayer.getWidth() + backgroundOffset >= 7000 && !booleanBattle3){
      print("llegue");
      game.nextBattle();
      booleanBattle3 = true;
    }
    text("Press T for next battle", 50, 100);
  }
  
  textFont(mouse);
  text("mouseX "+ mouseX + " mouseY " + mouseY + " offsetX" + backgroundOffset + " Total" + (int(mouseX) + backgroundOffset), 20, 20);
}

void mousePressed() {
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
      backgroundOffset += mainCharacter.getSpeed(); // Desplazar el fondo a la derecha
    }  
  }
  if (mainCharacter.gifPlayer.getX() < 150 && backgroundOffset > 0) {
    if (mainCharacter.getMoveLeft()) {
      backgroundOffset -= mainCharacter.getSpeed(); // Desplazar el fondo a la izquierda
    }  
  }
}
