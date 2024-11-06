# -*- coding: utf-8 -*-

from NodoSimple import *

# Lista circular que contiene los nodos de canciones
class ListaCircular:
    def __init__(self):
        self.PTR = None  # Primer nodo
        self.FINAL = None  # Último nodo
        self.x = None  # Nodo actual (el que está reproduciéndose)

    def addSong(self, songName):
        newNode = NodoSimple(songName)  # Crear un nuevo nodo para la canción
        if self.PTR is None:  # Si la lista está vacía, inicializamos la cabeza y cola
            self.PTR = newNode
            self.FINAL = newNode
            self.PTR.sig = self.PTR  # Apuntamos al primer nodo (circular)
        else:
            self.FINAL.sig = newNode  # El nodo anterior apunta al nuevo nodo
            self.FINAL = newNode  # El nuevo nodo es ahora la cola
            self.FINAL.sig = self.PTR  # El último nodo apunta al primero (circular)

    def playNext(self):
        if self.x is None:  # Si no hay nodo actual, comenzamos desde el primero
            self.x = self.PTR
        else:
            self.x = self.x.sig  # Avanzamos al siguiente nodo
        print("Reproduciendo:", self.x.songName)  # Aquí se podría cargar la música

# Lista de canciones
songs = ["song1.mp3", "song2.mp3", "song3.mp3"]
songList = ListaCircular()

# Agregar canciones a la lista circular
for song in songs:
    songList.addSong(song)
