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
  mainCharacter = new Character(this, "F", 5, 0, 0, 5);
  
}

void draw(){
  image(backgroundImage, -backgroundOffset, 0);
  //game.displayCurrentSong();
  mainCharacter.move(this);
  mainCharacter.display(this);
  moveBackground();
  textFont(mouse);
  text("mouseX "+ mouseX + " mouseY " + mouseY, 20, 20);
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
