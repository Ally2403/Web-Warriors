import processing.sound.*;

public class WebWarriors {
  private List playlist;
  private SoundFile currentPlayer;
  private DoublyNode currentSong;
  private PApplet app;
  private List platforms;
  private List battleList; // Lista de batallas
  private List spikes;
  private int activeBattleIndex = 0; // Índice de la batalla activa
  private boolean battleState = false; // Controla si una batalla está en curso
  private boolean count = true;
  private SoundFile jumpSound;
  private SoundFile spikeHitSound;
  private SoundFile portalSound;
  private SoundFile bonusSound;
  private SoundFile victorySound;
  private SoundFile virusAttackSound;
  private SoundFile characterAttackSound;
  private int songStartTime;   // Momento en que inició la canción
  private int songDuration;    // Duración de la canción en milisegundos

  public WebWarriors(PApplet app) {
    this.app = app;
    this.playlist = new CircularDoublyList();
    this.platforms = new SimpleList();
    this.battleList = new SimpleList();
    this.spikes = new SimpleList();
    
    jumpSound = new SoundFile(app, "salto.mp3");
    spikeHitSound = new SoundFile(app, "dañoPincho.mp3");
    portalSound = new SoundFile(app, "portal.mp3");
    bonusSound = new SoundFile(app, "bonus.mp3");
    victorySound = new SoundFile(app, "victory.mp3");
    virusAttackSound = new SoundFile(app, "virusAttack.mp3");
    characterAttackSound = new SoundFile(app, "puños.mp3");

  }
  
  //BATTLE METHODS
  public void setActiveBattle(int index){
    this.activeBattleIndex = index;
  }
  
  public boolean isBattleActive() {
    return battleState;
  }

  public void setBattleState(boolean state) {
    this.battleState = state;
  }

  public void addBattle(Battle battle) {
    this.battleList.addNode(battle);
  }

  public void startBattle(int life) {
    if (((SimpleList)battleList).size() > 0) {
      Battle battle = (Battle) ((SimpleList)battleList).getNode(activeBattleIndex);
      battleState = true;
      battle.start(life); 
    }
  }

  public void nextBattle(int life) {
    if (activeBattleIndex < ((SimpleList)battleList).size() - 1) {
      activeBattleIndex++;
      startBattle(life);
    }
  }

  public int updateBattle(int life) {
    Battle battle = (Battle) ((SimpleList)battleList).getNode(activeBattleIndex);
    if (battleState && ((SimpleList)battleList).size() > 0) {
      app.image(combate, 0, 0);
      if(count){
        //se pasa la información de la vida en el juego
        battle.setPlayerHealth(life);
        count = false;
      }
      
      battle.updatePlayerLifeBar(app);
      battle.updateEnemyLifeBar(app);
      battle.displayStatus();
      battle.displaySquares();
      battle.displayTurn();
      if(battle.getEnemyHealth() == 0 || battle.getPlayerHealth() == 0){
        battleState = false;
        count = true;
      }
    }
    //se pasa la información de la vida después de la batalla
    return battle.getPlayerHealth();
  }

  public void mousePressed() {
    if (battleState && ((SimpleList)battleList).size() > 0) {
      Battle battle = (Battle) ((SimpleList)battleList).getNode(activeBattleIndex);
      battle.mousePressed();
    }
  }

  
  public List getPlaylist(){
    return this.playlist;
  }
  
  public void addSong(Object song){
    this.playlist.addNode(song);
    setupPlaylist();
  }
  
  public void addPlatform(Object platform){
    this.platforms.addNode(platform);
  }
  
  public List getPlatforms(){
    return this.platforms;
  }
  
  public void addSpike(Object spike){
    this.spikes.addNode(spike);
  }
  
  public List getSpikes(){
    return this.spikes;
  }

  private void setupPlaylist() {
    // Selecciona una canción aleatoria para comenzar
    currentSong = (DoublyNode) playlist.PTR;
    int randomStart = (int) app.random(0, ((CircularDoublyList)playlist).size());
    for (int i = 0; i <= randomStart; i++) {
      currentSong = (DoublyNode) currentSong.next;
    }
    playCurrentSong();
  }

  public void playCurrentSong() {
    if (currentPlayer != null && currentPlayer.isPlaying()) {
        currentPlayer.stop();
    }
    currentPlayer = new SoundFile(app, "data/" + (String) currentSong.info);
    
    // Verifica que el archivo se cargue correctamente antes de configurar el volumen
    if (currentPlayer != null) {
        currentPlayer.amp(0.3); // Silencia el volumen
        currentPlayer.play();
        
        // Iniciar temporizador para controlar la duración
        songStartTime = app.millis();
        songDuration = (int) (currentPlayer.duration() * 1000); // Convertir duración a milisegundos
    } else {
        System.out.println("Error al cargar la canción: " + currentSong.info);
    }
  }
  
  public SoundFile getCurrentPlayer(){
    return this.currentPlayer;
  }

  public void nextSong() {
    currentSong = (DoublyNode) currentSong.next;
    playCurrentSong();
  }

  public void previousSong() {
    currentSong = (DoublyNode) currentSong.prev;
    playCurrentSong();
  }
  
  public void checkSongEnd() {
    if (millis() - songStartTime >= songDuration) {
        nextSong();  // Cambiar a la siguiente canción
    }
  }

  public void displayCurrentSong() {
    app.text("Now Playing: " + currentSong.info + "\nPress n for next song or\np for previous song", 980, 30);
  }
  
  // EFECTOS DE SONIDO
  public void playJumpSound() {
    if (jumpSound != null) jumpSound.play();
  }
  
  public void playSpikeHitSound() {
    if (spikeHitSound != null) spikeHitSound.play();
  }
  
  public void playPortalSound() {
    if (portalSound != null) portalSound.play();
  }
  
  public void playBonusSound() {
    if (bonusSound != null) bonusSound.play();
  }
  
  public void playVictorySound() {
    if (victorySound != null) victorySound.play();
  }
  
  public void playVirusAttackSound() {
    if (virusAttackSound != null) virusAttackSound.play();
  }
  
  public void playCharacterAttackSound(){
    if (characterAttackSound != null) characterAttackSound.play();
  }
  
}
