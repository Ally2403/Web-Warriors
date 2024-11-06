from GifPlayer import *

keys_pressed = set()
background_image = None  # Variable para almacenar la imagen de fondo

# Configuración del sketch
def setup():
    global gif_player, backgroundImage
    size(1500, 720)  # Ajusta el tamaño de la ventana según sea necesario
    gif_player = GIFPlayer("F", num_frames=5, x=0, y=0)
    backgroundImage = loadImage("prueba.png")

def draw():
    image(backgroundImage, 0, 0)
    gif_player.display()  # Muestra la animación

    if 'w' in keys_pressed:
        gif_player.move('w')
    if 's' in keys_pressed:
        gif_player.move('s')
    if 'a' in keys_pressed:
        gif_player.move('a')
    if 'd' in keys_pressed:
        gif_player.move('d')

def keyPressed():
    # Añadir la tecla presionada al conjunto
    keys_pressed.add(key)

def keyReleased():
    # Remover la tecla cuando se suelta
    keys_pressed.discard(key)
