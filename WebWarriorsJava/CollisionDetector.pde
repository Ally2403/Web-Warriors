public static class CollisionDetector {
  
  public static boolean isColliding(int index, Character character, SimpleList platforms, float backgroundOffset) {
    Node current = platforms.PTR;
    while (current != null) {
      Platform platform = (Platform) current.info;
      if(platform.getIndex() == index){
          if (isCollidingWithPlatform(character, platform, backgroundOffset)) {
            return true;
          }
      }
      current = current.next;
    }
    return false;
  }

  private static boolean isCollidingWithPlatform(Character character, Platform platform, float backgroundOffset) {
    // Verificar colisión por coordenadas
    float characterX = character.gifPlayer.getX();
    float characterY = character.gifPlayer.getY();
    float characterWidth = character.gifPlayer.getWidth();
    float characterHeight = character.gifPlayer.getHeight();
    
    float platformX = platform.getX() - backgroundOffset;
    float platformY = platform.getY();
    float platformWidth = platform.getWidth();
    float platformHeight = platform.getHeight();
    
    // Verificar colisión por los lados (eje X)
    boolean collisionX = (characterX + characterWidth > platformX && characterX < platformX + platformWidth);
    
    // Verificar colisión por abajo (eje Y)
    boolean collisionY = (characterY + characterHeight <= platformY && 
                           characterY + characterHeight + character.getVelocityY() >= platformY);

    if (collisionX && collisionY) {
      return true;  // Hay colisión en ambos ejes
    }
    return false;
  }
  
  // Método para manejar las colisiones laterales y evitar que el character atraviese las plataformas
  public static void handleSideCollision(Character character, Platform platform, float backgroundOffset) {
    float characterX = character.gifPlayer.getX();
    float characterY = character.gifPlayer.getY();
    float characterWidth = character.gifPlayer.getWidth();
    float characterHeight = character.gifPlayer.getHeight();
    
    float platformX = platform.getX() - backgroundOffset;
    float platformY = platform.getY();
    float platformWidth = platform.getWidth();
    float platformHeight = platform.getHeight();

    // Verificar si el character está dentro del rango vertical de la plataforma
    boolean isAtPlatformHeight = characterY + characterHeight > platformY && characterY < platformY + platformHeight;

    // Si hay colisión lateral y el character está en el rango de la altura de la plataforma, detenerlo
    if (isAtPlatformHeight) {
      // Si esta a la derecha y se mueve a la izquierda lo detiene
      if (characterX < platformX + platformWidth && characterX > platformX) {
        character.gifPlayer.setX(platformX + platformWidth);
        character.setVelocityX(0); // Detener el movimiento en el eje X
      }
      // Si esta a la izquierda y se mueve hacia la derecha lo detiene
      if (characterX + characterWidth > platformX && characterX + characterWidth < platformX + platformWidth - 10) {
        character.gifPlayer.setX(platformX - characterWidth);
        character.setVelocityX(0); // Detener el movimiento en el eje X
      }
    }
  }
  
  public static boolean isCollidingWithSpikes(int index, Character character, SimpleList spikes, float backgroundOffset) {
    Node current = spikes.PTR;
    while (current != null) {
      Spike spike = (Spike) current.info;
      // Coordenadas del personaje
      float characterX = character.gifPlayer.getX();
      float characterY = character.gifPlayer.getY();
      float characterWidth = character.gifPlayer.getWidth();
      float characterHeight = character.gifPlayer.getHeight();

      // Coordenadas del spike, ajustadas al offset del fondo
      float spikeX = spike.getX() - backgroundOffset;
      float spikeY = spike.getY();
      float spikeWidth = spike.getWidth();
      float spikeHeight = spike.getHeight();

      // Verificar colisión por coordenadas
      boolean collisionX = characterX < spikeX + spikeWidth && characterX + characterWidth > spikeX;
      boolean collisionY = characterY < spikeY + spikeHeight && characterY + characterHeight > spikeY;

      if (collisionX && collisionY && spike.getIndex() == index) {
          return true; // Colision
      }

      current = current.next; 
    }
    return false; // No hay colisión

  }  

}
