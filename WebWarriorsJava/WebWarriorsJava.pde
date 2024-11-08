import processing.sound.*;
WebWarriors game;
PImage backgroundImage;
PImage character;
Character mainCharacter;
GifPlayer gifPlayer;

void setup(){
  size(1500, 720);
  backgroundImage = loadImage("prueba.png");
  game = new WebWarriors(this);
  mainCharacter = new Character(this, "F", 5, 0, 0, 5);
}

void draw(){
  image(backgroundImage, 0, 0);
  //game.displayCurrentSong();
  mainCharacter.move();
  mainCharacter.display(this);
}


// Control de movimiento
void keyPressed() {
  // Activar las variables de movimiento al presionar teclas
  if (key == 'w' || key == 'W') {
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
  if (key == 'w' || key == 'W') {
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
