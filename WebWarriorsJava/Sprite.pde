public class Sprite{
  protected float spriteWidth;
  protected float spriteHeight;
  private int positionX;
  private int positionY;
  protected String ruta;
  
  public Sprite(String ruta){
    this.ruta = ruta;
    this.positionX = positionX;
    this.positionY = positionY;
    this.spriteWidth = width;
    this.spriteHeight = height;
}

  public Sprite(String ruta, float spriteWidth, float spriteHeight){
      this.ruta = ruta;
      this.spriteWidth = spriteWidth;
      this.spriteHeight = spriteHeight;
  }
  
  // Getters
  public String getRuta() {
    return this.ruta;
  }
  
  public int getPositionX(){
    return this.positionX;
  }
  
  public int getPositionY(){
    return this.positionY;
  }

}
