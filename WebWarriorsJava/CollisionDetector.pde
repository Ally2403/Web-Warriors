public class CollisionDetector {
  
  private SimpleList platforms;

  public CollisionDetector(SimpleList platforms) {
    this.platforms = platforms;
  }

  // Método que verifica si el personaje colisiona con alguna plataforma
  public boolean checkCollision(Character character) {
    Node current = platforms.PTR;
    while(current != null){
      Platform platform = (Platform) current.info;
      if (character.gifPlayer.getX() + character.gifPlayer.getWidth() > platform.getX() && character.gifPlayer.getX() < platform.getX() + platform.getWidth() && character.gifPlayer.getY() + character.gifPlayer.getHeight() <= platform.getY() && character.gifPlayer.getY() + character.gifPlayer.getHeight() + character.getVelocityY() >= platform.getY()) {
        return true;  
      }
      current = current.next;
    }
    return false;
  }

}
