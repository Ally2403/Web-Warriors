# -*- coding: utf-8 -*-

class GIFPlayer:
    def __init__(self, folder, num_frames, x=0, y=0, frame_delay=5):
        self.frames = []  # Lista para almacenar los cuadros
        self.num_frames = num_frames  # Número total de cuadros
        self.frame_index = 0  # Índice del cuadro actual
        self.x = x  # Posición en x
        self.y = y  # Posición en y
        #self.width = width  # Ancho del cuadro
        #self.height = height  # Alto del cuadro
        self.frame_delay = frame_delay  # Retraso entre cuadros
        self.delay_counter = 0  # Contador para el retraso de los cuadros

        # Cargar los cuadros en la lista
        for i in range(self.num_frames):
            filename = str(folder) + str(i) + ".png"
            frame = loadImage(filename)
            #frame.resize(self.width, self.height)  # Redimensiona el cuadro si es necesario
            self.frames.append(frame)

    def display(self):
        """Dibuja el cuadro actual en la posición especificada."""
        image(self.frames[self.frame_index], self.x, self.y)
        # Avanza al siguiente cuadro
        self.delay_counter += 1
        # Avanza al siguiente cuadro solo si se alcanza el retraso deseado
        if self.delay_counter >= self.frame_delay:
            self.frame_index = (self.frame_index + 1) % self.num_frames  # Bucle de cuadros
            self.delay_counter = 0  # Reinicia el contador
