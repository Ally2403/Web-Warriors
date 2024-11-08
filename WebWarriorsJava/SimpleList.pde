public class SimpleList extends List{

  // Constructor de SimpleList
  public SimpleList() {
    super();
  }

  // Método para agregar un nodo a la lista
  public void addNode(Object info) {
    Node newNode = new SimpleNode(info);  // Crea un nuevo nodo
    if (PTR == null) {  // Si la lista está vacía
      PTR = newNode;
      FINAL = newNode;
    } else {
      FINAL.next = newNode;  // Enlaza el último nodo con el nuevo nodo
      FINAL = newNode;       // Actualiza el puntero al último nodo
    }
  }
  
  public void show() {
    Node x = PTR;  // Iniciar en el primer nodo
    while (x != null) {  // Recorrer mientras el nodo actual no sea null
        System.out.println(x.info);  // Imprimir la información del nodo
        x = x.next;  // Avanzar al siguiente nodo
    }
  }

  // Método para obtener un nodo por su índice
  public Object getNode(int index) {
    Node current = PTR;
    int i = 0;
    while (current != null) {
      if (i == index) {
        return current.info;  // Devuelve la información del nodo
      }
      current = current.next;  // Avanza al siguiente nodo
      i++;
    }
    return null;  // Si el índice es inválido
  }
}
