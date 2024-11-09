public class Character {
  private GifPlayer gifPlayer;  // Instancia de GifPlayer para la animación
  private float speed;  // Velocidad de movimiento
  private float velocityY;
  private boolean onGround;
  private final float gravity = 0.5; // Fuerza de la gravedad
  private final float jumpStrength = -12; // Fuerza del salto

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
      this.velocityY = 0;
      this.onGround = false;
  }
  
  // Método para controlar el movimiento
  public void move(PApplet app) {
      if (moveLeft) {
          gifPlayer.setX(gifPlayer.getX() - speed);
      }
      if (moveRight) {
          gifPlayer.setX(gifPlayer.getX() + speed);
      }
      // Gravedad
      if (!onGround) {
        velocityY += gravity;  // La gravedad va aumentando la velocidad hacia abajo
        gifPlayer.setY(gifPlayer.getY() + velocityY);  // Mueve al personaje hacia abajo
      } else {
        velocityY = 0;  // Resetea la velocidad Y cuando está en el suelo
      }
      
      if (gifPlayer.getY() >= 600) {
        gifPlayer.setY(600);  // No deja que el personaje pase por debajo del suelo
        onGround = true;
      } else {
        onGround = false;
      }
      
      // Salto
      if (moveUp && onGround) {
        velocityY = jumpStrength;
        onGround = false;  
      }
      
      constrainBorders(app);
  }
  
  // Método para mostrar el GIF en la pantalla
  public void display(PApplet app) {
      gifPlayer.display(app);
  }
  
  public void constrainBorders(PApplet app){
    // Limitar la posición del personaje a los límites de la pantalla
        if (gifPlayer.getX() < 0) {
            gifPlayer.setX(0);
        }
        if (gifPlayer.getX() + gifPlayer.getWidth() > app.width) {
            gifPlayer.setX(app.width - gifPlayer.getWidth());
        }
        if (gifPlayer.getY() < 0) {
            gifPlayer.setY(0);
        }
        if (gifPlayer.getY() + gifPlayer.getHeight() > app.height) {
            gifPlayer.setY(app.height - gifPlayer.getHeight());
        }
  }
  
  // Getters
  public float getSpeed(){
    return this.speed;
  }
  
  public float getVelocityY(){
    return this.velocityY;
  }
  
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
