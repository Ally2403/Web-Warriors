import processing.sound.*;

public class WebWarriors {
  private CircularDoublyList playlist;
  private SoundFile currentPlayer;
  private DoublyNode currentSong;
  private PApplet app;

  public WebWarriors(PApplet app) {
    this.app = app;
    this.playlist = new CircularDoublyList();
    setupPlaylist();
  }

  private void setupPlaylist() {
    playlist.addNode("music1.mp3");
    playlist.addNode("music2.mp3");
    // Selecciona una canción aleatoria para comenzar
    currentSong = (DoublyNode) playlist.PTR;
    int randomStart = (int) app.random(playlist.size());
    for (int i = 0; i < randomStart; i++) {
      currentSong = (DoublyNode) currentSong.next;
    }
    playCurrentSong();
  }

  public void playCurrentSong() {
    if (currentPlayer != null && currentPlayer.isPlaying()) {
      currentPlayer.stop();
    }
    currentPlayer = new SoundFile(app, "data/" + (String) currentSong.info);
    currentPlayer.play();
  }

  public void nextSong() {
    currentSong = (DoublyNode) currentSong.next;
    playCurrentSong();
  }

  public void previousSong() {
    currentSong = (DoublyNode) currentSong.prev;
    playCurrentSong();
  }

  public void displayCurrentSong() {
    app.background(255);
    app.textSize(24);
    app.fill(0);
    app.textAlign(PApplet.CENTER, PApplet.CENTER);
    app.text("Now Playing: " + currentSong.info, app.width / 2, app.height / 2);
  }
}
