import processing.sound.*;
WebWarriors game;
PImage backgroundImage;
PImage character;
Character mainCharacter;
GifPlayer gifPlayer;
float backgroundOffset = 0; // Ancho total de la imagen de fondo
float backgroundWidth = 8000; // Ancho total de la imagen de fondo
PFont mouse = null;

void setup(){
  mouse = createFont("Arial Bold", 30);
  size(1500, 720);
  backgroundImage = loadImage("FONDO MAPA VIDEOJUEGO.png");
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
  
}

void draw(){
  image(backgroundImage, -backgroundOffset, 0);
  //game.displayCurrentSong();
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
  
  textFont(mouse);
  text("mouseX "+ mouseX + " mouseY " + mouseY + " offsetX" + backgroundOffset + " Total" + (int(mouseX) + backgroundOffset), 20, 20);
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
    if (keyPressed && (key == 'd')) {
      backgroundOffset += mainCharacter.getSpeed(); // Desplazar el fondo a la derecha
    }  
  }
  if (mainCharacter.gifPlayer.getX() < 150 && backgroundOffset > 0) {
    if (keyPressed && (key == 'a'  )) {
      backgroundOffset -= mainCharacter.getSpeed(); // Desplazar el fondo a la izquierda
    }  
  }
}
