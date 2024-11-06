# -*- coding: utf-8 -*-

# Nodo que representa cada canción
class NodoSimple:
    def __init__(self, songName):
        self.songName = songName  # Nombre de la canción
        self.sig = None  # Enlace al siguiente nodo
