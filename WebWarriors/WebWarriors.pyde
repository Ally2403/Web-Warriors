from GifPlayer import *

# Configuración del sketch
def setup():
    global gif_player
    size(1500, 720)  # Ajusta el tamaño de la ventana según sea necesario
    gif_player = GIFPlayer("F", num_frames=5, x=0, y=0)

def draw():
    background(255)  # Fondo blanco
    gif_player.display()  # Muestra la animación
