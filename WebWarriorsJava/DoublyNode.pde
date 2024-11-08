public class DoublyNode extends Node {
  private Node prev;  // Puntero al nodo anterior

  public DoublyNode(Object info) {
    super(info);
    this.prev = null;
  }
  
  public Node getPrev() {
     return prev;
  }
  public void setPrev(Node prev) {
     this.prev = prev;
  }
}
