public class DoublyList extends List {
  private DoublyNode current; // Nodo actual del personaje seleccionado
  
  private int characterNumber;

  // Constructor
  public DoublyList() {
    super();
    this.characterNumber = 1;
    this.current = null;
  }

  // Método para agregar un personaje (imagen) a la lista
  @Override
  public void addNode(Object info) {
    DoublyNode newNode = new DoublyNode(info);
    if (this.PTR == null) {  // Si la lista está vacía
      this.PTR = newNode;
      this.FINAL = newNode;
      this.current = newNode;
    } else {
      this.FINAL.setNext(newNode);           // El último nodo apunta al nuevo nodo
      newNode.setPrev((DoublyNode) this.FINAL);  // El nuevo nodo apunta al anterior
      this.FINAL = newNode;                // Actualiza el último nodo
    }
    // Hacer la lista circular
    this.FINAL.setNext(this.PTR);
    ((DoublyNode) this.PTR).setPrev((DoublyNode) this.FINAL);
  }
  
  // Método para avanzar al siguiente personaje
  public void nextCharacter() {
    if (this.current != null) {
      this.current = (DoublyNode) this.current.getNext();
      this.characterNumber += 1;
      if(this.characterNumber == 6){
        this.characterNumber = 1;
      }
    }
  }

  // Método para retroceder al personaje anterior
  public void prevCharacter() {
    if (this.current != null) {
      this.current = (DoublyNode) this.current.getPrev();
      this.characterNumber -= 1;
      if(this.characterNumber == 0){
        this.characterNumber = 5;
      }
    }
  }

  // Método para mostrar el personaje actual
  public void displayCharacter() {
    if (this.current != null) {
      PImage characterImage = (PImage) this.current.getInfo();
      image(characterImage, 470, 125); // Ajusta las coordenadas según sea necesario
    }
  }
  
  public int getCharacterNumber(){
    return characterNumber;
  }
  
}
