public class CircularDoublyList extends List {

  // Constructor de CircularDoublyLinkedList
  public CircularDoublyList() {
    super();
  }

  // Método para agregar un nodo a la lista doblemente circular
  @Override
  public void addNode(Object info) {
    DoublyNode newNode = new DoublyNode(info);
    if (this.PTR == null) {  // Si la lista está vacía
      this.PTR = newNode;
      this.FINAL = newNode;
      this.FINAL.setNext(this.PTR);  // El siguiente del último nodo apunta al primero
      ((DoublyNode)this.PTR).setPrev(((DoublyNode)this.FINAL));    // El anterior del primer nodo apunta al último
    } else {
      this.FINAL.setNext(newNode);       // El último nodo apunta al nuevo nodo
      newNode.setPrev(((DoublyNode)this.FINAL));       // El nuevo nodo apunta al nodo anterior
      ((DoublyNode)this.PTR).setPrev(((DoublyNode)newNode));  // El primer nodo apunta hacia atrás al nuevo nodo
      this.FINAL = newNode;            // Actualiza el puntero al último nodo
      this.FINAL.setNext(this.PTR);           // El siguiente del último nodo apunta al primero
    }
  }
  
  public int size() {
    if (this.PTR == null) return 0;
    int count = 1;
    Node current = this.PTR;
    while (current.getNext() != this.PTR) {
      count++;
      current = current.getNext();
    }
    return count;
  }

}
