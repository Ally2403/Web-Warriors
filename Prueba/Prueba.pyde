fondo = None
play = None
howToPlay = None
credits = None
setting = None
mouse = None
pantalla = 0

def setup():
   global fondo, mouse, play, howToPlay, credits, setting
   size(1500, 700)
   mouse = createFont("Arial Bold", 30)
   fondo = loadImage("Start.png")
   play = loadImage("Main Page.png")
   howToPlay = loadImage("How To Play.png")
   credits = loadImage("Credits.png")
   setting = loadImage("Settings.png")
      
def draw():
    background(0)
    if (pantalla == 0):
        image(fondo, 0, 0, width, height)
    elif (pantalla == 1):
        image(play, 0, 0, width, height)
    elif (pantalla == 2):
        image(credits, 0, 0, width, height)
    elif (pantalla == 3):
        image(howToPlay, 0, 0, width, height)
    elif (pantalla == 4):
        image(setting, 0, 0, width, height)
    textFont(mouse)
    text("mouseX "+ str(mouseX)+ "  mouseY"+ str(mouseY), 20, 20)
   
def mousePressed():
    global pantalla
    if(pantalla == 0):
        if(mouseX>78 and mouseX<582 and mouseY>292 and mouseY<342):
            pantalla = 1
        elif(mouseX>154 and mouseX<507 and mouseY>407 and mouseY<455):
            pantalla = 2
        elif(mouseX>870 and mouseX<1426 and mouseY>346 and mouseY<395):
            pantalla = 3
        elif(mouseX>946 and mouseX<1350 and mouseY>467 and mouseY<522):
            pantalla = 4
    elif(pantalla == 1 or pantalla == 2 or pantalla == 3 or pantalla == 4):
        if(mouseX>21 and mouseX<141 and mouseY>27 and mouseY<48):
            pantalla = 0
