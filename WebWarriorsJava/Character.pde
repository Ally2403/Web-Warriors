public class Character {
  private GifPlayer gifPlayer;  // Instancia de GifPlayer para la animación
  private float speed;  // Velocidad de movimiento

  // Variables de movimiento
  private boolean moveUp;
  private boolean moveDown;
  private boolean moveLeft;
  private boolean moveRight;
  
  public Character(PApplet app, String folder, int numFrames, float x, float y, float speed) {
      this.gifPlayer = new GifPlayer(app, folder, numFrames, x, y);
      this.speed = speed;
      this.moveUp = false;
      this.moveDown = false;
      this.moveLeft = false;
      this.moveRight = false;
  }
  
  // Método para controlar el movimiento
  public void move() {
      if (moveUp) {
          gifPlayer.setY(gifPlayer.getY() - speed);
      }
      if (moveDown) {
          gifPlayer.setY(gifPlayer.getY() + speed);
      }
      if (moveLeft) {
          gifPlayer.setX(gifPlayer.getX() - speed);
      }
      if (moveRight) {
          gifPlayer.setX(gifPlayer.getX() + speed);
      }
  }
  
  // Método para mostrar el GIF en la pantalla
  public void display(PApplet app) {
      gifPlayer.display(app);
  }
  
  // Getters
  
  
  // Setters
  public void setMoveUp(boolean moveUp) {
    this.moveUp = moveUp;
  }
  
  public void setMoveDown(boolean moveDown) {
    this.moveDown = moveDown;
  }
  
  public void setMoveLeft(boolean moveLeft) {
    this.moveLeft = moveLeft;
  }
  
  public void setMoveRight(boolean moveRight) {
    this.moveRight = moveRight;
  }
  
  
}
