public class DoublyList extends List {

  // Constructor de DoublyLinkedList
  public DoublyList() {
    super();
  }

  // Método para agregar un nodo a la lista doblemente enlazada
  public void addNode(Object info) {
    DoublyNode newNode = new DoublyNode(info);
    if (PTR == null) {  // Si la lista está vacía
      PTR = newNode;
      FINAL = newNode;
    } else {
      FINAL.next = newNode;  // El último nodo apunta al nuevo nodo
      newNode.setPrev(((DoublyNode)FINAL));  // El nuevo nodo apunta al anterior
      FINAL = newNode;       // Actualiza el puntero al último nodo
    }
  }

  // Método para mostrar los nodos de la lista doblemente enlazada
  public void show() {
    Node x = PTR;  // Iniciar en el primer nodo
    while (x != null) {  // Recorrer mientras el nodo actual no sea null
      System.out.println(x.info);  // Imprimir la información del nodo
      x = x.next;  // Avanzar al siguiente nodo
    }
  }
}
