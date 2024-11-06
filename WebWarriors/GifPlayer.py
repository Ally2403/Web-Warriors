# -*- coding: utf-8 -*-
from ListaSimple import *

class GIFPlayer:
    def __init__(self, folder, num_frames, x=0, y=0, width=100, height=100, frame_delay=5, speed=5):
        self.frames = ListaSimple()  # Lista para almacenar los cuadros
        self.num_frames = num_frames  # Número total de cuadros
        self.frame_index = 0  # Índice del cuadro actual
        self.x = x  # Posición en x
        self.y = y  # Posición en y
        self.width = width  # Ancho del cuadro
        self.height = height  # Alto del cuadro
        self.frame_delay = frame_delay  # Retraso entre cuadros
        self.delay_counter = 0  # Contador para el retraso de los cuadros
        self.speed = speed

        # Cargar los cuadros en la lista
        for i in range(self.num_frames):
            filename = str(folder) + str(i) + ".png"
            frame = loadImage(filename)
            frame.resize(self.width, self.height)  # Redimensiona el cuadro si es necesario
            self.frames.agregar(frame)

    def display(self):
        noFill()
        stroke(255, 0, 0)  # Color del marco de colisión (rojo)
        rect(self.x + 22, self.y + 21, self.width - 50, self.height - 50)
        
        """Dibuja el cuadro actual en la posición especificada."""
        current_frame = self.frames.obtener(self.frame_index)  # Obtener el cuadro actual de la lista
        if current_frame:
            image(current_frame, self.x, self.y)
        # Avanza al siguiente cuadro
        self.delay_counter += 1
        # Avanza al siguiente cuadro solo si se alcanza el retraso deseado
        if self.delay_counter >= self.frame_delay:
            self.frame_index = (self.frame_index + 1) % self.num_frames  # Bucle de cuadros
            self.delay_counter = 0  # Reinicia el contador
            
    def move(self, direction):
        """Mueve el GIF en la dirección indicada (w, a, s, d)."""
        if direction == 'w':  # Arriba
            self.y -= self.speed
        elif direction == 's':  # Abajo
            self.y += self.speed
        elif direction == 'a':  # Izquierda
            self.x -= self.speed
        elif direction == 'd':  # Derecha
            self.x += self.speed
