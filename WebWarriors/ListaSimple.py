# -*- coding: utf-8 -*-
class NodoSimple:
    def __init__(self, info):
        self.info = info  # El cuadro de imagen
        self.sig = None  # Referencia al siguiente nodo

class ListaSimple:
    def __init__(self):
        self.PTR = None  # Puntero al primer nodo
        self.FINAL = None  # Puntero al último nodo

    def agregar(self, info):
        # Crear un nuevo nodo con la imagen
        nuevo_nodo = NodoSimple(info)
        if self.PTR is None:  # Si la lista está vacía
            self.PTR = nuevo_nodo
            self.FINAL = nuevo_nodo
        else:
            self.FINAL.sig = nuevo_nodo  # Enlazar el último nodo con el nuevo nodo
            self.FINAL = nuevo_nodo  # Actualizar el puntero al último nodo

    def obtener(self, index):
        # Obtener un nodo por su índice (para acceder al cuadro de imagen)
        current = self.PTR
        i = 0
        while current:
            if i == index:
                return current.info  # Retorna la imagen del nodo en el índice
            current = current.sig
            i += 1
        return None  # Si el índice es inválido
